def search_keys_by($name):
  [path(..) | select(contains([$name]))];
