
def macro_locals_to_hash(receiver, *args)
  args.inject("{") { |acc, arg|
    acc << ":#{arg}=>#{arg},"
  } << "}"
end

a = 33
b = 44
h = locals_to_hash(a, b)
p h  # => { :a => 33, :b => 44 }
