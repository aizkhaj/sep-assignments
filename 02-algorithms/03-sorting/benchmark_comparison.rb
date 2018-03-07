require_relative 'bubble_sort'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'insertion_sort'
require_relative 'merge_sort'
require_relative 'quick_sort'
require_relative 'selection_sort'
require 'benchmark'

array = (1..50).to_a.shuffle

Benchmark.bm do |x|
  x.report("quick_sort")  { quick_sort(array) }
  x.report("bubble_sort")   { bubble_sort(array) }
  x.report("bucket_sort") { bucket_sort(array) }
  x.report("heap_sort")  { heap_sort(array) }
  x.report("insertion_sort")  { insertion_sort(array) }
  x.report("merge_sort")  { merge_sort(array) }
  x.report("selection_sort") { selection_sort(array) }
end