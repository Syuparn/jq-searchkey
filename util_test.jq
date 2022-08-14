def to_be($expected; $msg):
  . as $actual |
  if $actual != $expected then (
    [
      $msg,
      "expected: \($expected)",
      "actual  : \($actual)"  
    ] | join("\n")
  ) else empty end;
