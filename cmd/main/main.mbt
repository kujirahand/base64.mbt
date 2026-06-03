fn main {
  println(@base64.encode_utf8("Hello, World!")) // "SGVsbG8sIFdvcmxkIQ=="
  println(@base64.encode_bytes(b"Hello, World!")) // b"SGVsbG8sIFdvcmxkIQ=="
  println(@base64.decode_utf8("SGVsbG8sIFdvcmxkIQ==")) // "Hello, World!"
  println(@base64.decode_bytes("SGVsbG8sIFdvcmxkIQ==")) // b"Hello, World!"
}
