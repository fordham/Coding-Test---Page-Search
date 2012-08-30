# class Page_DA is used to perform the data access functions for the Page class
class Page_DA
   FILE_PATH = "data/test_input_data.txt"
   @@my_pages = []    # class variable array containing list of page objects
   
   #method creates array of page objects retrieved from a text file
   def self.initialize_pages
    
     page_count = 0

     File.open(FILE_PATH, "r") do |my_file|
       puts 'PAGES INPUT:'
       my_file.each do |line|
         
         if line.downcase[0,1] == 'p'
           puts line
           #page record found , increment page count
           page_count += 1
           #strip first character from line and delimit to substrings, return array
           my_page_keywords_arr = line[1..-1].split
           # create new page and add to pages collection
           page_name = 'P' + page_count.to_s
           my_page = Page.new(page_name, my_page_keywords_arr)
           @@my_pages << my_page
         end      
       end
     end
      puts ''
      puts "Number of page records found = #{page_count}"
      puts "\n"
     
   end
  
  def self.get_all
    return @@my_pages
  end
end
