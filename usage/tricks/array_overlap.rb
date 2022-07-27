# https://stackoverflow.com/questions/44368813/quickly-checking-if-arrays-intersect

<<~markdown
# asdfasd
a & b uses set intersection, so the complexity should be the same as for the OP.
to_set is written in Ruby, while Array#& is written in C, so you might have an advantage.
markdown

a = [1,2,3]
b = [4,5,6]
puts (a & b).any?