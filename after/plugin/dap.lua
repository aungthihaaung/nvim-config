require('dap-go').setup()
require('dapui').setup()
require('nvim-dap-virtual-text').setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  debugger_path = "D:/work/lab/src/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs { "typescript", "javascript" } do
    require("dap").configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require'dap.utils'.pick_process,
        cwd = "${workspaceFolder}",
      }
  }
end

-- require("config.dap.javascript").setup()

--[[ 
require('dapui').setup(
{
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>" },
        open = "o",
        remove = "d",
    },
    sidebar = {
        elements = {
            -- You can change the order of elements in the sidebar
            "scopes",
            "scopes",
            "watches"
        },
        width = 40,
        position = "left" -- Can be "left" or "right"
    },
    tray = {
        elements = {
            "repl"
        },
        height = 10,
        position = "bottom" -- Can be "bottom" or "top"
    },
}
)
]]
