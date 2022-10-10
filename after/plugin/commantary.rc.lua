local status, comm = pcall(require, 'vim-commentary')

if (not status) then return end

comm.setup{}
