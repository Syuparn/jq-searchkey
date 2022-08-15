import "search_keys" as sk;

. | sk::search_keys_by($key) | .[] | sk::humanize_key
