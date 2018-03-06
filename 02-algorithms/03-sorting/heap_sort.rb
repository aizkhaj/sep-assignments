require 'benchmark'

def swap(array, first_index, second_index)
  temp = array[first_index]
  array[first_index] = array[second_index]
  array[second_index] = temp
end

def heapify(heap, i, max)
  while (i < max)
    index = i
    left_child = 2*i + 1
    right_child = left_child + 1
    
    if (left_child < max && heap[left_child] > heap[index])
      index = left_child
    end
    
    if (right_child < max && heap[right_child] > heap[index])
      index = right_child
    end
    
    if (index == i)
      return
    end
    
    swap(heap, i, index)
    i = index
  end
end

def build_max_heap(array)
  i = array.length / 2 - 1
  i.floor
  
  while (i >= 0)
    heapify(array, i, array.length)
    i -= 1
  end
end

def heap_sort(array)
  build_max_heap(array)
  
  last_element = array.length - 1
  
  while (last_element > 0)
    swap(array, 0, last_element)
    heapify(array, 0, last_element)
    last_element -= 1
  end
  array
end

arr = [9, 7, 5, 11, 12, 2, 14, 3, 10, 6]
sorted = heap_sort(arr)
p sorted

puts Benchmark.measure {sorted}
