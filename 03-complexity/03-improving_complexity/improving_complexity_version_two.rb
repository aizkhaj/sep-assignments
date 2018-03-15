# This is the version that improves time complexity. We do this using merge_sort - which has the best case for Big O of O(n log n).

require 'benchmark'
# This method takes n arrays as input and combine them in sorted ascending  order
def time_complexity(*arrays)
  combined_array = []
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end
  
  sorted_array = merge_sort(combined_array)
     
# Return the sorted array
  return sorted_array
end

def merge_sort(collection)
  if collection.length <= 1
    collection
  else
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end