include "search_keys";
include "util_test";

def test_search_keys_by:
  [
    {
      title: "empty object",
      name: "foo",
      object: {},
      expected: []
    },
    {
      title: "contains key on top level",
      name: "foo",
      object: {foo: 1},
      expected: [["foo"]]
    },
    {
      title: "contains key on non-top level",
      name: "bar",
      object: {foo: {bar: 1}},
      expected: [["foo", "bar"]]
    },
    {
      title: "contains multiple keys",
      name: "bar",
      object: {foo: {bar: 1}, bar: 2},
      expected: [["foo", "bar"], ["bar"]]
    },
    {
      title: "key is inside arrays",
      name: "bar",
      object: {foo: [{baz: 1}, {bar: 2}]},
      expected: [["foo", 1, "bar"]]
    }
  ] as $tests | 
  $tests[] as $t | (
    $t.object | search_keys_by($t.name) | to_be($t.expected; "title '\($t.title)': wrong output")
  );

# run test
test_search_keys_by
