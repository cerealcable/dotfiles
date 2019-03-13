HOOKS := $(shell find .git_hooks -type f -execdir basename {} \;)
ENVS := $(shell find envs -mindepth 1 -maxdepth 1 -type d -execdir basename {} \;)
ENV_TARGETS = $(addprefix install-,$(ENVS))

build:
	@for hook in "$(HOOKS)"; \
	do \
		if [ ! -e ".git/hooks/$$hook" ]; then \
			ln -sr .git_hooks/$$hook .git/hooks/; \
			echo "INSTALL> .git/hooks/$$hook"; \
		fi \
	done 

pull:
	git pull origin master;
	git submodule update --init --recursive;

.PHONY: install
install: pull build
	rsync -avh --no-perms src/ ~;
	pip3 install --user -r requirements-user-3.txt;

.PHONY: $(ENV_TARGETS)
$(ENV_TARGETS): install
	$(eval ENV := $(patsubst install-%,%,$@))
	rsync -avh --no-perms envs/$(ENV)/ ~;
	@if [ -e "envs/$(ENV)/requirements.txt" ]; then \
		pip install --user -r envs/$(ENV)/requirements.txt; \
	fi

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
