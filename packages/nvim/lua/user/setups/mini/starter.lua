local starter = require "mini.starter"

local get_sessions = function()
  local ok, autosession = pcall(require, "auto-session")
  local items = {}
  if ok then
    local sess = autosession.get_session_files()
    -- items[#items] =
    for s in pairs(sess) do
      local sess_path = autosession.get_root_dir() .. sess[s].path
      items[#items] = {
        name = sess[s].display_name,
        action = "RestoreSession " .. sess_path,
        section = "Session",
      }
    end

    return items
  end
end

starter.setup {
  header = ""
    .. "                                    oo            \n"
    .. "                                                  \n"
    .. "88d888b. .d8888b. .d8888b. dP   .dP dP 88d8b.d8b. \n"
    .. "88'  `88 88ooood8 88'  `88 88   d8' 88 88'`88'`88 \n"
    .. "88    88 88.  ... 88.  .88 88 .88'  88 88  88  88 \n"
    .. "dP    dP `88888P' `88888P' 8888P'   dP dP  dP  dP \n",
  autoopen = true,
  items = {
    get_sessions(),
    starter.sections.recent_files(5, true),
    starter.sections.telescope(),
  },
  footer = " ",
}

require("user.utils.keymaps").nmap {
  ["<leader>d"] = { starter.open, "Open dashboard" },
}
