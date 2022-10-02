-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- <TELESCOPE>
keymap("n", "<leader>u", "<cmd>Telescope frecency<cr>", opts)
keymap("n", "<leader>i", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>o", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>l", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>a", "<cmd>Telescope git_status<cr>", opts)
keymap("n", "<leader>s", "<cmd>Telescope grep_string<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope marks theme=ivy<cr>", opts)
keymap("n", "<leader>dj", "<cmd>Telescope colorscheme theme=dropdown winblend=0<cr>", opts)

-- <HARPOON>
keymap("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "mm", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "mf", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "me", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "mw", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "ma", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
keymap("n", "mq", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)
keymap("n", "mg", "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", opts)
keymap("n", "mt", "<cmd>lua require('harpoon.term').gotoTerminal(2)<cr>", opts)

-- <TREE-CLIMBER>
keymap("n", "#", "<cmd>lua require('tree-climber').swap_prev()<cr>", opts)
keymap("n", "*", "<cmd>lua require('tree-climber').swap_next()<cr>", opts)

-- <COLOR PICKER>
keymap("n", "<C-c>", "<cmd>CccPick<cr>", opts)
keymap("i", "<C-c>", "<Plug>(ccc-insert)<cr>", opts)

-- <GIT SIGNS>
keymap("n", "gi", "<cmd>Gitsigns next_hunk<cr>^", opts)
keymap("n", "go", "<cmd>Gitsigns prev_hunk<cr>^", opts)

-- <DIFF VIEW GIT>
keymap("n", "<leader>v", "<cmd>DiffviewOpen<cr>", opts)
keymap("n", "<leader>kf", "<cmd>DiffviewFileHistory %<cr>", opts)
keymap("n", "<leader>kg", "<cmd>DiffviewFileHistory<cr>", opts)

-- <LUASNIP>
keymap("s", "<c-h>", "<BS>i", opts)
keymap("s", "q", "q", opts)

-- <CYBU>
keymap("n", "<c-j>", "<plug>(CybuNext)", opts)
keymap("n", "<c-k>", "<plug>(CybuPrev)", opts)

-- <SESSION LENS>
keymap("n", "g<cr>", "<cmd>SearchSession<cr>", opts)

-- <INLAY HINTS>
keymap("n", "<leader>m", "<cmd>lua require('lsp-inlayhints').toggle()<cr>", opts)

-- <NVIM TREE>
keymap("n", "<leader>g", "<cmd>NvimTreeToggle <cr>", opts)

-- <MAXIMIZER>
keymap("n", "v<leader>", "<cmd>WindowsMaximize<cr>", opts)
keymap("n", "<c-w>z", "<cmd>WindowsToggleAutowidth<cr>", opts)

-- <TRANSPARENCY>
keymap("n", "<leader><cr>", "<cmd>TransparentToggle<cr>", opts) -- gives info about current buffer

-- <BUFFERDELETE>
keymap("n", "<c-h>", "<cmd>Bdelete<CR>", opts) --buffer delete

-- <MINI>
keymap("n", "<leader>df", ":lua require('mini.trailspace').trim()<cr>", opts)

-- NAVIGATION
keymap("n", "<leader>q", "<cmd>q<cr>", opts) --                 close window
keymap("n", "<leader>Q", "<cmd>q!<cr>", opts) --     close window and buffer
keymap("n", "<c-v>", "<c-^>", opts) --                  toggle recent window
keymap("n", "<c-r>", "<c-w>w", opts) --                 navigate next window
keymap("n", "<c-a>", "<c-w>W", opts) --             navigate previous window
keymap({ "n", "x" }, "<c-e>", "<c-y>", opts) --     page scrolls up one line
keymap({ "n", "x" }, "<c-f>", "<c-e>", opts) --   page scrolls down one line
keymap({ "n", "x" }, "<c-p>", "<c-b>", opts) --   page scrolls up fullscreen
keymap({ "n", "x" }, "<c-b>", "<c-f>", opts) -- page scrolls down fullscreen

-- RESIZE WINDOW
keymap("n", "ƒ", "<cmd>vertical resize +4<cr>", opts)
keymap("n", "∂", "<cmd>resize +4<cr>", opts)
keymap("n", "ß", "<cmd>resize -4<cr>", opts)
keymap("n", "å", "<cmd>vertical resize -4<cr>", opts)
keymap("n", "<leader><leader>", "<c-w>=", opts) -- center windows

-- INSERT MODE
keymap("i", "<c-f>", "<c-i>", opts) --                                         tab
keymap("i", "<c-k>", "<c-d>", opts) --                        move whole line left
keymap("i", "<c-l>", "<c-t>", opts) --                       move whole line right
keymap("i", "<c-v>", "<c-r>*", opts) --                 paste last registered yank
keymap("i", "<c-o>", "<esc>O", opts) --               go to upper line insert mode
keymap("i", "<c-i>", "<c-f>", opts) --    move line in the corresponding tab frame
keymap("i", "<c-e>", "<c-o>$", opts) -- goes end of the line and insert mode again

-- VISUAL MODE
keymap("n", "vv", "Vg_^", opts) --                   visual whole line
keymap({ "n", "x" }, "<c-l>", "<c-v>", opts) -- block visual selection
keymap("x", "<leader>p", '"_dP', opts) --     paste and don't register
keymap("x", "<c-w>", "o", opts) --     o is used by treesitter-objects

-- SWITCH RECORD MACRO AND YANK
keymap("", "q", "y", opts)
keymap("n", "Q", "y$", opts)
keymap("n", "<tab>", "q", opts)

-- TABS
keymap("n", "<leader>n", "<cmd>tabnew %<cr>", opts) --   new tab
keymap("n", "<leader>e", "gt", opts) --                 next tab
keymap("n", "<leader>r", "gT", opts) --                 prev tab
keymap("n", "<leader>t", "<cmd>tabclose<cr>", opts) -- close tab

-- Z MOVEMENTS
keymap({ "n", "v" }, "zl", "z6l", opts) --                   zoom left
keymap({ "n", "v" }, "zh", "z6h", opts) --                  zoom right
keymap({ "n", "v" }, "gj", "zz", opts) --                  center text
keymap("n", "z.", ":<C-u>normal! zszH<cr>", opts) -- center horizontal

-- MOVE LINE/PARAGRAPH
keymap("x", "<c-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<c-k>", ":m '<-2<CR>gv=gv", opts)

-- SWITCH JUMPS
keymap("", "<c-o>", "<c-i>", opts)
keymap("", "<c-i>", "<c-o>", opts)

-- SWITCH BACKGROUND COLOR
keymap("n", "<leader>di", "<cmd>set background=dark<cr>", opts)
keymap("n", "<leader>do", "<cmd>set background=light<cr>", opts)

-- UTILS
keymap("n", "<c-q>", "<c-r>", opts) --                                    redo
keymap("n", "<leader>f", "<cmd>w<cr>", opts) --                      save file
keymap("n", "<leader>w", "<cmd>set hlsearch!<CR>", opts) --         highlights
-- keymap("n", "<c-s>", "<cmd>StartupTime<cr>", opts) --            start up time
keymap("", "<c-x>", "<c-a>") --                                increase number
keymap("", "g<c-x>", "g<c-a>") --                              increase column
keymap("", "<c-z>", "<c-x>") --                                decrease number
keymap("", "g<c-z>", "g<c-x>") --                              decrease column
keymap("n", "<leader>dw", "<cmd>set wrap!<cr>", opts) --       toggle set wrap
keymap("n", "<leader>z", "<cmd>set nu!<cr>", opts) --        toggle set number
keymap("", "\\w", "`.") --                             go to last changed line
keymap("n", "<leader>c", "<c-g>", opts) --     gives info about current buffer
keymap("n", "d<leader>", "cc<esc>", opts) -- clear line without deleting break
keymap("n", "S", "mzJ`z", opts) --         cursor stay current position when J

-- Free: y

-- D maps available:
-- q, r, y, u, p
-- s, <cr>
-- z, x, c, n, m

-- G maps available:
-- q, w, y
-- z, x

-- <leader> maps available
-- y
-- x
-- combinations with: d, k
-- Reverse available: q, z, c

-- <C- > maps available
-- y
-- s (unnecesary), <cr>
-- n, m?

-- <C- > insert mode maps available:
-- q, p, s, z, x, b, n, m
