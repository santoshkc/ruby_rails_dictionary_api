class DictionaryController < ApplicationController

  skip_before_action :verify_authenticity_token
  
  @builder = nil

  def self.trie_builder
    if @builder.nil?
      path = Rails.root.join('app', 'assets', 'dictionary', '2of12inf.txt')
      @builder = DictionaryHelper::TrieBuilderFromFile.new(path)
      @builder.build()
    end
    @builder
  end

  def search
    builder = DictionaryController.trie_builder()
    word_typed = params[:typedText]

    found = word_typed.blank? ? false : builder.includes?(word_typed)
    render json: { WordFound: found, WordTyped: word_typed }
  end
end
