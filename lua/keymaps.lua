-- Remap space as leader key
vim.g.mapleader = " "
-- Shorten keymap function
local keymap = vim.keymap.set
-- Default keymap options
local opts = { noremap = true, silent = true }

-- <LSP Saga>
keymap("n", "gk", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
keymap({ "n", "x" }, "gc", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "gw", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
keymap("n", "\\r", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "\\f", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "\\t", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "\\g", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "gz", "<cmd>LSoutlineToggle<CR>", { silent = true })
keymap("n", "gh", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- <Typerscript>
keymap("n", "<leader>vI", "<cmd>TypescriptAddMissingImports<cr>", opts)
keymap("n", "<leader>vO", "<cmd>TypescriptOrganizeImports<cr>", opts)
keymap("n", "<leader>vU", "<cmd>TypescriptRemoveUnused<cr>", opts)
keymap("n", "<leader>vF", "<cmd>TypescriptFixAll<cr>", opts)
keymap("n", "<leader>vR", "<cmd>TypescriptRenameFile<cr>", opts)
keymap("n", "<leader>vd", "<cmd>TypescriptGoToSourceDefinition<cr>", opts) -- Typescript 4.7+

-- <Harpoon>
keymap("", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap({ "n", "x" }, "mm", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap({ "n", "x" }, "mf", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap({ "n", "x" }, "me", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap({ "n", "x" }, "mw", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap({ "n", "x" }, "ma", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
keymap({ "n", "x" }, "mq", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)
keymap("n", "<c-j>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
keymap("n", "<c-k>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
keymap({ "n", "x" }, "mt", "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", opts)

-- <Telescope>
keymap("", "<leader>u", "<cmd>Telescope oldfiles<cr>", opts)
keymap("", "<leader>i", "<cmd>Telescope find_files<cr>", opts)
keymap("", "<leader>o", "<cmd>Telescope buffers<cr>", opts)
keymap("", "<leader>l", "<cmd>Telescope live_grep<cr>", opts)
keymap("", "<leader>a", "<cmd>Telescope git_status<cr>", opts)
keymap("", "<leader>s", "<cmd>Telescope grep_string<cr>", opts)
keymap("", "<leader>b", "<cmd>Telescope marks theme=ivy<cr>", opts)
keymap("n", "<leader>p", "<cmd>Telescope colorscheme theme=dropdown winblend=0<cr>", opts)

-- <Diff view git>
keymap("", "<leader>d", "<cmd>DiffviewOpen<cr>", opts)
keymap("", "<leader>jf", "<cmd>DiffviewFileHistory %<cr>", opts)
keymap("", "<leader>jg", "<cmd>DiffviewFileHistory<cr>", opts)

-- <Git signs>
keymap({ "n", "x" }, "gi", "<cmd>Gitsigns next_hunk<cr>^", opts)
keymap({ "n", "x" }, "go", "<cmd>Gitsigns prev_hunk<cr>^", opts)

-- <Windows>
keymap("n", "v<leader>", "<cmd>WindowsMaximize<cr>", opts)
keymap("n", "<c-w>z", "<cmd>WindowsToggleAutowidth<cr>", opts)

-- <Tree-climber>
keymap("", "#", "<cmd>lua require('tree-climber').swap_prev()<cr>", opts)
keymap("", "*", "<cmd>lua require('tree-climber').swap_next()<cr>", opts)

-- <Color picker>
keymap("n", "<C-c>", "<cmd>CccPick<cr>", opts)
keymap("i", "<C-c>", "<Plug>(ccc-insert)<cr>", opts)

-- <Session lens>
keymap({ "n", "x" }, "mg", "<cmd>SearchSession<cr>", opts)

-- <Nvim tree>
keymap("", "<leader>g", "<cmd>NvimTreeToggle <cr>", opts)

-- <Inlay hints>
keymap("", "<leader>m", "<cmd>lua require('lsp-inlayhints').toggle()<cr>", opts)

-- <Transparency>
keymap("", "<leader><cr>", "<cmd>TransparentToggle<cr>", opts) -- gives info about current buffer

-- <Bufferdelete>
keymap("", "<c-h>", "<cmd>Bdelete<cr>", opts) --buffer delete

-- <Mini trailspace>
keymap("", "<leader>va", ":lua require('mini.trailspace').trim()<cr>", opts)

-- <Zippy>
keymap("", "<leader>vz", "<cmd>lua require('zippy').insert_print()<CR>", opts)

-- Open links under cursor in browser
if vim.fn.has("macunix") == 1 then
	keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", opts)
else
	keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", opts)
end

-- Navigation
keymap("", "<leader>q", "<cmd>q<cr>", opts) --             close window
keymap("", "<leader>Q", "<cmd>q!<cr>", opts) -- close window and buffer
keymap("", "<c-v>", "<c-^>", opts) --              toggle recent window
keymap("", "<c-r>", "<c-w>w", opts) --             navigate next window
keymap("", "<c-a>", "<c-w>W", opts) --         navigate previous window
keymap("", "<c-e>", "<c-y>", opts) --          page scrolls up one line
keymap("", "<c-f>", "<c-e>", opts) --        page scrolls down one line
keymap("", "<c-p>", "<c-b>", opts) --        page scrolls up fullscreen
keymap("", "<c-b>", "<c-f>", opts) --      page scrolls down fullscreen

-- Resize window
keymap("", "ƒ", "<cmd>vertical resize +4<cr>", opts)
keymap("", "∂", "<cmd>resize +4<cr>", opts)
keymap("", "ß", "<cmd>resize -4<cr>", opts)
keymap("", "å", "<cmd>vertical resize -4<cr>", opts)
keymap("", "<leader><leader>", "<c-w>=", opts) -- center windows

-- Insert mode
keymap("i", "<c-f>", "<c-i>", opts) --                                         tab
keymap("i", "<c-k>", "<c-d>", opts) --                        move whole line left
keymap("i", "<c-l>", "<c-t>", opts) --                       move whole line right
keymap("i", "<c-v>", "<c-r>*", opts) --                 paste last registered yank
keymap("i", "<c-o>", "<esc>O", opts) --               go to upper line insert mode
keymap("i", "<c-i>", "<c-f>", opts) --    move line in the corresponding tab frame
keymap("i", "<c-e>", "<c-o>$", opts) -- goes end of the line and insert mode again

-- Visual mode
keymap("n", "vv", "Vg_^", opts) --               visual whole line
keymap("", "<c-l>", "<c-v>", opts) --       block visual selection
keymap("x", "<leader>p", '"_dP', opts) -- paste and don't register
keymap("x", "<c-w>", "o", opts) -- o is used by treesitter-objects
keymap("x", "!f", ":norm! @f<cr>", opts) -- execute multiple macro

-- Tabs
keymap("", "<leader>n", "<c-w>T", opts) --              new tab
keymap("", "<leader>e", "gt", opts) --                 next tab
keymap("", "<leader>r", "gT", opts) --                 prev tab
keymap("", "<leader>t", "<cmd>tabclose<cr>", opts) -- close tab

-- Switch record macro and yank
keymap("", "q", "y", opts)
keymap("n", "<tab>", "q", opts)
keymap({ "n", "x" }, "Q", "y$", opts)

-- Lua snip conflicts
keymap("s", "<c-h>", "<BS>i", opts)
keymap("s", "q", "q", opts)
keymap("s", "#", "#", opts)
keymap("s", "*", "*", opts)

-- Z movements
keymap({ "n", "x" }, "zl", "z9l", opts) --                            zoom left
keymap({ "n", "x" }, "zh", "z9h", opts) --                           zoom right
keymap({ "n", "x" }, "gj", "zz", opts) --                           center text
keymap({ "n", "x" }, "z.", ":<C-u>normal! zszH<cr>", opts) -- center horizontal

-- Don't yank on delete char
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)
keymap("v", "x", '"_x', opts)
keymap("v", "X", '"_X', opts)

-- Move line/paragraph
keymap("x", "<c-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<c-k>", ":move '<-2<CR>gv-gv", opts)

-- Switch jumps
keymap("n", "<c-o>", "<c-i>", opts)
keymap("n", "<c-i>", "<c-o>", opts)

-- Switch background color
keymap("", "<leader>vi", "<cmd>set background=dark<cr>", opts)
keymap("", "<leader>vo", "<cmd>set background=light<cr>", opts)

-- Utils
keymap("n", "<c-q>", "<c-r>", opts) --                                     redo
keymap("", "<leader>f", "<cmd>w<cr>", opts) --                        save file
keymap("", "<leader>w", "<cmd>set hlsearch!<cr>", opts) --           highlights
keymap("", "<c-x>", "<c-a>") --                                 increase number
keymap({ "n", "x" }, "g<c-x>", "g<c-a>") --                     increase column
keymap("", "<c-z>", "<c-x>") --                                 decrease number
keymap({ "n", "x" }, "g<c-z>", "g<c-x>") --                     decrease column
keymap("", "<leader>vw", "<cmd>set wrap!<cr>", opts) --         toggle set wrap
keymap("", "<leader>z", "<cmd>set nu!<cr>", opts) --          toggle set number
keymap("", "\\<leader>", "`.") --                       go to last changed line
keymap("", "<leader>c", "<c-g>", opts) --       gives info about current buffer
keymap("n", "d<leader>", "cc<esc>", opts) --  clear line without deleting break
keymap({ "n", "x" }, "y", "mzJ`z", opts) -- cursor stay current position when J

-- Shift char available:
-- Y

-- D maps available:
-- q, r, y, u, p
-- <cr>
-- z, x, c, n

-- C maps available:
-- q, r, y, u, p
-- d, g, <cr>
-- z, m

-- G maps available:
-- y
-- <cr>

-- <leader> maps available:
-- y
-- x
-- combinations with: v, j
-- Reverse available: q, z, c

-- <C-> maps available:
-- y
-- s <cr>
-- n, m

-- <C-> insert mode maps available:
-- q, p
-- s
-- z, b, n, m

-- \ maps available
-- y, u, i, o, p
-- h, k, l
-- z, x, b, n
