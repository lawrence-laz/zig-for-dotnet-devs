using System.Reflection;
using Xunit;

namespace ZigForDotnetDevs;

public class GenericType<T>
{
    public T GenericField;
}

public class Generics
{
    public string GenericFunction<T>(T genericParameter)
    {
        return genericParameter.ToString();
    }

    [Fact]
    public void GenericTypeTest()
    {
        var instance = new GenericType<int>();
        instance.GenericField = 123;
        Assert.Equal(123, instance.GenericField);
    }

    [Fact]
    public void GenericFunctionTest()
    {
        var result = GenericFunction<int>(123);
        Assert.Equal("123", result);
    }
}
