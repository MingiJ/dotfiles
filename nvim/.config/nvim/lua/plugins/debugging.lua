return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mxsdev/nvim-dap-vscode-js",
		"mfussenegger/nvim-dap-python",
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio"
	},
	config = function()
		require("dapui").setup()
		require("dap-go").setup()
		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
		-- Load dap-vscode-js setup
		require("dap-vscode-js").setup({
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      debugger_path = "/usr/local/bin/vscode-js-debug"
		})

		-- Loop through languages and set up configurations
		for _, language in ipairs({ "typescript", "javascript" }) do
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
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
	end,
}
