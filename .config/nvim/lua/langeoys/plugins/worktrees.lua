return {
	"ThePrimeagen/git-worktree.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("git-worktree").setup({})
		require("telescope").load_extension("git_worktree")

		local Worktree = require("git-worktree")

		-- op = Operations.Switch, Operations.Create, Operations.Delete
		-- metadata = table of useful values (structure dependent on op)
		--      Switch
		--          path = path you switched to
		--          prev_path = previous worktree path
		--      Create
		--          path = path where worktree created
		--          branch = branch name
		--          upstream = upstream remote name
		--      Delete
		--          path = path where worktree deleted

		Worktree.on_tree_change(function(op, metadata)
			if op == Worktree.Operations.Switch then
				local Path = require("plenary.path")
				local absolute_path = vim.fn.expand(metadata.path)
				local absolute_prev_path = vim.fn.expand(metadata.prev_path)

				local marks_util = require("langeoys.utils.marks")

				local mark_file = vim.fn.stdpath("data") .. "/worktree_marks.json"

				local stored_marks = {}
				local ok, decoded_json = pcall(function()
					return vim.json.decode(Path:new(mark_file):read())
				end)

				if ok and decoded_json then
					stored_marks = decoded_json
				end

				local current_marks = marks_util.get_mark_table()
				stored_marks[absolute_prev_path] = current_marks

				marks_util.clear_global_marks()

				if stored_marks and stored_marks[absolute_path] then
					marks_util.set_global_marks(stored_marks[absolute_path])
				end

				Path:new(mark_file):write(vim.fn.json_encode(stored_marks), "w")
			end
		end)
	end,
	keys = {
		{ "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>" },
		{ "<leader>gW", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>" },
	},
}
