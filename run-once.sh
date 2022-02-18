echo "Install homebrew: https://brew.sh/"

# make it possible to quit the finder
defaults write com.apple.finder QuitMenuItem -bool true
killall Finder

# disable two-finger swipe navigation in Chrome http://apple.stackexchange.com/a/80163/62458
defaults write com.google.Chrome	AppleEnableSwipeNavigateWithScrolls		-bool FALSE
defaults write com.google.Chrome.canary	AppleEnableSwipeNavigateWithScrolls		-bool FALSE
defaults write com.google.Chrome	AppleEnableMouseSwipeNavigateWithScrolls	-bool FALSE
defaults write com.google.Chrome.canary	AppleEnableMouseSwipeNavigateWithScrolls	-bool FALSE
# todo:
#for x in com.microsoft.VSCode com.github.Atom com.sublimetext.3
#do
#	defaults $x ApplePressAndHoldEnabled -bool false
#done
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

# stop media keys ⏯  from launching itunes? https://www.howtogeek.com/274345/stop-itunes-from-launching-when-you-press-play-on-your-macs-keyboard/
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist
# hmm.. this seems to have broken media keys for spotify too?


brew install ack wget zsh tree git diff-so-fancy watchman pyenv pyenv-virtualenv jq
brew cask install phoenix flux qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

echo "Install driver for xbox 360 controllers https://github.com/360Controller/360Controller/releases"
echo "Install SF Mono nerd font for terminal usage https://github.com/artofrawr/powerline-fonts/blob/master/fonts/SFMono/SF%20Mono%20Regular%20Nerd%20Font%20Complete.otf"
echo "Try to make text look better on a low-density display:"
echo "defaults -currentHost write -globalDomain AppleFontSmoothing -int 3"
echo "defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO"
echo "Install nvm: https://github.com/nvm-sh/nvm#installing-and-updating"

# https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


