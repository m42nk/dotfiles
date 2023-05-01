local ok, db = pcall(require, "dashboard")

if not ok then
  return
end

local monke = {
  "",
  "B                                                B",
  "                                                  ",
  "                                                  ",
  "                                                  ",
  "                               G                  ",
  "                       GBB#######BG               ",
  "               GG      B#######&###               ",
  "             GBGGGGGGBBY77!??J57~J#GGB            ",
  "            GB?~~7B#G 7~~?55!:?55J Y?YB           ",
  "            B :^~^^BJ7^!7Y7Y5?YJYJ:^~YB           ",
  "            BB!:^:^  !:775GJ~~Y557^7 B            ",
  "             B5YJJ5#B55Y?Y?!^!!!?  GG             ",
  "               GGGG#GG B!::^:~!::JG               ",
  "                  B#GB ~::::::7^::JG              ",
  "                  GBBB!:::::::^7^:^               ",
  "                    J 7:^::::::~?^!               ",
  "                   B Y55 Y?77777YJ5G              ",
  "                  GB G5?Y##                       ",
  "                 GBBY BJ?BBG                      ",
  "             GGGBBB5 GBBBBGBBGG                   ",
  "          GBBG GBGY BBGBBBBGGBB GG                ",
  "         B#G5 BBB5GB GBBBBBBB G#BB                ",
  "        G#BGBBGBGJJ~^^!?Y GGJ:^ B#B               ",
  "B       G#BG55 B5~:::::::^^7^::^5 B              B",
  "",
  "",
}

db.custom_header = {
  "                                    oo            ",
  "                                                  ",
  "88d888b. .d8888b. .d8888b. dP   .dP dP 88d8b.d8b. ",
  "88'  `88 88ooood8 88'  `88 88   d8' 88 88'`88'`88 ",
  "88    88 88.  ... 88.  .88 88 .88'  88 88  88  88 ",
  "dP    dP `88888P' `88888P' 8888P'   dP dP  dP  dP ",
}

db.session_directory = vim.fn.stdpath "data" .. "/session"

db.custom_center = {
  {
    icon = "  ",
    desc = "Recently latest session                  ",
    shortcut = "SPC s l",
    action = "SessionLoad",
  },
  {
    icon = "  ",
    desc = "Recently opened files                   ",
    action = "DashboardFindHistory",
    shortcut = "SPC f h",
  },
  {
    icon = "  ",
    desc = "Find  File                              ",
    action = "Telescope find_files find_command=rg,--hidden,--files",
    shortcut = "SPC f f",
  },
  {
    icon = "  ",
    desc = "File Browser                            ",
    action = "Telescope file_browser",
    shortcut = "SPC f b",
  },
  {
    icon = "  ",
    desc = "Find  word                              ",
    action = "Telescope live_grep",
    shortcut = "SPC f w",
  },
}
