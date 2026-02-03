---@diagnostic disable: undefined-global
-- todo: add the following xml files as vim settings
-- <setting id="org.eclipse.jdt.core.formatter.tabulation.char" value="space"/>
-- <setting id="org.eclipse.jdt.core.formatter.wrap_before_assignment_operator" value="false"/>
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- don't format comments in Java (doesn't get activated -> jdtls is used as formatter)
vim.opt.formatoptions = "tjlr"

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local plugin_install_location = vim.fn.expand("~/.local/share/nvim/mason/packages")
local bundles = {
  vim.fn.glob(
    plugin_install_location .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
    true)
}

local java_test_bundles = vim.split(vim.fn.glob(plugin_install_location .. "/java-test/extension/server/*.jar", true),
  "\n")
local excluded = {
  "com.microsoft.java.test.runner-jar-with-dependencies.jar",
  "jacocoagent.jar",
}
for _, java_test_jar in ipairs(java_test_bundles) do
  local fname = vim.fn.fnamemodify(java_test_jar, ":t")
  if not vim.tbl_contains(excluded, fname) then
    table.insert(bundles, java_test_jar)
  end
end

local config = {
  name = "jdtls",
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = { "jdtls" },
  root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw' }),
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    java = {
    }
  },
  capabilities = capabilities,
  init_options = {
    bundles = bundles,
  },
}

config.settings.java = {
  appendBuildErrors = true,
  -- Ensure compiler warnings are enabled
  errors = {
    incompleteClasspath = "severe",
  },
  configuration = {
    updateBuildConfiguration = "interactive",
  },
  compiler = {
    complianceOptions = {
      ["org.eclipse.jdt.core.compiler.problem.unusedLocalVariable"] = "warning",
      ["org.eclipse.jdt.core.compiler.problem.unusedPrivateMember"] = "warning",
      ["org.eclipse.jdt.core.compiler.problem.unusedParameter"] = "warning",
      ["org.eclipse.jdt.core.compiler.problem.unusedImport"] = "warning",
    }
  },
  test = {
    defaultConfig = "quarkus",
  },
  format = {
    settings = {
      url = vim.fn.expand("~/Documents/eclipse-format.xml"),
      profile = "Quarkus",
    },
  },
  completion = {
    importOrder = {
      "java",
      "jakarta",
      "javax",
      "ai.timefold",
      "org",
      "com",
    },
  },
  sources = {
    organizeImports = {
      starThreshold = 999,
      staticStarThreshold = 999,
    },
  },
  eclipse = {
    downloadSources = true,
  },
  maven = {
    downloadSources = true,
  },
  implementationsCodeLens = {
    enabled = true,
  },
  referencesCodeLens = {
    enabled = true,
  },
  references = {
    includeDecompiledSources = true,
  },
  signatureHelp = { enabled = true },
  contentProvider = { preferred = "fernflower" },
}

require('jdtls').start_or_attach(config)
