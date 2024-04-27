return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/Documents/**-vault/**.md",
		"BufReadPre oil://" .. vim.fn.expand("~") .. "/Documents/**-vault/**",
	},
	keys = {
		{ "<Leader>ov", "<cmd>ObsidianWorkspace<CR>", desc = "[o]bsidian [v]aults" },
		{ "<Leader>ot", "<cmd>ObsidianToday<CR>", desc = "[o]bsidian [t]oday" },
		{ "<Leader>og", "<cmd>ObsidianSearch<CR>", desc = "[o]bsidian [g]rep" },
		{ "<Leader>of", "<cmd>ObsidianQuickSwitch<CR>", desc = "[o]bsidian [f]iles" },
		{ "<Leader>od", "<cmd>ObsidianDailies<CR>", desc = "[o]bsidian [d]ailies" },
		{ "<Leader>on", "<cmd>ObsidianNew<CR>", desc = "[o]bsidian [n]ew" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal-vault",
				path = "~/Documents/personal-vault",
			},
			{
				name = "rpg-vault",
				path = "~/Documents/rpg-vault",
			},
			{
				name = "work-vault",
				path = "~/Documents/work-vault",
			},
		},
		daily_notes = {
			folder = "daily",
			template = "daily",
		},
		templates = {
			subdir = "-templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			-- A map for custom variables, the key should be the variable and the value a function
			substitutions = {},
		},
	},
}
