# protobuf-snippets

YASnippet snippets for Protocol Buffers

## Description

### Folders

- `protobuf-fn` contains files that are needed for snippet conditions or modifications
- `protobuf-mode` contains the snippets

### Syntax

| done | key | expansion |
| ---- | --- | --------- |
| :white_check_mark: | sp2 | `syntax = "proto2";` |
| :white_check_mark: | sp3 | syntax = "proto3"; |

### Options

| done | key | expansion |
| ---- | --- | --------- |
| :white_check_mark: | oaa | option allow_alias = true; |
| :white_check_mark: | ocea | option cc_enable_arenas = true; |
| :x: | ocn | option csharp_namespace = ""; |
| :white_check_mark: | odep | option deprecated = true; |
| :white_check_mark: | ogp | option golang_package = "github.com/golang/go"; |
| :white_check_mark: | ojmf | option java_multiple_files = true; |
| :white_check_mark: | ojoc | option java_outer_classname = "ClassName"; |
| :white_check_mark: | ojp | option java_package = "package.name"; |
| :white_check_mark: | oocp | option objc_class_prefix = "ClassPrefix"; |
| :white_check_mark: | o4 | option optimize_for = [MINIBUFFER_INPUT]; |

### Imports

| done | key | expansion |
| ---- | --- | --------- |
| :white_check_mark: | imp | import "path/to/other/protos/proto"; |
| :x: | impa | import "google/protobuf/any.proto"; |
| :x: | impd | import "google/protobuf/duration.proto"; |
| :x: | impe | import "google/protobuf/empty.proto"; |
| :x: | impf | import "google/protobuf/field_mask.proto"; |
| :x: | imps | import "google/protobuf/struct.proto"; |
| :x: | impt | import "google/protobuf/timestamp.proto"; |
| :x: | impw | import "google/protobuf/wrappers.proto"; |

### Types

| done | key | expansion |
| ---- | --- | --------- |
| :white_check_mark: | enu | enum {\n\t\n} |
| :white_check_mark: | msg | message {\n\t\n} |
| :white_check_mark: | svc | service {\n\t\n} |

### Fields

| done | key | expansion |
| ---- | --- | --------- |
| :white_check_mark: | fbo | bool name = 1; |
| :white_check_mark: | fby | bytes name = 1; |
| :white_check_mark: | fdo | double name = 1; |
| :white_check_mark: | ff32 | fixed32 name = 1; |
| :white_check_mark: | ff64 | fixed64 name = 1; |
| :white_check_mark: | ffl | float name = 1; |
| :white_check_mark: | fi32 | int32 name = 1; |
| :white_check_mark: | fi64 | int64 name = 1; |
| :white_check_mark: | fma | map<KeyType, ValueType> name = 1; |
| :white_check_mark: | fby | bytes name = 1; |
| :white_check_mark: | foo | oneof {\n\t\n} |
| :white_check_mark: | fsf32 | sfixed32 name = 1; |
| :white_check_mark: | fsf64 | sfixed64 name = 1; |
| :white_check_mark: | fs32 | sint32 name = 1; |
| :white_check_mark: | fs64 | sint64 name = 1; |
| :white_check_mark: | fst | string name = 1; |
| :white_check_mark: | fu32 | uint32 name = 1; |
| :x: | fwa | google.protobuf.Any name = 1; |
| :x: | fwd | google.protobuf.Duration name = 1; |
| :x: | fwt | google.protobuf.Timestamp name = 1; |

### Well-Know Types

| done | key | expansion |
| ---- | --- | --------- |
| :white_check_mark: | wa | google.protobuf.Any |
| :white_check_mark: | wd | google.protobuf.Duration |
| :white_check_mark: | we | google.protobuf.Empty |
| :white_check_mark: | wf | google.protobuf.FieldMask |
| :white_check_mark: | ws | google.protobuf.Struct |
| :white_check_mark: | wt | google.protobuf.Timestamp |
| :white_check_mark: | wwb | google.protobuf.BytesValue |
| :white_check_mark: | wwd | google.protobuf.DoubleValue |
| :white_check_mark: | wwf | google.protobuf.FloatValue |
| :white_check_mark: | wwi32 | google.protobuf.Int32Value |
| :white_check_mark: | wwi64 | google.protobuf.Int64Value |
| :white_check_mark: | wws | google.protobuf.StringValue |
| :white_check_mark: | wwu32 | google.protobuf.UInt32Value |
| :white_check_mark: | wwu64 | google.protobuf.UInt64Value |

### Other

| done | key | expansion |
| ---- | --- | --------- |
| :white_check_mark: | pkg | package package.name; |
| :white_check_mark: | rep | repeated string name = 1; |
| :white_check_mark: | rpc | rpc Name (Request) returns (Response); |

## Installation

I assume that you have [`protobuf-mode`](https://github.com/protocolbuffers/protobuf/blob/main/editors/protobuf-mode.el) and [`yasnippet`](https://github.com/joaotavora/yasnippet) installed

```sh
git clone https://github.com/Clement-Jean/protobuf-snippets.git && cd protobuf-snippets
cp -r protobuf-fn ~/.emacs.d/proto/protobuf-fn
cp -r protobuf-mode ~/.emacs.d/snippets/protobuf-mode
```

then add the following to your `.emacs`:

```lisp
(mapc 'load (file-expand-wildcards "~/.emacs.d/proto/protobuf-fn/*.el"))
```

## Design Decisions

- Certain options are taking booleans as value. However, generally only true is useful since the default is always false. Thus for these options, I'm not letting the user chose the value. This saves 1 TAB.
- For the `optimize_for` option which has more complex value, I let the user enter the value in minibuffer. This is not optimal but you can have autocompletion and this avoid typos.
- For options and imports, the snippet expansion will finish on the next line whereas for syntax and package, it will skip a line.

- The snippets will start with:
	- 'o' for options
	- 'f' for fields

- The default value for enum is called `UNSPECIFIED`

## Known Bugs

- Trying to expand a `oneof` in a message that has nested messages/enums or another oneof will not work if you try to expand after the other children. eg:

	```proto
	message TestMessage {
	  //trying to expand here will work
	  enum TestEnum { }
	  //trying to expand here will not work
	}
	```
	This can probably be solved in `protobuf-fn/contex.el` -> `protobuf-in-class`. But for now, I have no idea how to do that (contribution welcomed).