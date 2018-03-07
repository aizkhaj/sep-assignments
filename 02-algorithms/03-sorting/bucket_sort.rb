require_relative 'insertion_sort'

def bucket_sort(array)
  min = array.min
  max = array.max
  n = array.count
  buckets = Array.new(10)
  divider = ((max + 1) / buckets.count).ceil
  
  array.each do |element|
    j = (element / divider).floor
    
    if buckets[j] == nil
      buckets[j] = [element]
    else
      buckets[j] << element
    end
  end
  
  buckets.map! {|bucket| insertion_sort(bucket) }
  return buckets.compact.flatten
end