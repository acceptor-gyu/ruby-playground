# Middle of Linked List
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

class Solution

  def middle_node(head)
    walker = head
    runner = head

    while runner != nil
      runner = runner.next

      if runner != nil
        walker = walker.next
        runner = runner.next
      end
    end

    walker
  end
end

node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(3)
node4 = ListNode.new(4)
node5 = ListNode.new(5)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

solution = Solution.new

puts solution.middle_node(node1).val
