.PHONY: test
test: test/unit test/integ

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

.PHONY: test/integ
test/integ:
	bats test/sample.bats
