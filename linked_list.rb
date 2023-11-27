# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}

## LinkedList

## Input
# list 1 = [1, 2, 4], list2 = [1, 3, 4]
## Output
# [1, 1, 2, 3, 4, 4]

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def merge_two_lists(list1, list2)
  ret = nil
  cur = nil

  while list1 || list2

    if list2.nil? || (list1 && list1.val < list2.val)
      # pick from list1
      if ret.nil?
        ret = list1
        cur = list1
        list1 = list1.next
      else
        cur.next = list1
        cur = cur.next
        list1 = list1.next
      end
    else
      if ret.nil?
        ret = list2
        cur = list2
        list2 = list2.next
      else
        cur.next = list2
        cur = cur.next
        list2 = list2.next
      end
    end
  end
  ret
end

# 테스트를 위한 예시 노드들 생성
node1 = ListNode.new(1, ListNode.new(3, ListNode.new(5)))
node2 = ListNode.new(2, ListNode.new(4, ListNode.new(6)))

# merge_two_lists 메서드 호출
merged_list = merge_two_lists(node1, node2)

# 병합된 리스트 출력
while merged_list
  if merged_list.next.nil?
    print "#{merged_list.val}"
    return
  end
  print "#{merged_list.val} -> "
  merged_list = merged_list.next
end
# 출력: 1 -> 2 -> 3 -> 4 -> 5 -> 6 ->

merge_two_lists = merge_two_lists(list1, list2)
puts merge_two_lists
