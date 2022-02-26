# Given a root of a Binary Search Tree (BST) and a number num, implement an efficient function 
# findLargestSmallerKey that finds the largest key in the tree that is smaller than num.
# If such a number doesn't exist, return -1. Assume that all keys in the tree are nonnegative.
# https://www.tryexponent.com/courses/software-engineering/swe-practice/largest-smaller-bst-key

# O(log(n)) time if balanced
# O(n) time if not balanced
# O(1) space
def findLargestSmallerKey(node, num)
  solution = -1

  while(node != nil) do
    if (node.value > num)
      node = node.left
    else
      solution = node
      node = node.right
    end
  end
  
  solution
end
