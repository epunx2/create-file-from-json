class CreateUpdateFile
  attr_accessor :output, :input, :content, :headers

  def initialize(name,input)
    self.input(input) 
    self.output = @headers + "\n" + @content
    self.write_to_file(name)
  end

  def input(input)
    content = JSON.parse(input)
    @content = self.format(content.values)
    @headers = self.format(content.keys)
  end

  def update_file(name, input)
    self.input(input)
    self.output = @content
    self.write_to_file(name)
  end

  def write_to_file(name)
    File.write(name, @output, mode: "a")
  end

  def format(input)
    length = input.length
    output = ""
    length.times { |i|
      temp_output = "#{input[i]}"
      if length > i
        temp_output << " | "
      end
      output << temp_output
    }
    output
  end
end