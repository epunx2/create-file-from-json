class CreateUpdateFile
  attr_accessor :file_name, :file_output, :file_input

  def initialize(file_input)
    self.file_input = file_input
    self.file_output = ""
  end
  
  def set_headers(headers)
    header_length = headers.length
    iteration = 0
    headers.each do |i|
      iteration += 1
      if header_length != iteration
        @file_output << "#{i} | "
      else
        @file_output << "#{i}"
      end
    end
  end

  def set_content(content)
    @file_output += content
  end

  def create_file(file_name,headers, content)
    self.set_headers(headers)
    self.set_content(content)
    File.write(file_name, @file_output, mode: "a")
  end

  def write_to_file(file_name,content)
    File.write(file_name, content, mode: "a")
  end
end

headers = ["First Name", "Last Name", "Age"]
content = "John | Adams | 85"
file_obj = CreateUpdateFile.new()
file_obj.create_file("content.txt",headers,content)
new_content = "Eric | Chrobak | 39"
file_obj.write_to_file("content.txt",new_content)