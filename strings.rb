# Determine if a string has all unique characters

def all_uniq?(str)
  char_map = Hash.new
  str.chars.each do |char|
    return false if char_map[char]
    char_map[char] = true
  end
  true
end

#what if you cannot use additional data structures?

def all_uniq2?(str)
  str.chars.sort!.each_slice(2) do |char1, char2|
    return false if char1 == char2
  end
  true
end

# reverse a string in place
def reverse(str)
  length = str.length
  str.length.times do |i|
    return str if i + 1 > length.fdiv(2)
    temp = str[i]
    str[i] = str[length - i - 1]
    str[length - i - 1] = temp
  end
  str
end

#given two strings, write a method to determine if one string is a permutation of the other

def is_permutation?(str1, str2)
  hash1 = build_char_map(str)
  hash2 = build_char_map(str2)
  hash1 == hash2
end

def build_char_map(str)
  char_map = Hash.new(0)
  str.chars.each do |char|
    char_map[char] += 1
  end
  char_map
end

# Write a function that compresses a string from aaabbcc => a3b2c2

def compress(str)
  prev_char = nil
  compressed = ""
  count = 1
  str.chars.each_with_index do |char, i|
    if char == prev_char
      count += 1
    elsif prev_char
      compressed << prev_char + count.to_s
      count = 1
    end
    prev_char = char
  end
  compressed << prev_char + count.to_s
  [str, compressed].min_by(&:length)
end

#given a 2x2 grid of size MxN, make every row and column that has a 0 in it become all 0s

def run_zeroes(grid)
  zero_cols = Set.new
  grid.length.times do |i|
    row_filled = false
    grid.first.length.times do |j|
      if grid[i][j] == 0
        fill_row_with_zeroes!(grid, i) unless row_filled
        row_filled = true
        zero_cols << j
      end
    end
  end
  zero_cols.each { |j| fill_col_with_zeroes!(grid, j) }
  grid
end

def fill_row_with_zeroes!(grid, i)
  grid[i].map! { |el| 0 }
end

def fill_col_with_zeroes!(grid, j)
  (0...grid.length).times do |i|
    grid[i][j] = 0
  end
end
