# Given a sorted array, find the index of the first element >= X 
# (return -1 if no element >= X)

def lower_bound(arr, x)
  left = 0
  right = arr.size - 1

  return left if arr[left] >= x
  return -1 if arr[right] < x

  while (left + 1 < right) # arr[left] < x && arr[right] >= x
    mid = (left + right) / 2
    if arr[mid] < x
      left = mid
    else
      right = mid
    end
  end

  return right
end

[0 1 2 3 4 5 6 ]
[1 3 5 6 7 8 10]

x = 7
left = 5
right = 7
