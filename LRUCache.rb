class LRUCache
  class CacheItem
    attr_accessor :key, :value, :prev, :next

    def initialize(key, value)
      @key = key
      @value = value
    end
  end

  def initialize(capacity)
    @head = nil
    @tail = nil
    @capacity = capacity
    @hash = {}
  end

  def get(key)

    return -1 unless @hash.key?(key) # hash에 key가 없으면 -1 반환

    cur = @map[key]

    unless cur == @head
      if cur == @tail
        @tail = @tail.prev
      end

      if cur.prev
        cur.prev.next = cur.next
      end

      cur.next = @head
      @head.prev = cur
      cur.prev = nil
      @head = cur
    end

    cur.value
  end

  def put(key, value)
    if get(key) == -1
      cur = CacheItem.new(key, value) # initialize라고 생성자 함수를 만들어야 new 사용 가능

      if @head.nil? # 캐시에 데이터가 하나도 없으면
        @head = cur
        @tail = cur
      end

      @map[key] = cur

      if @map.size > @capacity
        @map.delete(@tail.key)
        @tail.prev.next = nil
        @tail = @tail.prev
      end
    else
      @map[key].value = value
    end
  end
end
