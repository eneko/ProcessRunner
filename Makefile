.PHONY: docs

docs:
	sourcedocs generate --spm-module System --output-folder docs --clean

lint:
	swiftlint autocorrect --format --quiet
	swiftlint lint --quiet --strict

