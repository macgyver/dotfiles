# disable two-finger swipe navigation in Chrome http://apple.stackexchange.com/a/80163/62458
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE
# add me to wheel and _www
sudo dseditgroup -o edit -a jz -t user wheel
sudo dseditgroup -o edit -a jz -t user _www
