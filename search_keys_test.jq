include "search_keys";
include "util_test";

def test_search_keys_by:
  [
    {
      title: "empty object",
      name: "foo",
      object: {},
      expected: ["a"]
    }
  ] as $tests | 
  $tests[] as $t | (
    $t.object | search_keys_by($t.name) | to_be($t.expected; "title '\($t.title)': wrong output")
  );

# run test
test_search_keys_by
