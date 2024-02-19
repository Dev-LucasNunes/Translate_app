require_relative 'translate'
require_relative  'write'
require_relative 'progress_bar'
require 'tty-prompt'
require 'tty-progressbar'
require 'colorize'

languages = {
  "en" => "In".colorize(:blue) + "gl".colorize(:white) + "ês".colorize(:red),
  "es" => "Espa".colorize(:red) + "nhol".colorize(:yellow),
  "it" => "It".colorize(:green) + "ali".colorize(:white) + "ano".colorize(:red),
  "ja" => "Japo".colorize(:white) + "nês".colorize(:red),
  "pt-BR" => "Port".colorize(:green) + "uguês".colorize(:yellow),
  "fr" => "Fra".colorize(:blue) + "nc".colorize(:white) + "ês".colorize(:red)
}

prompt = TTY::Prompt.new

puts "Escreva um texto e pressione enter"
source_text = gets.chomp
source_lang = prompt.select("Escolha a lingua de origem:", languages.values)
source_lang_key = languages.key(source_lang)
target_lang = prompt.select("Escolha a língua de destino:", languages.values)
target_lang_key = languages.key(target_lang)

translated_text = nil
translation_thread = Thread.new do
  translate = Translate.new
  translated_text = translate.translate_text(source_text, source_lang_key, target_lang_key)
end

until translation_thread.join(0.1) do
  progress_bar
end

translated_text = translation_thread.value

if translated_text == "NO QUERY SPECIFIED. EXAMPLE REQUEST: GET?Q=HELLO&LANGPAIR=EN|IT"
  puts "Por favor, insira um texto para tradução.".colorize(:red)
elsif translated_text == "PLEASE SELECT TWO DISTINCT LANGUAGES"
  puts "Por favor escolha linguagens distintas.".colorize(:red)
elsif translated_text == source_text
  puts "Linguagem de origem ou destino inválidas.".colorize(:red)
else
  file = Text.new
  file.translate_file(source_text, translated_text)
  puts "Texto de origem:".colorize(:blue) + source_text
  puts "*******************************************************************"
  puts "Texto traduzido:".colorize(:blue) + translated_text
end
