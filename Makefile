.PHONY: set-ip backup rollback

# Default values
PLACEHOLDER_IP := "127.0.0.1"
FILES_TO_REPLACE := "./prometheus/prometheus.yml ./prometheus/targets.json"
BACKUP_SUFFIX := ".bak"

# Retrieve the public IP from Terraform output
IP := $(shell terraform output -raw instance_public_ip)

# Backup original files
backup:
	@echo "Creating backups of original configuration files..."
	@$(foreach file,$(FILES_TO_REPLACE),cp $(file) $(file)$(BACKUP_SUFFIX);)
	@echo "Backup complete."

# Replace placeholder IP with actual IP
set-ip: backup
	@echo "Setting public IP in configuration files..."
	@$(foreach file,$(FILES_TO_REPLACE),sed -i 's/$(PLACEHOLDER_IP)/$(IP)/g' $(file);)
	@echo "Replacement complete."

# Rollback to original files
rollback:
	@echo "Reverting configuration files to original..."
	@$(foreach file,$(FILES_TO_REPLACE),mv $(file)$(BACKUP_SUFFIX) $(file);)
	@echo "Rollback complete."
