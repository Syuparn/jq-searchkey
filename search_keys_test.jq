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


def test_humanize_key:
  [
    {
      title: "top level key",
      key: ["foo"],
      expected: ".foo"
    },
    {
      title: "top level array element",
      key: [2],
      expected: "[2]"
    },
    {
      title: "nested key",
      key: ["foo", "bar", "baz"],
      expected: ".foo.bar.baz"
    },
    {
      title: "key inside array",
      key: ["foo", 1, "baz"],
      expected: ".foo[1].baz"
    }
  ] as $tests |
  $tests[] as $t | (
    $t.key | humanize_key | to_be($t.expected; "title '\($t.title)': wrong output")
  );

# run tests
test_search_keys_by,
test_humanize_key
