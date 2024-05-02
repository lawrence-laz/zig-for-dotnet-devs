# Dictionary

## Add
In .NET, when you need to have a map of key and value pairs you use a `Dictionary`.
```cs
// C#
var dictionary = new Dictionary<int, string>();

dictionary.Add(123, "foo");
dictionary.Add(456, "bar");
dictionary.Add(789, "baz");
```

An equivalent in Zig would be an `AutoHashMap` (there are other variants of `HashMap` so you could choose what fits your use case).
```rs
// Zig
var hashmap = std.AutoHashMap(i32, []const u8).init(std.testing.allocator);
defer hashmap.deinit();

try hashmap.put(123, "foo");
try hashmap.put(456, "bar");
try hashmap.put(789, "baz");
```

## Get
Getting a value out of the `Dictionary` in .NET is done either through an overloaded operator `[]`, which throws an exception when a given key does not exist, or via the `TryGetValue` method, which returns `false` when a key is missing.
```cs
// C#
dictionary[123] // "foo"

if (dictionary.TryGetValue(456, out var value))
{
    // value is "bar"
}
```
There is no operator overloading in Zig. Instead, you call function `get`, which returns an optional value.
```rs
// Zig
if (hashmap.get(123)) |value| {
    // value is "foo"
}
```
