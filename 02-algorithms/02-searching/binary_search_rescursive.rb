def binary_search_recursive(collection, value, low = 0, high = collection.length - 1)
  if !collection.include?(value)
    return "Value not found."
  end
  
  mid = (low + high) / 2
  if collection[mid] > value
    return binary_search_recursive(collection, value, low, mid - 1)
  elsif collection[mid] < value
    return binary_search_recursive(collection, value, mid + 1, high)
  else
    return mid
  end
end