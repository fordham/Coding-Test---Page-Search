require 'query_DA'

class Query
  
  def initialize(my_query_id, my_query_keywords)
    @id = my_query_id
    @keywords = my_query_keywords
  end
  
  attr :id, true
  attr :keywords, true

  def self.initialize_queries
    return queries = Query_DA.initialize_queries
  end
end