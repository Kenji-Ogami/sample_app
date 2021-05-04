require 'benchmark/ips'
STRING_HASH = { "foo" => "bar"}
SYMBOL_HASH = { :foo => "bar"}
INTEGER_HASH = { 1 => "bar"}
puts "Reading Result ======================="
Benchmark.ips do |x|
  x.report("String") { STRING_HASH["foo"] }
  x.report("Symbol") { SYMBOL_HASH[:foo] }
  x.report("Integer") { INTEGER_HASH[1] }
  x.compare!
end

puts "Writing Result ======================="
Benchmark.ips do |x|
  x.report("String") { STRING_HASH["foo"] = "test" }
  x.report("Symbol") { SYMBOL_HASH[:foo]  = "test"}
  x.report("Integer") { INTEGER_HASH[1]  = "test"}
  x.compare!
end