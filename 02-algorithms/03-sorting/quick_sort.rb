require 'benchmark'

def swap(array, first_index, second_index)
  temp = array[first_index]
  array[first_index] = array[second_index]
  array[second_index] = temp
end

def partition(array, low, high)
  counter = low
  (low...high).each do |j|
    if (array[j] <= array[high])
      swap(array, j, counter)
      counter += 1
    end
  end
  swap(array, high, counter)
  return counter
end

def quick_sort(array, low, high)
  if (low < high)
    index = partition(array, low, high)
 
    quick_sort(array, low, index - 1)
    quick_sort(array, index + 1, high)
  end
  array
end

arr = [9, 7, 5, 11, 12, 2, 14, 3, 10, 6]
n = arr.length
sorted = quick_sort(arr, 0, n-1)
p sorted
# [2, 3, 5, 6, 7, 9, 10, 11, 12, 14]

puts Benchmark.measure {sorted}
# 0.000000   0.000000   0.000000   (0.000004)