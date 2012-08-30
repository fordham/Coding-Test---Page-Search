$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'page'
require 'query'
require 'match'

# get all page and query data 
my_pages = Page.initialize_pages
my_queries = Query.initialize_queries
# Display all matches
Match.display_matches(my_queries, my_pages)








    
    

