require 'page_DA'

class Page
  
 MAX_NUM_KEYWORDS = 8
  
  def initialize(my_name, my_keywords)
    @name = my_name
    @keywords = my_keywords
    @rating = 0 
  end
  
  attr  :name, true
  attr :keywords, true
  attr :rating, true
  
  def to_s
    puts "I am Page "+ @name + ' Keywords: ' + @keywords.inspect + ' ' + 'Rating: ' + @rating.to_s
  end
  
  #input: query object 
  #result: instance variable "rating" is calculated and set 
  def calculate_rating(query)
    @rating = 0  #initialize page rating
    count = 0
    q_keyword_weight = 0
    p_keyword_weight = 0
    query.keywords.each do |q_keyword|
      q_keyword_weight = MAX_NUM_KEYWORDS - count
      count += 1
      @keywords.each do |p_keyword|
        if p_keyword.downcase == q_keyword.downcase
          p_keyword_weight = MAX_NUM_KEYWORDS - @keywords.index(p_keyword)
          @rating += (q_keyword_weight * p_keyword_weight )
        end
      end
    end
  end
  
  def self.initialize_pages
    Page_DA.initialize_pages
  end
  
  def self.get_all
    return pages = Page_DA.get_all
  end
end
  