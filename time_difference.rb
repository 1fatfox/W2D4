require "byebug"

def my_min1(list)
  list.each_index do |i|
    return list[i] if list.each_index.all? { |j| list[j] >= list[i] }
  end
end

#this above is O(n^2) incase you were curious

def my_min2(list)
  smallest = list[0]
  list.drop(1).each do |el|
    if el < smallest
      smallest = el
    end
  end
  smallest
end

#this above is 0(n) is linear time ;)


def sub_sum(list)
  max = nil
  sub_arrs = []

  list.each_index do |i|
    list.each_index do |j|
      sub_arr = list[i..j]
      sub_arrs << sub_arr unless sub_arrs.include?(sub_arr) || sub_arr.length <= 0
    end
  end
  sub_arrs
  sub_arrs.each.with_index do |arr, i|
    sub_arrs[i] = arr.reduce(:+)
    if max.nil? || sub_arrs[i] > max
      max = sub_arrs[i]
    end
  end
  max
end

# this above is O(n^2) + O(n) so, it ultimately evaluates to O(n^2)

def sub_sum2(list)
  max = list.first
  current = 0
  list.each do |el|
    current += el
    if current > max
      max = current
    end
    if current < 0
      current = 0
    end
  end
  max
end

#this above is O(n)

def first_anagram?(str1, str2)
  perms = str1.chars.permutation.to_a
  perms.include?(str2.chars)
end

#this above is O(n!) + O(n)

def second_anagram?(str1, str2)
  str1.chars.each do |el|
    str2.delete!(str2[str2.chars.find_index(el)]) unless str2.chars.find_index(el).nil?
  end

  str2.empty?
end

#this above is O(n^2)

def third_anagram?(str1, str2)
  str1_sorted = str1.chars.sort
  str2_sorted = str2.chars.sort
  str1_sorted == str2_sorted
end

#this above is O(n log n)

def fourth_anagram?(str1, str2)
  h1 = Hash.new(0)
  h2 = Hash.new(0)

  str1.chars.each do |el1|
    h1[el1] += 1
  end

  str2.chars.each do |el2|
    h1[el2] -= 1
  end

  h1.values.all? { |val| val == 0}
end

# O(n)

def bad_two_sum?(arr, target_sum)
  pairs = []

  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      pairs << [arr[i], arr[j]] if arr[i] + arr[j] == target_sum unless i == j
    end
  end

  !pairs.empty?
end

#O(n ** 2)

def okay_two_sum?(arr, target_sum)
  arr = arr.sort!

end
