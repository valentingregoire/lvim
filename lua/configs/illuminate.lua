lvim.builtin.illuminate.active = true
lvim.autocommands = {
    {
        { "ColorScheme" },
        {
            pattern = "*",
            callback = function()
                vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#333444", underline = false, bold = false })
                vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#333444", underline = false, bold = false })
                vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#333444", underline = false, bold = false })
            end,
        },
    },
}
