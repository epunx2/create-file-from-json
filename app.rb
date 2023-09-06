require 'json'
require 'logger'
require_relative 'lib/create_file.rb'

file_name = "content.txt"
content = '{"First Name": "John", "Last Name": "Adams", "Age": "85"}'
file_obj = CreateUpdateFile.new(file_name, content)

new_content = '{"First Name": "Eric", "Last Name": "Chrobak", "Age": "39"}'
file_obj.update_file(file_name,new_content)