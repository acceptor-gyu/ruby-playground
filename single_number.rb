# LC.136

def single_number(nums)
  hash = {}

  nums.each do |num|
    if hash.key?(num)
      hash.delte(num)
    else
      hash[num] = true
    end
  end

  hash.keys.first
end

# 또는 XOR 연산 사용
