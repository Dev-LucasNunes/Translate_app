require 'net/http'
require 'uri'
require 'json'


def translate_text(text, source_lang, target_lang)
  uri = URI.parse("https://api.mymemory.translated.net/get?q=#{URI.encode_www_form_component(text)}&langpair=#{source_lang}|#{target_lang}")
  response = Net::HTTP.get_response(uri)

  if response.is_a?(Net::HTTPSuccess)
    result = JSON.parse(response.body)
    translation = result["responseData"]["translatedText"]
    return translation
  else
    puts "Erro ao traduzir o texto: #{response.message}"
    return nil
  end
end


source_text = "Hello World!"
source_lang = "en"
target_lang = "pt-BR"

translated_text = translate_text(source_text, source_lang, target_lang)
puts "Texto original: #{source_text}"
puts "Texto traduzido para italiano: #{translated_text}"
