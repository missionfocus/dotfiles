SOURCE	:= $(CURDIR)
TARGET	:= $(HOME)
all: clean install


install_dotfiles:
	@ln -sf $(CURDIR)/bash/bashrc $(TARGET)/.bashrc
	@ln -sf $(CURDIR)/zsh/zshrc $(TARGET)/.zshrc
	@ln -sf $(CURDIR)/git/gitconfig $(TARGET)/.gitconfig
	@ln -sf $(CURDIR)/ruby/gemrc $(TARGET)/.gemrc

	# @ln -sf $(SOURCE)/bin $(TARGET)/
	@mkdir -p ~/.ssh/
	@chmod 700 ~/.ssh/
	@ln -sf $(SOURCE)/ssh/config ~/.ssh/config

clean_dotfiles:
	@-for f in $(FILES); do \
		unlink $(TARGET)/.$$f; \
	done
	@-unlink $(TARGET)/.ssh/rc
	@-unlink $(TARGET)/bin

install: install_dotfiles

clean: clean_dotfiles


# lines that start with an 'a' aren't echoed to output
