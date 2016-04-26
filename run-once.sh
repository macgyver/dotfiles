# disable two-finger swipe navigation in Chrome http://apple.stackexchange.com/a/80163/62458
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE
# add me to wheel and _www
sudo dseditgroup -o edit -a jz -t user wheel
sudo dseditgroup -o edit -a jz -t user _www
# add _www to _www - wtf is this not already the case?
sudo dseditgroup -o edit -a _www -t user _www
# http://tattiebogle.net/index.php/ProjectRoot/Xbox360Controller/OsxDriver
# https://github.com/OpenEmu/OpenEmu/wiki/Compiling-From-Source-Guide
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
