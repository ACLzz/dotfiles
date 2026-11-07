require("nvimlaunch").setup({
  keymaps = {
    run_restart  = "<cr>",      -- run or restart selected command
    stop         = "d",         -- stop selected command
    output       = "l",         -- open output window
    start_all    = "a",         -- start all commands
    start_group  = "g",         -- start all commands in current group
    reload       = "r",         -- reload .nvimlaunch config
    close        = { "q", "<Esc>" },  -- close panel
    output_close = "q",         -- close output window
    output_clear = "c",         -- clear output buffer
  },
})
