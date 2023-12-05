# frozen_string_literal: true

input_file = File.open('input.txt')

input_data = input_file.readlines.map(&:chomp)

word_nums = %w[
  zero
  one
  two
  three
  four
  five
  six
  seven
  eight
  nine
]
# Try using some of the test cases they have provided.
# two1nine
# eightwothree
# abcone2threexyz
# xtwone3four
# 4nineeightseven2
# zoneight234
# 7pqrstsixteen
# In this example, the calibration values are 29, 83, 13, 24, 42, 14, and 76. Adding these together produces 281.

calibration_numbers = input_data.map do |s|
  puts s
  word_nums.each_with_index { |word, i| s.gsub!(word, i.to_s) }
  puts s
  numbers = s.scan(/\d/)
  puts numbers.inspect
  puts "#{s} produces #{numbers.first}#{numbers.last}"
  "#{numbers.first}#{numbers.last}".to_i
end

calibration_sum = calibration_numbers.sum

puts(calibration_sum)
