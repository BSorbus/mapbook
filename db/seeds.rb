# frozen_string_literal: true

puts ''
puts '#####  RUN - test.rb  #####'
puts ''

# rubocop:disable LineLength
Dir[File.join(Rails.root, 'db', 'seed_file', '*seed.rb')].sort.each { |seed| load seed }
# rubocop:enable LineLength

puts ''
puts '#####  END OF - test.rb  #####'
puts ''
