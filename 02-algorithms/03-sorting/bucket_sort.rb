require 'benchmark'

def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end

    break if not swapped
  end

  array
end

arr = [9, 7, 5, 11, 12, 2, 14, 3, 10, 6]

sorted = bubble_sort(arr)
p sorted

puts Benchmark.measure {sorted}