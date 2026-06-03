// Blackbox tests run against the package's public API. Use `@base64` to import.
// Prefer high-level behaviors over implementation details.
// Run `moon test` to execute and `moon test --update` to refresh snapshots.

test "encodes and decodes base64 correctly" {
  assert_eq(encode_bytes(b"Hello, World!"), "SGVsbG8sIFdvcmxkIQ==")
}

test "decodes base64 correctly" {
  assert_eq(decode_bytes("SGVsbG8sIFdvcmxkIQ=="), b"Hello, World!")
}

test "decodes base64 to utf8 correctly" {
  assert_eq(decode_utf8("SGVsbG8sIFdvcmxkIQ=="), "Hello, World!")
}

test "encodes and decodes utf8 correctly" {
  let original = "こんにちは世界" // "Hello, World!" in Japanese
  let encoded = encode_utf8(original)
  let decoded_bytes = decode_bytes(encoded)
  let decoded_string = @utf8.decode(decoded_bytes)
  assert_eq(decoded_string, original)
}

test "encodes utf8 strings" {
  assert_eq(encode_utf8(""), "")
  assert_eq(encode_utf8(">>>>>>"), "Pj4+Pj4+")
  assert_eq(encode_utf8("こんにちは世界"), "44GT44KT44Gr44Gh44Gv5LiW55WM")
  assert_eq(encode_utf8("生姜焼き定食"), "55Sf5aec54S844GN5a6a6aOf")
  assert_eq(encode_utf8("😀"), "8J+YgA==")
  assert_eq(encode_utf8("Café"), "Q2Fmw6k=")
}

test "encodes to base64url correctly" {
  assert_eq(encode_url("Hello, World!"), "SGVsbG8sIFdvcmxkIQ")
  assert_eq(encode_url("🏆☕️💤"), "8J-PhuKYle-4j_CfkqQ")
}

test "decodes base64url correctly" {
  assert_eq(decode_url("SGVsbG8sIFdvcmxkIQ"), b"Hello, World!")
  assert_eq(decode_url("8J-PhuKYle-4j_CfkqQ"), b"🏆☕️💤")
}
