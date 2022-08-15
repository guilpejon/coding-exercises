# Given an array nums of distinct integers,
# return all the possible permutations.
# You can return the answer in any order.

@res = []
def permute(nums, n = nums.size - 1)
  if n.zero?
    @res << nums.dup
    nums
  else
    (0..n).each do |i|
      permute(nums, n - 1)
      if (n - 1).odd?
        nums[1], nums[n] = nums[n], nums[1]
      else
        nums[i], nums[n] = nums[n], nums[i]
      end
    end
  end
  @res
end

p permute([1, 2, 3])
