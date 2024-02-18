# require_relative 'translate'
# require_relative  'write'
require 'tty-prompt'
require 'tty-progressbar'

# puts "Escreva um texto"
# source_text = gets.chomp
# puts "Digite a lingua de origem"
# source_lang = gets.chomp
# puts "Digite a lingua da tradução"
# target_lang = gets.chomp

# translate = Translate.new
# translated_text = translate.translate_text(source_text, source_lang, target_lang)

# file = Text.new
# file.translate_file(source_text, translated_text)

prompt = TTY::Prompt.new
# response = prompt.select('Escolha uma cor:', %w(Red Green Blue))

# puts "Você escolheu: #{response}"

def progress_bar
bar = TTY::ProgressBar.new("Progresso [:bar]", total: 30)
30.times { sleep(0.1); bar.advance }
end
