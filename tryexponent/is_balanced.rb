# When using a tree data structure, it's common for the tree to 
# become unbalanced over time due to the insertion order of nodes, 
# which can in turn affect the performance of our programs. 
# Let's define a balanced tree as one where the difference in height 
# of the left and right subtrees is at most one, for all nodes in the
# given tree. Write a function is_balanced(node) that determines 
# whether a binary tree is balanced or not.

# Input: The root node of a binary tree

# Output: True if the tree is balanced, False otherwise.

class Node {
  left: Node
  right: Node
  value: any
}

def is_balanced(node)
  # discover maximum height of left
    # go down to every node and get max(height)
  # discover maximum height of right
    # go down to every node and get max(height)
  # compare both of them
  return true if node.nil?

  l_height = get_height(node.left)
  r_height = get_height(node.right)

  return false if (l_height - r_height).abs > 1

  is_balanced(node.left) && is_balanced(node.right)
end

# T(n) = O(n) if we touch all nodes
def get_height(node)
  return 0 if node.nil?

  left = get_height(node.left)
  right = get_height(node.right)

  [left, right].max + 1
end

      a
     / \
    b   c
   / \   \
  d   e   f
is_balanced(a) # => True

     a
    / \
   b   c
        \
         d
is_balanced(a) # => True

     a
    / \
   b   c
        \
         d
          \
           e
is_balanced(a) # => False

      a
     / \
    b   c
   /     \
  d       e
 /         \
f           g
is_balanced(a) # => False
