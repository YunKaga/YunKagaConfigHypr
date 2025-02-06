vim.g.mapleader = " "

local keymap = vim.keymap

local cmd = vim.cmd

cmd("set keymap=russian-jcukenwin")
cmd("set iminsert=0")
cmd("set imsearch=0")

-- NeoTree
keymap.set('n', '<C-n>', ':Neotree float<CR>')
keymap.set('n', '<leader>l', ':Neotree left<CR>')

-- Global
keymap.set('i', 'jj', '<ESC>')

keymap.set('n', '<leader>w', ':w<CR>', {silent = true})
keymap.set('n', '<leader>q', ':q<CR>')
keymap.set('n', '<C-q>', ':q!<CR>')

-- insert
keymap.set('i', '<C-H>', '<Left>')
keymap.set('i', '<C-J>', '<Down>')
keymap.set('i', '<C-K>', '<Up>')
keymap.set('i', '<C-L>', '<Right>')

-- copyPast
--keymap.set({'v'}, '<C-y>', '"+y')
--keymap.set({'n', 'v'}, '<C-p>', '"+p')

-- Terminal
-- Функция для компиляции и запуска C++ программы
local function compile_and_run_CPP()
    local filename = vim.fn.expand('%:p')  -- Получаем полный путь к текущему файлу
    local command = string.format('g++ "%s" -o bin && ./bin', filename)  -- Формируем команду
    -- Открываем терминал в нижней части окна
    vim.cmd('belowright split | terminal')  -- Открываем терминал
    vim.fn.chansend(vim.b.terminal_job_id, command)  -- Отправляем команду в терминал
end

-- Функция для запуска Python программы
local function run_Python()
    local filename = vim.fn.expand('%:p')
    local command = string.format('python "%s"', filename)
    vim.cmd('belowright split | terminal')
    vim.fn.chansend(vim.b.terminal_job_id, command)
end

keymap.set('n', '<leader>t', '<C-w>s<C-w>j:terminal<CR>')
keymap.set('t', '<ESC>', '<C-\\><C-n>')
keymap.set('t', '<C-e>', '<C-c><C-\\><C-n>:q<CR>')
keymap.set('n', '<F9>c', compile_and_run_CPP)
keymap.set('n', '<F9>p', run_Python)

-- Windows
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')
