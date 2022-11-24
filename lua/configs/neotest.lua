require("neotest").setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
            -- args = { "--rootdir=tests" },
            -- runner = "pytest",
            -- runner = "nose2",
            runner = "unittest",
            -- args = { "-t=src" }
            -- python = function()
            --     return PYTHON_VIRTUAL_ENV()
            -- end
        }),
        -- require("neotest-plenary"),
        -- require("neotest-vim-test")({
        --     ignore_file_types = { "python", "vim", "lua" },
        -- }),
    },
})
