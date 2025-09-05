-- todo: add the following xml files as vim settings
-- <setting id="org.eclipse.jdt.core.formatter.tabulation.char" value="space"/>
-- <setting id="org.eclipse.jdt.core.formatter.wrap_before_assignment_operator" value="false"/>
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- don't format comments in Java (doesn't get activated -> jdtls is used as formatter)
vim.opt.formatoptions = "tjlr"
