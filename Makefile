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

.PHONY: system
system: .vault_password
	ansible-playbook --connection=local --inventory=127.0.0.1,  --ask-become-pass site.yml
