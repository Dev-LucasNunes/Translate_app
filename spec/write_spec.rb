require_relative '../write'

RSpec.describe Text do
  describe '#translate_file' do
    it 'writes source text and translated text to a file' do
      source_text = 'Hello, world!'
      translated_text = 'Olá, mundo!'
      file_name = 'test_file.txt'

      text = Text.new
      text.translate_file(source_text, translated_text)

      # Verifica se o arquivo foi criado
      expect(File.exist?(file_name)).to be true

      # Verifica se o conteúdo do arquivo está correto
      file_content = File.read(file_name)
      expect(file_content).to include("Texto original: #{source_text}")
      expect(file_content).to include("Texto traduzido: #{translated_text}")

      # Remove o arquivo de teste após os testes
      File.delete(file_name)
    end
  end
end
