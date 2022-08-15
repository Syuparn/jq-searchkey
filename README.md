# jq-searchkey
search nested keys in JSON by key names with jq

# usage

`jq-searchkey` helps to search keys from complicated JSON schema!

```json
{
  "name": "Taro",
  "age": 22,
  "country": "Japan",
  "friends": [
    {
      "name": "Hanako",
      "country": "Japan"
    },
    {
      "name": "John",
      "country": "USA"
    }
  ],
  "company": {
    "name": "Hogehoge industry",
    "country": "Japan"
  }
}
```

```bash
# search key "name"
$ cat test/sample.json | jq-searchkey "name"
.name
.friends[0].name
.friends[1].name
.company.name
```

# requirements

- `jq`

# for developers
## run tests

NOTE: `make` and `bats` are required

```bash
$ make test
```
