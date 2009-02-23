
def macro_hash_to_locals(receiver, hash, *args)
  args.inject("") { |acc, arg|
    acc << "#{arg} = #{hash}[:#{arg}]\n"
  }
end

def f(opts)
  hash_to_locals(opts, a, b, c)
  p [a, b, c]
end

f(:a => 33, :b => 44, :c => 55)

