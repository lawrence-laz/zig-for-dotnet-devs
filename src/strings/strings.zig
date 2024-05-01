const std = @import("std");

test "concat" {
    const hello = "Hello";
    const world = ", world!";
    try std.testing.expectEqualStrings("Hello, world!", hello ++ world);
}

test "runtime concat" {
    const hello = "Hello";
    const world = ", world!";
    const hello_world = try std.mem.concat(std.testing.allocator, u8, &.{ hello, world });
    try std.testing.expectEqualStrings("Hello, world!", hello_world);
}

test "contains" {
    const hello = "Hello, world!";
    try std.testing.expect(std.mem.containsAtLeast(u8, hello, 1, "Hello"));
    try std.testing.expect(!std.mem.containsAtLeast(u8, hello, 1, "Goodbye"));
}
