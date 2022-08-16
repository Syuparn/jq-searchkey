# NOTE: this must be called from repository top level!
@test "integration test with sample json file" {
  expected=(
    ".name"
    ".friends[0].name"
    ".friends[1].name"
    ".company.name"
  )

  i=0
  for actual in $(cat ./test/sample.json | ./jq-searchkey name); do
    [ "${expected[i]}" = "$actual" ]
    ((i+=1))
  done
}

@test "show help by option -h" {
  actual=$(./jq-searchkey -h | head -n 1)
  [ "$actual" = "Usage: jq-searchkey <key>" ]
}
