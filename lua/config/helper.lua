GetTitle = function()
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":p")
  local shortpath = require("config.shortpaths")[cwd]
  if shortpath then
    return " " .. shortpath
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

