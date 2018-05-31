# disable two-finger swipe navigation in Chrome http://apple.stackexchange.com/a/80163/62458
defaults write com.google.Chrome	AppleEnableSwipeNavigateWithScrolls		-bool FALSE
defaults write com.google.Chrome.canary	AppleEnableSwipeNavigateWithScrolls		-bool FALSE
defaults write com.google.Chrome	AppleEnableMouseSwipeNavigateWithScrolls	-bool FALSE
defaults write com.google.Chrome.canary	AppleEnableMouseSwipeNavigateWithScrolls	-bool FALSE
defaults write com.microsoft.VSCode	ApplePressAndHoldEnabled			-bool false
# add me to wheel and _www for apache
sudo dseditgroup -o edit -a $USER -t user wheel
#sudo dseditgroup -o edit -a $USER -t user _www
# add _www to _www - wtf is this not already the case?
#sudo dseditgroup -o edit -a _www -t user _www
sudo chmod 664 /etc/hosts

# enable key-repeat for vscode vim extension
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

brew install zsh git diff-so-fancy watchman
brew cask install phoenix qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

echo "Install driver for xbox 360 controllers https://github.com/360Controller/360Controller/releases"
echo "Install SF Mono font system-wide https://medium.com/@deepak.gulati/using-sf-mono-in-emacs-6712c45b2a6d"
echo "Install SF Mono nerd font for terminal usage https://github.com/artofrawr/powerline-fonts/blob/master/fonts/SFMono/SF%20Mono%20Regular%20Nerd%20Font%20Complete.otf"
echo "Install oh-my-zsh https://github.com/robbyrussell/oh-my-zsh"
echo "Fix 1 Password in Chrome Canary: https://support.1password.com/kb/201707/"
