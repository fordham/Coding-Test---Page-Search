$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'page'
require 'query'
require 'match'

# get page and query data
my_pages = Page.initialize_pages
my_queries = Query.initialize_queries

# find page matches for each query and display
matches_found_arr = Array.new
puts 'MATCHES OUTPUT:'
my_queries.each do |query|
  match_result_str = query.id + ':'
  matches_found_arr = Match.find_matches(query, my_pages) #returns ordered list of matched pages array
  matches_found_arr.each do |page|
  match_result_str << ' ' + page.name
  end
  puts match_result_str
  match_result_str = ''
  
end
puts "\n"
puts 'end of output'






    
    

