$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'page'
require 'query'
require 'match'

# access data source and create and store page/query objects in arrays
Page.initialize_pages
Query.initialize_queries

# get all pages and queries
my_pages = Page.get_all
my_queries = Query.get_all

# Display all matches
Match.display_matches(my_queries, my_pages)








    
    

