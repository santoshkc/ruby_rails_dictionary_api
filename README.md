# Dictionary API
Exposes an api to check wheather given word in available in dictionary or not.Built using Ruby on Rails.

## Details realted to development.
* Used command `rails new <project_name_here> --api --skip-action-mailer --skip-active-storage --skip-active-record` to create new rails project.
* Skipped generation of specs, assets etc. in application.rb
* Installed gem rack-cors and added to gemfile
* Added cors related info to application.rb
* Added dictionary file(text file 2of12inf.txt) in app/assets/dictionary directory
  and used same to build trie datastructure
* Created dictionary controller and dictionary helper class. DictionaryHelper contains code to build 
  trie datastructure.
* Route mapping for /api/word to dictionary#search
* Dictionary controller builds trie only on first request(reuses same trie for subsequent requests)
  to search action and returns json containing whether word was found or not. 
* Server must run at port 4000 because front end uses hardcoded port of 4000

## Dependencies
* `ruby 2.7.1`
* `bundler 2.1.4`
* `Rails 6.0.3.2`

### Steps to run
1. Install dependencies using `yarn` and then `bundle install`
2. Run `rake test` to run test cases.
3. Run `rails server -p 4000` to start backend server(frontend uses hardcoded port 4000)