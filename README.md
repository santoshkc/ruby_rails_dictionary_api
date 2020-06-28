# Steps followed for development of API
* skipped generation of specs, assets etc. in application.rb
* Installed gem rack-cors and added to gemfile
* Added cors to application.rb
* Added dictionary file(text file 2of12inf.txt) in app/assets/dictionary directory
  and used same to build trie datastructure
* Created dictionary controller and dictionary helper class. DictionaryHelper contains code to build 
  trie datastructure.
* route mapping for /api/word to dictionary#search
* dictionary controller builds trie only on first request(reuses same trie for subsequent requests)
  to search action and returns json containing whether word was found or not. 
* server run at port 4000
