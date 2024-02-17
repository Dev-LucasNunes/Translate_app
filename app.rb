require_relative 'translate'
require_relative  'write'

source_text = "Hello World!"
source_lang = "en"
target_lang = "pt-BR"

translate = Translate.new
translated_text = translate.translate_text(source_text, source_lang, target_lang)

file = Text.new
file.translate_file(source_text, translated_text)
