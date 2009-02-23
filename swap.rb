
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

a = 33
b = 44
swap(a, b)
p a  #=> 44
p b  #=> 33
