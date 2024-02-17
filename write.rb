require_relative 'translate'

class Text
  def translate_file(source_text, translated_text)
    time = Time.now
    file_name = time.strftime("%Y-%m-%d %H:%M:%S")
    File.open("#{file_name}.txt", 'w') do |line|
      line.puts "Texto original: #{source_text}"
      line.puts "Texto traduzido para italiano: #{translated_text}"
    end
  end
end
