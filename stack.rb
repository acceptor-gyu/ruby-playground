# LC 20.Valid Parentheses

## 해시 사용 버전
def is_valid(s)

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
