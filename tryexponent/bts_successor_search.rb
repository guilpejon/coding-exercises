# In a Binary Search Tree (BST), an Inorder Successor of a node is 
# defined as the node with the smallest key greater than the key of
# the input node (see examples below). Given a node inputNode in a BST,
# you're asked to write a function findInOrderSuccessor that returns 
# the Inorder Successor of inputNode. If inputNode has no Inorder 
# Successor, return null.

# Balanced tree => O(log(n)) time 
# Unbalanced tree => O(n) time
# O(1) space complexity
def solution(node)
  if node.right_node != nil
    return find_min_key_within_tree(node.right_node)
  end

  ancestor = node.parent
  child = node

  while (ancestor != nil && child == ancestor.right) do
    child = ancestor
    ancestor = child.parent
  end

  return ancestor
end

def find_min_key_within_tree(input_node)
  while input_node.left_node != nil
    input_node = input_node.left_node
  end
end
