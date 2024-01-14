.PHONY: set-ip backup rollback

# Default values
PLACEHOLDER_IP := 127.0.0.1
FILES_TO_REPLACE := prometheus/prometheus.yml prometheus/targets.json
BACKUP_SUFFIX := .bak

# Retrieve the public IP from Terraform output
IP := $(shell curl -s ifconfig.io)

# Backup original files
backup:
	@echo "Creating backups of original configuration files..."
	@for file in $(FILES_TO_REPLACE); do \
		cp $$file $$file$(BACKUP_SUFFIX); \
	done
	@echo "Backup complete."

# Replace placeholder IP with actual IP
set-ip: backup
	@echo "Setting public IP in configuration files..."
	@for file in $(FILES_TO_REPLACE); do \
		sed -i 's/$(PLACEHOLDER_IP)/$(IP)/g' $$file; \
	done
	@echo "Replacement complete."

# Rollback to original files
rollback:
	@echo "Reverting configuration files to original..."
	@for file in $(FILES_TO_REPLACE); do \
		if [ -f $$file$(BACKUP_SUFFIX) ]; then \
			mv $$file$(BACKUP_SUFFIX) $$file; \
		fi \
	done
	@echo "Rollback complete."