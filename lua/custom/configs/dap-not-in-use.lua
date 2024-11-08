local dap = require("dap")

dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "pwsh",
    args = {"-NoProfile", "-Command", "C:\\Users\\pedro\\AppData\\Local\\nvim-data\\mason\\bin\\js-debug-adapter.cmd"}
  }
}
dap.adapters["pwa-chrome"] = {
  type = "server",
  host = "127.0.0.1",
  port = 9222,
  executable = {
    command = "C:\\Users\\pedro\\AppData\\Local\\nvim-data\\mason\\bin\\js-debug-adapter.cmd",
    args = {}
  }
}
require('dap').set_log_level('DEBUG')
for _, language in ipairs { "typescript", "javascript", "javascriptreact", "typescriptreact" } do
  dap.configurations[language] = {
    {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch Chrome",
        url = "http://localhost:5173",
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",    },

    {
      type="pwa-node",
      request="launch",
      name="Launch debugger for file with node",
      program="${file}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
    }
  }














end
