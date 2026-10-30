
RM = /bin/rm -rfv
LN = /bin/ln -fs
CP = /bin/cp -r

# user-owned bin dir, so installing git commands doesn't need sudo
BIN_DIR = $(HOME)/.local/bin

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
	mkdir -p $(BIN_DIR)
	for SOURCE in $(realpath git_commands)/*; do \
		TARGET="$(BIN_DIR)/git-$$(basename $$SOURCE)"; \
		chmod +x $$SOURCE; \
		$(RM) $$TARGET; \
		$(LN) $$SOURCE $$TARGET; \
	done

update:
	git pull --verbose

.PHONY: all install install-bash install-git update