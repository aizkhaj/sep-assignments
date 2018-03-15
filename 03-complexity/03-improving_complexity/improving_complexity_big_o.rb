require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'
require_relative 'improving_complexity_version_three'
require_relative 'poorly_written'
require 'benchmark'


collection = (1..500).to_a.shuffle

array1 = []
array2 = []
array3 = []
array4 = []

100.times do
  array1 << collection.sample
  array2 << collection.sample
  array3 << collection.sample
  array4 << collection.sample
end

Benchmark.bm do |x|
  x.report("code_optimization")  { code_optimization(array1, array2, array3, array4) }
  x.report("time_complexity")   { time_complexity(array1, array2, array3, array4) }
  x.report("space_complexity") { space_complexity(array1, array2, array3, array4) }
  x.report("poor_code") { poorly_written_ruby(array1, array2, array3, array4) }
end