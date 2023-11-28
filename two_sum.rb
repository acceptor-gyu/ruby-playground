# LC.1 Two sum

# 설계 후 코드 작성!!!!!!!
# 시간 복잡도 <-> 공간 복잡도
# solve1. brute-force 모든 조합을 시도.
  # 시간 복잡도: O(N*(N-1)) / 2
  # 공간 복잡도: O(1)
# solve2. hash 사용, 루프 1개 돌면서 이미 봤던 값을 해시에 넣음
  # 시간 복잡도: O(N)
  # 공간 복잡도: O(N)

def two_sum_solve1(nums, target)
  (0...nums.leng).each do |i|
    ((i + 1)...nums.length).each do |j|
      if nums[i] + nums[j] == target
        return [i, j]
      end
    end
  end

  nil
end

def two_sum_solve2(nums, target)
  map = {}    # key - nums의 요소의 값, value - 인덱스

  nums.each_with_index do |num, idx|

    complement = target - num

    if map.key?(complement)
      return [map[complement], idx]
    else
      map[num] = idx
    end
  end

  nil
end