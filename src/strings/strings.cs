using System.Text;
using Xunit;

namespace ZigForDotnetDevs;

public class Strings
{
    [Fact]
    public void Concat()
    {
        var hello = "Hello";
        var world = ", world!";
        Assert.Equal("Hello, world!", hello + world);
    }

    [Fact]
    public void ConcatUsingStringBuilder()
    {
        var stringBuilder = new StringBuilder();
        stringBuilder.Append("Hello");
        stringBuilder.Append(", world!");
        Assert.Equal("Hello, world!", stringBuilder.ToString());
    }

    [Fact]
    public void Contains()
    {
        var hello = "Hello, world!";
        Assert.True(hello.Contains("Hello"));
        Assert.False(hello.Contains("Goodbye"));
    }
}
