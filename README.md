# usage
	cd
	git init
	git remote add origin git@github.com:macgyver/dotfiles.git
	git pull origin master
	git branch --set-upstream-to=origin/master master
	chmod 711 run-once.sh
	./run-once.sh
