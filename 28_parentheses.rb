sentence = "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."

def closing(string, open_position)
  parentheticals = []
  paired = {}

  string.chars.each_with_index do |letter, i|
    parentheticals << [i, letter] if letter == "(" || letter == ")"
  end

  until parentheticals.empty? do
    matches = []
    parentheticals.each_with_index do |(index, type), i|
      matches << parentheticals[i..i+1] if type == "(" && parentheticals[i+1][1] == ")"
    end

    matches.each do |o, c|
      paired[o[0]] = c[0]
      parentheticals.delete(o)
      parentheticals.delete(c)
    end
  end

  paired[open_position]
end

p closing(sentence, 10) # 79

# Interview Cake Solution:

# def get_closing_paren(sentence, opening_paren_index)
#     open_nested_parens = 0
#
#     (opening_paren_index + 1).upto(sentence.length - 1) do |position|
#         char = sentence[position]
#
#         if char == '('
#             open_nested_parens += 1
#         elsif char == ')'
#             if open_nested_parens == 0
#                 return position
#             else
#                 open_nested_parens -= 1
#             end
#         end
#     end
#
#     raise Exception, "No closing parenthesis :("
# end
