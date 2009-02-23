
module MacroHelper
  BLACK_HOLE = Class.new {
    instance_methods.each { |method|
      unless method =~ %r!^__! or method.to_sym == :object_id
        undef_method method
      end
    }
    def method_missing(*args)
    end
  }.new
end

def macro_andand(receiver)
  tmp = MacroRuby.gen_string
  %{
    lambda {
      #{tmp} = #{receiver}
      if #{tmp}
        #{tmp}
      else
        MacroHelper::BLACK_HOLE
      end
    }.call
  }
end

class A
  def f
    44
  end
end

a = A.new
p nil.andand.f
