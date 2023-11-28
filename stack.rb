# LC 20.Valid Parentheses

## 해시 사용 버전
def is_valid_by_hash(s)

  ## 아래 코드와 같은 동작
  # map = {
  #   '(' => ')',
  #   '{' => '}',
  #   '[' => ']'
  # }

  map = {}
  map['('] = ')'
  map['{'] = '}'
  map['['] = ']'

  stack = []

  s.each_char do |c|
    if map.key?(c)
      stack.push(c)
    else
      return false if stack.empty? || c != map[stack.pop]
    end
  end

  stack.empty?
end

def is_valid_by_stack(s)
  stack = []

  s.each_char do |c|
    case c
    when '(', '{', '['
      stack.push(c)
    when ')'
      return false if stack.empty? || stack.pop != '('
    when '}'
      return false if stack.empty? || stack.pop != '{'
    when ']'
      return false if stack.empty? || stack.pop != '['
    else
      return false
    end
  end

  stack.empty?
end

s1 = '()'
s2 = '(){}[]'
s3 = '(]'
s4 = '([)]'
s5 = '{[]}'

puts is_valid_by_hash(s1)
puts is_valid_by_hash(s2)
puts is_valid_by_hash(s3)
puts is_valid_by_hash(s4)
puts is_valid_by_hash(s5)
puts is_valid_by_stack(s1)
puts is_valid_by_stack(s2)
puts is_valid_by_stack(s3)
puts is_valid_by_stack(s4)
puts is_valid_by_stack(s5)
