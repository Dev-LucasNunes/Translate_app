require 'net/http'

example = Net::HTTP.get('example.com', '/index.html')

File.open('example.html', 'w') do |line| #ele vai e faz uma chamada web trazendo esse site, no caso o html dele
  line.puts(example)                     #nessa linha vc coloca o nome que vc quer dar para seu html
end
