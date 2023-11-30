class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left= nil
    @right = nil
  end
end

def inorder_traversal(root)
  return [] if root.nil?

  result = []
  result += inorder_traversal(root.left)
  result << root.val
  result += inorder_traversal(root.right)

  result
end

root = TreeNode.new(10)
root.left = TreeNode.new(5)
root.right = TreeNode.new(15)
root.left.left = TreeNode.new(3)
root.left.right = TreeNode.new(7)
root.right.right = TreeNode.new(20)

puts inorder_traversal(root).inspect