require_relative 'translate'
require_relative  'write'
require_relative 'progress_bar'
require 'tty-prompt'
require 'tty-progressbar'

languages = {
  "en" => "Inglês",
  "es" => "Espanhol",
  "it" => "Italiano",
  "ja" => "Japonês",
  "pt-BR" => "Português"
}

prompt = TTY::Prompt.new

puts "Escreva um texto"
source_text = gets.chomp
source_lang = prompt.select("Escolha a lingua de origem:", languages.values)
source_lang_key = languages.key(source_lang)
target_lang = prompt.select("Escolha a língua de destino:", languages.values)
target_lang_key = languages.key(target_lang)

translate = Translate.new
translated_text = translate.translate_text(source_text, source_lang_key, target_lang_key)
progress_bar

file = Text.new
file.translate_file(source_text, translated_text)
