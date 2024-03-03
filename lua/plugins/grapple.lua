local M = {
	"cbochs/grapple.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>m", "<cmd>GrappleToggle<cr>" },
		{ "<leader>p", "<cmd>GrapplePopup tags<cr>" },
		{ "<leader>gk", ":GrappleTag key=", { noremap = true } },
		{ "<leader>1", "<cmd>GrappleSelect key=1<cr>" },
		{ "<leader>2", "<cmd>GrappleSelect key=2<cr>" },
		{ "<leader>3", "<cmd>GrappleSelect key=3<cr>" },
		{ "<leader>4", "<cmd>GrappleSelect key=4<cr>" },
		{ "<leader>5", "<cmd>GrappleSelect key=5<cr>" },
		{ "<leader>6", "<cmd>GrappleSelect key=6<cr>" },
		{ "<leader>7", "<cmd>GrappleSelect key=7<cr>" },
		{ "<leader>8", "<cmd>GrappleSelect key=8<cr>" },
		{ "<leader>9", "<cmd>GrappleSelect key=9<cr>" },
		{ "<leader>0", "<cmd>GrappleSelect key=10<cr>" },
	},
}

function M.config()
	local grapple_ok, grapple = pcall(require, "grapple")
	if not grapple_ok then
		return
	end

	grapple.setup({
		popup_tags_title = function(scope)
			return string.format(" %s ", scope:gsub(vim.env.HOME, "🚀"))
		end,
		scope = "git",
		popup_options = {
			width = 60,
			height = 10,
		},
	})
end

return M
