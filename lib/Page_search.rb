
require 'lib/page'
require 'lib/query'
require 'lib/match'

$my_pages = Array.new   #new page object array
$my_queries = Array.new   #new query object array

FILE_PATH = "data/test_input_data.txt"
# load query and page keywords and return page and query objects
def load_input
  page_count = 0
  query_count = 0
  
  File.open(FILE_PATH, "r") do |my_file|
    puts 'INPUT:'
    my_file.each do |line|
      puts line
      if line.downcase[0,1] == 'p'
        #page record found , increment page count
        page_count += 1
        #strip first character from line and delimit to substrings, return array
        my_page_keywords_arr = line[1..-1].split
        # create new page and add to pages collection
        page_name = 'P' + page_count.to_s
        my_page = Page.new(page_name, my_page_keywords_arr)
        $my_pages << my_page
        
      elsif line.downcase[0,1] == 'q'
        #query record found, increment query count
        query_count +=1
        #strip first character from line and delimit to substrings, return array
        my_query_keywords_arr = line[1..-1].split
        # create new query and add to queries collection
        query_id = 'Q' + query_count.to_s
        my_query = Query.new(query_id, my_query_keywords_arr)
        $my_queries << my_query
        
      else
        puts 'ERROR: record type not recognised!'
      end
    end
    puts ''
    puts "Input data received successfully!"
    puts "\n"
  end

end

load_input
matches_found_arr = Array.new
# find page matches for each query and display
puts 'OUTPUT:'
$my_queries.each do |query|
  match_result_str = query.id + ':'
  matches_found_arr = Match.find_matches(query, $my_pages) #returns ordered list of matched pages array
  matches_found_arr.each do |page|
  match_result_str << ' ' + page.name
  end
  puts match_result_str
  match_result_str = ''
  
end
puts "\n"
puts 'end of output'






    
    

