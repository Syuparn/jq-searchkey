def search_keys_by($name):
  [path(..) | select(contains([$name]))];

def humanize_key:
  . as $key |
  map(if type == "string" then ".\(.)" else "[\(.)]" end) |
  join("");
