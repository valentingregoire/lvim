lvim.builtin.dap.active = true

-- https://github.com/rcarriga/nvim-dap-ui
local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
    return
end

local dap_virtual_text_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not dap_virtual_text_status_ok then
    return
end

lvim.builtin.dap.on_config_done = function()
    lvim.builtin.which_key.mappings["d"] = nil
    vim.api.nvim_set_hl(0, "DapBreakpoint", { bg = "#4B1515", ctermbg = 0 })
    -- vim.api.nvim_set_hl(0, "DapBreakpoint", { bg = "#2d202a", ctermbg = 0 })
end

-- Adapters
dap.adapters.python = {
    type = "executable",
    command = os.getenv("HOME") .. "/.virtualenvs/debugpy/bin/python",
    args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Default",
        pythonPath = PYTHON_VIRTUAL_ENV(),
        program = "${file}",
    },
    {
        type = "python",
        request = "launch",
        name = "backend",
        pythonPath = PYTHON_VIRTUAL_ENV(),
        program = "${file}",
        justMyCode = false,
        cwd = "${workspaceFolder}/backend"
    },
    {
        type = "python",
        request = "launch",
        name = "cwd/cwd",
        pythonPath = PYTHON_VIRTUAL_ENV(),
        program = "${file}",
        justMyCode = false,
        cwd = "${workspaceFolder}/{workspaceFolderBasename}",
    },
    {
        type = "python",
        request = "launch",
        name = "Tests",
        pythonPath = PYTHON_VIRTUAL_ENV(),
        program = "${file}",
        justMyCode = false,
        --[[ module = "nose2", ]]
        --[[ cwd = "${workspaceFolder}/src", ]]
        cwd = "${workspaceFolder}/src",
        env = {
            ARANGO_DB = "appstore-test",
        },
    },
    {
        type = "python",
        request = "launch",
        name = "Kubectl",
        pythonPath = PYTHON_VIRTUAL_ENV(),
        program = "${file}",
        justMyCode = true,
        cwd = "${workspaceFolder}/kubectl_app_store",
    }
}

-- dapui.setup({
--     layouts = {
--         {
--             elements = {
--                 "watches",
--                 { id = "scopes", size = 0.25 },
--                 "stacks",
--                 "breakpoints",
--             },
--             size = 0.25,
--             position = "right",
--         },
--         {
--             elements = {
--                 "repl",
--                 --[[ { id = "repl", size = 0.7 }, ]]
--                 --[[ "console", ]]
--             },
--             size = 0.3,
--             position = "bottom",
--         },
--     },
--     floating = {
--         border = "rounded",
--     },
-- })

-- lvim.dapui.

dap_virtual_text.setup({
    --[[ virt_text_pos = "right_align", -- "eol" | "overlay" | "right_align" ]]
})

lvim.builtin.dap["breakpoint"] = {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "DapBreakpoint",
    numhl = "DapBreakpoint"
}
lvim.builtin.dap["breakpoint_rejected"] = {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "DapBreakpoint",
    numhl = "DapBreakpoint"
}

local dap_python_status_ok, dap_python = pcall(require, "dap_python")
if not dap_python_status_ok then
    return
end

dap_python.setup(os.getenv("HOME") .. "/.virtualenvs/debugpy/bin/python")
dap_python.resolve_python = function()
    return PYTHON_VIRTUAL_ENV()
    -- return "/home/valentin/.virtualenvs/appstore_portal_back_end/bin/python"
end
-- dap_python.setup(PYTHON_VIRTUAL_ENV())

--[[ local test_runners = dap_python.test_runners ]]
--[[ test_runners.nose2 = function(classname, methodname, opts) ]]
--[[ 	local args = { classname, methodname } ]]
--[[ 	return "nose2", args ]]
--[[ end ]]
dap_python.test_runner = "unittest" -- unittest | pytest | django

-- automatically open gui
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

---- automatically close gui when terminated
-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 	dapui.close()
-- end
--
---- automatically close when exited
-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dapui.close()
-- end
