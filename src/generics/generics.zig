const std = @import("std");

pub fn GenericType(T: type) type {
    return struct {
        generic_field: T,
    };
}

test GenericType {
    const instance = GenericType(i32){ .generic_field = 123 };
    try std.testing.expectEqual(@as(i32, 123), instance.generic_field);
}

pub fn genericFunction(T: type, generic_parameter: T, allocator: std.mem.Allocator) ![]const u8 {
    return std.fmt.allocPrint(allocator, "{d}", .{generic_parameter});
}

test genericFunction {
    const result = try genericFunction(i32, 123, std.testing.allocator);
    try std.testing.expectEqualSlices(u8, "123", result);
}
