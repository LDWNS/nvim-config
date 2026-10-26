GetTitle = function()
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":p")
  local shortpath = require("config.shortpaths")[cwd]
  if shortpath then
    return " " .. shortpath
  end

  if cwd:find("/Users/lukasdownes/Documents/ess/") then
    return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  end
  -- add neovim logo to title and ghostty logo
  --    ⛺︎                                   
  --                                      
  --                                      
  --                                      
  --                                      
  --                                      
  --                                      
  --                                      
  --                                      
  --                                     
  return " " .. cwd
end


Dump = function(t)
  return vim.json.encode(t)
end

PDump = function(t)
  print(vim.fn.system('jq .', Dump(t)))
end
