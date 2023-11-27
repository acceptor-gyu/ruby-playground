# LC 138. Copy List with Random Pointer

# Definition for Node.
class Node
  attr_accessor :val, :next, :random

  def initialize(val = 0)
    @val = val
    @next = nil
    @random = nil
  end
end

def copy_random_list(head)
  return nil if head.nil?

  map = {}

  new_head = Node.new(head.val)
  cur = new_head

  map[head] = new_head

  while head
    # next 포인터와 random 포인터 연결 처리
    if head.next
      map[head.next] ||= Node.new(head.next.val)
      cur.next = map[head.next]
    end

    if head.random
      map[head.random] ||= Node.new(head.random.val)
      cur.random = map[head.random]
    end

    head = head.next
    cur = cur.next
  end

  new_head
end
