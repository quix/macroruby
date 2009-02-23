
task :default do
  Dir["*.rb"].each { |example|
    puts "="*60
    puts "example #{example}"
    unless system("./macroruby", example)
      raise "example #{example} failed"
    end
    puts
  }
end
