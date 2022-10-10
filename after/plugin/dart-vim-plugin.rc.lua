local status, dart = pcall(require, 'dart-vim-plugin')

if(not status) then return end

dart.setup{}
