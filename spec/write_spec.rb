require_relative '../write'
require 'tempfile'

RSpec.describe Text do
 describe '#translate_file' do
    it 'escreve o texto original e o texto traduzido em um arquivo' do
      # Definindo os dados de entrada para o teste
      source_text = 'Texto de exemplo'
      translated_text = 'Exemplo de texto traduzido'

      # Criando um arquivo temporário para o teste
      tempfile = Tempfile.new(['test', '.txt'])
      begin
        # Instanciando a classe Text
        text_instance = Text.new

        # Criando um stub para a classe Translator
        allow_any_instance_of(Translate).to receive(:translate_text).and_return(translated_text)

        # Chamando o método a ser testado
        text_instance.translate_file(source_text, translated_text, tempfile.path)

        # Verificando se o arquivo foi criado corretamente
        file_content = File.read(tempfile.path)

        # Verifica se o conteúdo foi escrito corretamente no arquivo
        expect(file_content).to include("Texto original: #{source_text}")
        expect(file_content).to include("Texto traduzido: #{translated_text}")
      ensure
        # Garante que o arquivo temporário seja excluído após o teste
        tempfile.unlink
      end
    end
 end
end
