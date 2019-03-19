ANSIBLE_PLAYBOOK = ANSIBLE_FILTER_PLUGINS=./filter_plugins ansible-playbook
HOOKS := $(shell find .git_hooks -type f -execdir basename {} \;)
PREFIX_TAGS = $(addprefix -t , ${TAGS})

install-hooks:
	@for hook in "$(HOOKS)"; \
	do \
		if [ ! -e ".git/hooks/$$hook" ]; then \
			ln -sr .git_hooks/$$hook .git/hooks/; \
			echo "INSTALL> .git/hooks/$$hook"; \
		fi \
	done 

.vault_password:
	@echo ""
	@echo "Creating .vault_password file."
	@echo ""
	@echo " Supply the password for the Ansible Vault,"
	@echo " it will be saved in this file, and used on repeated runs:"
	@read -s VAULTPASSWORD; \
	echo "$$VAULTPASSWORD" > .vault_password;
	@echo ""

.PHONY: lint
lint:
	ansible-lint site.yml

.PHONY: local
local: .vault_password
	${ANSIBLE_PLAYBOOK} --connection=local --inventory=127.0.0.1, --ask-become-pass -t always ${PREFIX_TAGS} site.yml

.PHONY: remote
remote: .vault_password
	@echo "Enter remote host to deploy dev dotfiles to:"
	@read REMOTE_HOST; \
	${ANSIBLE_PLAYBOOK} --inventory=$$REMOTE_HOST, --ask-become-pass -t always ${PREFIX_TAGS} site.yml
