HOOKS := $(shell find .git_hooks -type f -execdir basename {} \;)

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
	ANSIBLE_FILTER_PLUGINS=./filter_plugins ansible-playbook --connection=local --inventory=127.0.0.1, --ask-become-pass -t always -t ${TAGS} site.yml
