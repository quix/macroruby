
def macro_try(receiver, method, *args)
  tmp = MacroRuby.gen_string
  send_args = [method, *args].join(",")
  %{
    lambda {
      #{tmp} = #{receiver}
      if #{tmp}.respond_to?(#{method})
        #{tmp}.send(#{send_args})
      else
        nil
      end
    }.call
  }
end

class A
  def f
    99
  end
end

a = A.new
p a.try(:f)                    #=> 99
p (1 == 2 ? nil : a).try(:f)   #=> 99
p a.try(:g)                    #=> nil
p nil.try(:g)                  #=> nil
