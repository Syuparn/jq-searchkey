def to_be($expected; $msg):
  . as $actual |
  if $actual != $expected then (
    [
      $msg,
      "expected: `\($expected)`",
      "actual  : `\($actual)`",
      "" # only for breakline
    ] | join("\n") |
    halt_error(1) # exit with status code 1
  ) else empty end;
