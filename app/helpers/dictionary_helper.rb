module DictionaryHelper
    # Reads a text file containing word on each line
    # and then construct trie structure.
    class TrieBuilderFromFile
        def initialize(file_path)
            
            @file_path = file_path
            @trie = Trie.new
        end

        # builds trie by reading word
        # line by line from file
        def build
          IO.foreach(@file_path) {|block| 
              @trie.insert(block)
          }
        end

        # decides whether given word in present in trie.
        def includes?(token)
            return @trie.search(token)
        end
    end

    # Stores info realted to children nodes  
    # and if given node is leaf/terminal node.
    class TrieNode
        attr_accessor :is_terminal, :character
        attr_reader :children
    
        def initialize(char_value)
          @is_terminal = false
          @children = {}
          @character = char_value
        end
      end
    
      # Represents Trie datastructure for word retrieval
      class Trie
        def initialize
          # start root node with special character *
          @root = TrieNode.new('*')
        end
    
        # inserts given word to trie
        def insert(word_to_insert)
          return false if word_to_insert.blank?
          pointer = @root

          word_to_insert = word_to_insert.strip().downcase()

          word_to_insert.chars.each do |char|
            child = pointer.children[char]
            if child.nil?
              new_node = TrieNode.new(char)
              pointer.children[char] = new_node
            end
            pointer = pointer.children[char]
          end
          pointer.is_terminal = true
          return true
        end
    
        # checks wheather given word in present in trie or not
        def search(word_to_search)
          return false if word_to_search.blank?
          
          word_to_search = word_to_search.strip().downcase()
          pointer = @root
          word_to_search.chars.each do |char|
            child = pointer.children[char]
    
            return false if child.nil?
    
            pointer = child
          end
    
          return pointer.is_terminal unless pointer.nil?
    
          false
        end
      end
end
