
using System.Collections.Generic;
using Xunit;

namespace ZigForDotnetDevs;

public class Dictionary
{
    [Fact]
    public void CreateAndUse()
    {
        var dictionary = new Dictionary<int, string>();

        dictionary.Add(123, "foo");
        dictionary.Add(456, "bar");
        dictionary.Add(789, "baz");

        dictionary.TryGetValue(123, out var value123);
        Assert.Equal("foo", value123);
        Assert.Equal("bar", dictionary[456]);
        Assert.Equal("baz", dictionary[789]);
    }
}
