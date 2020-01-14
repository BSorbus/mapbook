# frozen_string_literal: true

puts '#####  01_load_data.rb - END #####'
puts ''
@files = Dir["#{Rails.root}/to_storage/*.pdf"]
# @files = Dir["/webapps/www/mapbook/to_storage/*.pdf"]
@files.each do |file|
  puts '------------------------'

  puts file

  #                   9876543210
  # /sciezka/do_pliku/010101.pdf
  reverse_file = file.reverse[4..9]
  teryt_code = reverse_file.reverse
  puts teryt_code

  area = Area.find_or_create_by!(teryt: teryt_code.to_s)
  unless area.file_pdf.attached?
    area.file_pdf.attach(io: File.open(file.to_s), filename: "#{teryt_code}.pdf", content_type: 'application/pdf')
 end

  puts '------------------------'
  # sleep 1
end

puts '#####  01_load_data.rb - END #####'
puts ''
