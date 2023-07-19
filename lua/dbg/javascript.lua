local DEBUGGER_PATH = vim.fn.stdpath "data" .. "/site/pack/packer/opt/vscode-js-debug"
-- -- local DEBUGGER_PATH = vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter"

-- require("dap-vscode-js").setup {
--     node_path = "node",
--     debugger_path = DEBUGGER_PATH,
--     -- debugger_cmd = { "js-debug-adapter" },
--     adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
--   }


-- -- react
-- for _, language in ipairs { "typescriptreact", "javascriptreact" } do
--   require("dap").configurations[language] = {
--     {
--       type = "pwa-chrome",
--       name = "Attach - Remote Debugging",
--       request = "attach",
--       program = "${file}",
--       cwd = vim.fn.getcwd(),
--       sourceMaps = true,
--       protocol = "inspector",
--       port = 9222,
--       resolveSourceMapLocations = {"${workspaceFolder}/app", "!**/node_modules/**"},
--       -- outFiles = { "${workspaceFolder}/**" },
--       webRoot = "${workspaceFolder}",
--     },
--     {
--       type = "pwa-chrome",
--       name = "Launch Chrome",
--       request = "launch",
--       url = "http://localhost:3000",
--       sourceMaps = true,
--       protocol = "inspector",
--       webRoot = "${workspaceFolder}/app",
--     },
--   }
-- end

-- -- node
-- for _, language in ipairs { "typescript", "javascript" } do
--   require("dap").configurations[language] = {
--     {
--       type = "pwa-node",
--       request = "launch",
--       name = "Launch file",
--       program = "${file}",
--       cwd = "${workspaceFolder}",
--     },
--     {
--       type = "pwa-node",
--       request = "attach",
--       name = "Attach",
--       processId = require("dap.utils").pick_process,
--       cwd = "${workspaceFolder}",
--     },
--     {
--       type = "pwa-node",
--       request = "launch",
--       name = "Debug Jest Tests",
--       -- trace = true, -- include debugger info
--       runtimeExecutable = "node",
--       runtimeArgs = {
--         "./node_modules/jest/bin/jest.js",
--         "--runInBand",
--       },
--       rootPath = "${workspaceFolder}",
--       cwd = "${workspaceFolder}",
--       console = "integratedTerminal",
--       internalConsoleOptions = "neverOpen",
--     },
--   }
-- end

-- ╭──────────────────────────────────────────────────────────╮
-- │ Adapters                                                 │
-- ╰──────────────────────────────────────────────────────────╯
local dap = require("dap")

-- NODE
dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
}

-- Chrome
-- dap.adapters.chrome = {
--   type = "executable",
--   command = "node",
--   args = { vim.fn.stdpath("data") .. "/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
-- }

-- VSCODE JS
require("dap-vscode-js").setup({
  debugger_path = DEBUGGER_PATH,
  -- debugger_cmd = { "js-debug-adapter" },
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

-- ╭──────────────────────────────────────────────────────────╮
-- │ Configurations                                           │
-- ╰──────────────────────────────────────────────────────────╯
dap.configurations.javascript = {
  {
    name = "Node.js",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
}

dap.configurations.javascript = {
  {
    name = "Chrome (9222)",
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}",
  },
}

dap.configurations.javascriptreact = {
  {
    name = "Chrome (9222)",
    type = "pwa-chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}",
  },
}

dap.configurations.typescriptreact = {
  {
    name = "Chrome (9222)",
    type = "pwa-chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}",
  },
}
