const std = @import("std");

test "dictionary" {
    var hashmap = std.AutoHashMap(u128, []const u8).init(std.testing.allocator);
    defer hashmap.deinit();

    try hashmap.put(123, "foo");
    try hashmap.put(456, "bar");
    try hashmap.put(789, "baz");

    try std.testing.expectEqualSlices(u8, "foo", hashmap.get(123).?);
    try std.testing.expectEqualSlices(u8, "bar", hashmap.get(456).?);
    try std.testing.expectEqualSlices(u8, "baz", hashmap.get(789).?);
}
