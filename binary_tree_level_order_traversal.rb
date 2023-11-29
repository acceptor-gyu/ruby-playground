class Solution

  def level_order_bottom(root)

    ret = []

    return ret if root.nil?

    q = Queue.new
    q << root

    while !q.empty?
      level = []
      size = q.length

      size.times do
        node = q.pop
        level << node.val
        q << node.left if node.left
        q << node.right if node.right
      end
      ret.unshift(level)
    end
    ret
  end
end

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

root = TreeNode.new(1)
root.left = TreeNode.new(9)
root.right = TreeNode.new(20)
root.right.left = TreeNode.new(15)
root.right.right = TreeNode.new(7)

solution = Solution.new


puts solution.level_order_bottom(root)