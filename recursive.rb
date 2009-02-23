
def macro_fib(receiver, n_str)
  n = n_str.to_i
  if n == 1 or n == 2
    "1"
  else
    %{
      fib(#{n - 1}) + fib(#{n - 2})
    }
  end
end

p fib(1)
p fib(2)
p fib(3)
p fib(4)
p fib(5)
p fib(6)
p fib(7)
