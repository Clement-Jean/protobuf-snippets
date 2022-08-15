# TODO

- `protobuf-in-classes` which takes a list of classes (eg: "message" "enum") and return `t` if the cursor is in either one of them, otherwise `nil`
- with `protobuf-in-classes` we can add that to `reserved` (message and enum)

- `protobuf-in-field` which tells wether or not we are between the tag of the field and its `;`
- with `protobuf-in-field` we can add that to deprecated option

- would it be possible to have auto-incrementing tags for fields?