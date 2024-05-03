# Generics

## Types
In .NET, there is a separate syntax for providing type parameters.
```cs
// C#
public class GenericType<T>
{
    public T GenericField;
}

var instance = new GenericType<int>
{ 
    GenericField = 123 
};
```
Zig doesn't have a separate syntax for generics. Instead, generics naturally emerge from comptime and the fact that types are treated as first-class citizens. 

In other words, Zig can have a function, which accepts type as a parameter and then uses that parameter to construct and return a concrete type. A type factory if you will.
```rs
// Zig
pub fn GenericType(T: type) type {
    return struct {
        generic_field: T,
    };
}

const instance = GenericType(i32){ .generic_field = 123 };
```
An equivalent method in pseudo-C# would look something like this:
```cs
// Pseudo C#
public Type GenericType(Type T)
{
    return class
    {
        public T GenericField;
    };
}
```

## Functions
Functions work pretty much the same as the types.
```cs
// C#
public string GenericFunction<T>(T genericParameter)
{
    // ...
}
```
```rs
// Zig
pub fn genericFunction(T: type, generic_parameter: T) ![]const u8 {
    // ...
}
```
