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
        request = "launch",
        name = "Launch nr dev",
        program = "${file}",
        cwd = "${workspaceFolder}",
        env = {
          NODE_ENV = "development",
          RUNTIME = "dev",
        },
        skipFiles = {"<node_internals>/**", "node_modules/**"}
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

-- rust thingies
-- local rt = require("rust-tools")
--[[ local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb") -- note that this will error if you provide a non-existent package name ]]

-- :MasonInstall codelldb
--[[ rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
}) ]]

-- https://help.interfaceware.com/v6/extract-a-filename-from-a-file-path
GetFileName=function(path)
    local start = path:find('[%w%s!-={-|]+[_%.].+')
    return path:sub(start,#path)
end
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = 'C:/Users/aungt/AppData/Local/nvim-data/mason/packages/codelldb/extension/adapter/codelldb.exe',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}
dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/'.. GetFileName(vim.fn.getcwd()), 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

--[[ dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- command = "C:/Users/aungt/AppData/Local/nvim-data/mason/packages/codelldb/extension/adapter/codelldb.exe",
    command = 'C:/Users/aungt/.vscode/extensions/vadimcn.vscode-lldb-1.9.0/adapter/codelldb.exe',
    args = {"--port", "${port}"},
  }
}
dap.configurations.rust = {
  {
    name = "Rust debug",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    -- program = '${workspaceFolder}/target/debug/${fileBasenameNoExtension}',
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    showDisassembly = "never",
  },
} ]]

--[[ dap.adapters.rust = {
  type = 'executable',
  command = 'C:/Users/aungt/.vscode/extensions/vadimcn.vscode-lldb-1.9.0/adapter/codelldb.exe',
  args = {},
  name = "rust"
}

dap.configurations.rust = {
  {
    type = 'rust',
    name = "Debug",
    request = 'launch',
    program = '${workspaceFolder}/target/debug/${fileBasenameNoExtension}',
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    env = {}
  },
} ]]
