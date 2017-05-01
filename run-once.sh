# disable two-finger swipe navigation in Chrome http://apple.stackexchange.com/a/80163/62458
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE
defaults write com.google.Chrome.canary.plist AppleEnableSwipeNavigateWithScrolls -bool FALSE
# add me to wheel and _www for apache
#sudo dseditgroup -o edit -a jz -t user wheel
#sudo dseditgroup -o edit -a jz -t user _www
# add _www to _www - wtf is this not already the case?
#sudo dseditgroup -o edit -a _www -t user _www

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
brew install zsh git diff-so-fancy watchman
brew cask install flux phoenix qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
# powerline fonts for agnoster theme
git clone https://github.com/powerline/fonts.git powerline-fonts
./powerline-fonts/install.sh
rm -rf powerline-fonts

echo "Install driver for xbox 360 controllers https://github.com/360Controller/360Controller/releases"
echo "Install git diff enhancement https://github.com/so-fancy/diff-so-fancy"
