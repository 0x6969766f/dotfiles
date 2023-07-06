local opt = vim.opt

opt.laststatus = 3 -- global statusline
opt.showmode = false

-- cursor
opt.guicursor = ""

-- undo, history
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vimhistory"

-- numbers
opt.ruler = false
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- search
opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 10

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- performance
opt.updatetime = 50
opt.timeoutlen = 300
opt.timeout = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true
opt.signcolumn = "yes"

-- make dashes part of string
opt.iskeyword:append("-")

-- disable intro
opt.shortmess:append("sI")

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")
