-- alpha
local alpha = lvim.builtin.alpha
alpha.active = true
alpha.mode = "dashboard"
alpha.dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}
-- alpha.dashboard.section.buttons.val = {
-- alpha.themes.dashboard.button("p", "  Projects",
--   ":lua require('telescope').extensions.projects.projects()<CR>"),
-- -- dashboard.button("s", "  Sessions", ":SessionManager load_session<CR>"),
-- alpha.dashboard.button("r", "ﭯ  Recent files", ":Telescope oldfiles<CR>"),
-- alpha.dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
-- alpha.dashboard.button("f", "  Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
-- alpha.dashboard.button("u", "ﮮ  Check updates", ":PackerSync<CR>"),
-- alpha.dashboard.button("c", "  Configuration", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
-- alpha.dashboard.button("q", "  Quit", ":qa<CR>"),
-- }
