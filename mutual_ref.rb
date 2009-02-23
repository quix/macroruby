
def macro_swap(receiver, x, y)
  tmp = MacroRuby.gen_string
  %{
    lambda {
      #{tmp} = #{x}
      #{x} = #{y}
      #{y} = #{tmp}
    }.call
  }
end

def macro_test_1(receiver, x, y)
  swap(x, y)
  %{
    p [#{x}, #{y}]
  }
end

def macro_test_2(receiver, x, y)
  %{
    swap(#{x}, #{y})
    p [#{x}, #{y}]
  }
end

1.times {
  a = 33
  b = 44
  test_1(a, b)
}

1.times {
  a = 33
  b = 44
  test_2(a, b)
}

