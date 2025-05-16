.PHONY: all install-pre-commit configure-pre-commit clean test help

all: install-pre-commit configure-pre-commit ## Install and configure pre-commit hooks

install-pre-commit: ## Install pre-commit globally using pip
	@echo "Installing pre-commit..."
	pip install pre-commit
	@echo "pre-commit installed successfully"

configure-pre-commit: ## Configure pre-commit hooks for this repository
	@if [ ! -f .pre-commit-config.yaml ]; then \
		echo "Initializing pre-commit configuration..."; \
		pre-commit sample-config > .pre-commit-config.yaml; \
		echo "Created .pre-commit-config.yaml"; \
	fi
	pre-commit install
	@echo "pre-commit configured successfully"

test: ## Run flutter tests
	@echo "Running tests..."
	flutter test
	@echo "Tests completed"

clean: ## Clean pre-commit cache and uninstall hooks
	@echo "Cleaning pre-commit cache..."
	pre-commit clean
	pre-commit uninstall
	@echo "Pre-commit cache cleaned and hooks uninstalled"

help: ## Show available commands
	@echo "Available commands:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)