# String

## Concat

In .NET you can concatenate two strings by simply "adding" them with the plus ("+") operator.
```cs
// C#
var hello = "Hello";
var world = ", world!";
var helloWorld = hello + world;
```

Similarly, in Zig you can concat two strings by "adding" them with the plus-plus ("++") operator.
```rs
// Zig
const hello = "Hello";
const world = ", world!";
const hello_world = hello ++ world;
```

The important distinction here is that Zig operator is compile-time and requires both strings to be compile-time known. 

That is because Zig has "No hidden memory allocations". You probably know that adding many strings using the "+" operator in .NET is inefficient and you should use `StringBuilder` instead. That is because each call to the "+" operator between strings in .NET allocates memory. 

In Zig, this and any other memory sensitive operations are made transparent, because you have to provide an allocator for any operations that allocate memory:

```rs
// Zig
const hello = "Hello";
const world = ", world!";
const hello_world = try std.mem.concat(std.testing.allocator, u8, &.{ hello, world });
```

