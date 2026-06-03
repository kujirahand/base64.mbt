# kujirahand/ base64.mbt

Base64 Package for MoonBit.

However, the MoonBit [core library](https://github.com/moonbitlang/core/tree/main/encoding/base64) already includes Base64 encoding and decoding. I created this package to test MoonBit's features.

## Add to your project

To use this package in your MoonBit project, run:

```sh
mbt add kujirahand/base64
```

And import this package in your `moon.pkg`:

```moonbit
import {
    "kujirahand/base64" @base64
}
```

## Usage

```moonbit
println(@base64.encode_utf8("Hello, World!")) // "SGVsbG8sIFdvcmxkIQ=="
println(@base64.encode_bytes(b"Hello, World!")) // b"SGVsbG8sIFdvcmxkIQ=="
println(@base64.decode_utf8("SGVsbG8sIFdvcmxkIQ==")) // "Hello, World!"
println(@base64.decode_bytes("SGVsbG8sIFdvcmxkIQ==")) // b"Hello, World!"
```
