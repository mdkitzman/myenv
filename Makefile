
RM = /bin/rm -rfv
LN = /bin/ln -fs
CP = /bin/cp -r

all:
	@echo ""
	@echo "usage:"
	@echo ""
	@echo "* make install  -- to install dotfiles"
	@echo "* make update   -- get latest version from github, install manually"
	@echo ""

install: install-bash install-git

install-bash:
	$(RM) ~/.bash_profile ~/.bashrc ~/.bashrc.d ~/.zshrc
	$(LN) $(realpath dotfiles/bash_profile) ~/.bash_profile
	$(LN) $(realpath dotfiles/bashrc) ~/.bashrc
	$(LN) $(realpath dotfiles/bashrc.d) ~/.bashrc.d
	$(LN) $(realpath dotfiles/zshrc) ~/.zshrc

install-git:
	$(RM) ~/.gitconfig ~/.gitignore_global
	$(LN) $(realpath dotfiles/gitconfig) ~/.gitconfig
	$(LN) $(realpath dotfiles/gitignore_global) ~/.gitignore_global
	touch ~/.gitconfig_local
	for SOURCE in $(realpath git_commands)/*; do \
		TARGET="/usr/local/bin/git-$$(basename $$SOURCE)"; \
		$(RM) $$TARGET; \
		$(LN) $$SOURCE $$TARGET; \
	done

update:
	git pull --verbose

.PHONY: all install update