# This is the version that improves space complexity. We can do this using an alternative data structure, or using a sorting algorithm that's more efficient on space. In this case, I'm using a quick sort algorithm since it is the most efficient with space (at O(log n)).

require 'benchmark'
# This method takes n arrays as input and combine them in sorted ascending  order
def space_complexity(*arrays)
  combined_array = arrays.flatten
  
  sorted_array = quick_sort(combined_array)
  # Return the sorted array
  return sorted_array
end

# Using quick sort from a previous implementation.
def quick_sort(array, from=0, to=nil)
  if to == nil
    # Sort the whole array, by default
    to = array.count - 1
  end

  if from >= to
    # Done sorting
    return
  end

  # Take a pivot value, at the far left
  pivot = array[from]

  # Min and Max pointers
  min = from
  max = to

  # Current free slot
  free = min

  while min < max
    if free == min # Evaluate array[max]
      if array[max] <= pivot # Smaller than pivot, must move
          array[free] = array[max]
          min += 1
          free = max
      else
          max -= 1
      end
    elsif free == max # Evaluate array[min]
      if array[min] >= pivot # Bigger than pivot, must move
          array[free] = array[min]
          max -= 1
          free = min
      else
          min += 1
      end
    else
      raise "Inconsistent state"
    end
  end

  array[free] = pivot

  quick_sort(array, from, free - 1)
  quick_sort(array, free + 1, to)
end