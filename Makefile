.PHONY: all install configure configure-init clean test help

all: install configure

install:
	@echo "Installing pre-commit..."
	pip install pre-commit || pip3 install pre-commit
	@echo "pre-commit installed successfully"

configure-init:
	@if [ ! -f .pre-commit-config.yaml ]; then \
		echo "Initializing pre-commit configuration..."; \
		pre-commit sample-config > .pre-commit-config.yaml; \
		echo "Created .pre-commit-config.yaml"; \
	fi

configure: configure-init
	pre-commit install
	@echo "pre-commit configured successfully"

test:
	@echo "Running tests..."
	flutter test
	@echo "Tests completed"
