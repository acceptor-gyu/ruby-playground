class MaxHeap

  def initialize
    @heap = []
  end

  def push(value)
    @heap << value
    heapify_up
  end

  def pop
    return nil if @heap.empty?

    # 최대 값
    max_value = @heap[0]

    # 마지막 노드를 루트로 이동하고 heapify_down 수행
    last_value = @heap.pop
    unless @heap.empty?
      @heap[0] = last_value
      heapify_down
    end

    max_value
  end

  private

  def heapify_up
    current_index = @heap.length - 1

    while current_index > 0

      # 부모 노드와 비교
      parent_index = (current_index - 1) / 2
      break if @heap[parent_index] >= @heap[current_index]

      # 부모와 자식 위치 바꾸기
      @heap[parent_index], @heap[current_index] = @heap[current_index], @heap[parent_index]
      current_index = parent_index
    end
  end

  def heapify_down
    current_index = 0

    while true
      left_child_index = 2 * current_index + 1
      right_child_index = 2 * current_index + 2
      largest = current_index

      largest = left_child_index if left_child_index < @heap.length && @heap[left_child_index] > @heap[largest]
      largest = right_child_index if right_child_index < @heap.length && @heap[right_child_index] > @heap[largest]

      break if largest == current_index

      @heap[current_index], @heap[largest] = @heap[largest], @heap[current_index]
      current_index = largest
    end
  end
end