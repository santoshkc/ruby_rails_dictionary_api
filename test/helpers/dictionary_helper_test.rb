require "test_helper"

class DictionaryControllerHelperTest < ActionDispatch::IntegrationTest

    test "should not find word when word is empty" do 
        word = ""
        trie = DictionaryHelper::Trie.new()
        assert_equal trie.search(word), false
    end

    test "should not insert word when word is empty" do 
        word = ""
        trie = DictionaryHelper::Trie.new()
        assert_equal trie.insert(word), false
    end

    test "should find word when inserted and searched" do
        word = "hell"
        trie = DictionaryHelper::Trie.new()
        trie.insert(word)
        assert_equal trie.search(word), true
        
        word = word.upcase()
        assert_equal trie.search(word), true
    end

    test "should not find word when not inserted and then searched" do 
        word = "hell"
        trie = DictionaryHelper::Trie.new()
        assert_equal trie.search(word), false
    end

    test "should not find word not available in dictionary" do
        path = Rails.root.join('app', 'assets', 'dictionary', '2of12inf.txt')
        builder = DictionaryHelper::TrieBuilderFromFile.new(path)
        builder.build()

        result = builder.includes?("hello")
        result1 = builder.includes?("hello1")

        assert_equal result, true
        assert_equal result1, false
    end
end