# class Query_DA is used to perform the data access functions for the Query class
class Query_DA
  
  FILE_PATH = "data/test_input_data.txt"
  @@my_queries =[]    # class variable array containing list of query objects
  
  #method creates array of query objects retrieved from a text file
  def self.initialize_queries
    
    query_count = 0

    File.open(FILE_PATH, "r") do |my_file|
      puts 'QUERIES INPUT:'
      my_file.each do |line|
        
        if line.downcase[0,1] == 'q'
          puts line
          #query record found, increment query count
          query_count +=1
          #strip first character from line and delimit to substrings, return array
          my_query_keywords_arr = line[1..-1].split
          # create new query and add to queries collection
          query_id = 'Q' + query_count.to_s
          my_query = Query.new(query_id, my_query_keywords_arr)
          @@my_queries << my_query
        end      
      end
    end
    puts ''
    puts "Number of queries found = #{query_count}"
    puts "\n"
    
  end

  def self.get_all
    return @@my_queries
  end
end