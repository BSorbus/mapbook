puts "#####  02_load_data.rb - END #####"
puts ""
@files = Dir["#{Rails.root}/to_storage/*.xlsx"]
#@files = Dir["/webapps/www/mapbook/to_storage/*.xlsx"]
for file in @files
    puts '------------------------'

    puts file

    #                    9876543210
    # /sciezka/do_pliku/010101.xlsx
    reverse_file = file.reverse[5..10]
    teryt_code = reverse_file.reverse
    puts teryt_code

    area = Area.find_or_create_by!(teryt: "#{teryt_code}")
	area.file_xlsx.attach(io: File.open("#{file}"), filename: "#{teryt_code}.xlsx", content_type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") unless area.file_xlsx.attached?

    puts '------------------------'
    #sleep 1
end

puts "#####  02_load_data.rb - END #####"
puts ""