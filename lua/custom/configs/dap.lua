local dap = require("dap")

dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "js-debug-adapter"
  }
}
dap.adapters["pwa-chrome"] = {
  type = "server",
  host = "127.0.0.1",
  port = 9222,
  executable = {
    command = "js-debug-adapter",
  }
}

require('dap').set_log_level('DEBUG')
for _, language in ipairs { "typescript", "javascript", "javascriptreact", "typescriptreact" } do
  dap.configurations[language] = {
    {
    type = "pwa-chrome",
    request = "launch",
    name = "Launch Chrome",
    url = "http://localhost:5173",  -- URL of your live website
    webRoot = "${workspaceFolder}",
  --  runtimeExecutable = '/mnt/c/Program Files/Google/Chrome/Application/chrome.exe', -- Correct path
   -- runtimeArgs = { "--remote-debugging-port=9222" },
    trace = true,
--    runtimeExecutable = "/mnt/c/Program\\ Files/Google/Chrome/Application/chrome.exe", -- Full path to Chrome
  --  runtimeArgs = { "--remote-debugging-port=9222" },
    },
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
