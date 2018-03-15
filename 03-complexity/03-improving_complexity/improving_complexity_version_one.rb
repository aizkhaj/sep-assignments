# This is the version with code optimizations.

require 'benchmark'
# This method takes n arrays as input and combine them in sorted ascending order
def code_optimization(*arrays)
combined_array = arrays.flatten

sorted_array = [combined_array.delete_at(combined_array.length-1)]

for val in combined_array
  i = 0
  while i < sorted_array.length
    current_sorted_array_item = sorted_array[i]
    if val <= current_sorted_array_item
      sorted_array.insert(i, val)
      break
    elsif i == sorted_array.length - 1
      sorted_array << val
      break
    end
    i+=1
  end
end

# Return the sorted array
sorted_array
end