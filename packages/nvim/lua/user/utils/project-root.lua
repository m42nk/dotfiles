local M = {}

-- Use project.nvim to get project root
-- other user module will require this instead
-- so that if any changes happens; only modified here
M.project_root = function()
  return require("project_nvim.project").get_project_root()
end

return M
