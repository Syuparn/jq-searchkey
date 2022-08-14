.PHONY: test
test: test/unit

.PHONY: test/unit
test/unit:
# NOTE:
# -n: input `null`, since this test does not use stdin
# -r: print raw string so that '\n' in error messages works
	@for f in $$(find *_test.jq); do \
		echo $$f; \
		jq -n -r -f $$f; \
		echo; \
	done
