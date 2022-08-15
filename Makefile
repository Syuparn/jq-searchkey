.PHONY: test
test: test/unit test/integ

.PHONY: test/unit
test/unit:
# jq options:
# -n: input `null`, since this test does not use stdin
# -r: print raw string so that '\n' in error messages works
# NOTE:
#	`|| exit 1` is necessary to catch non-zero status code from jq
	@for f in $$(find *_test.jq); do \
		echo $$f; \
		jq -n -r -f $$f || exit 1; \
		echo; \
	done

.PHONY: test/integ
test/integ:
	bats test/sample.bats
