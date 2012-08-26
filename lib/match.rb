class Match
  
  
  # defined as static method of class 
  # pre-condition: receives query and pages #
  # post-condition: returns array of top 5 pages matched to query, ordered from most to least relevant
  def Match.find_matches(my_query, my_pages)
    #TODO
    # set rating for each page
    top_five_pages = Array.new
    my_pages.each do |page|
      page.calculate_rating(my_query)
    end
    # sort pages array by rating attribute, most relevant to least
    my_pages.sort! {|a,b| b.rating <=> a.rating}
  
    #if several pages have same relevance, sort by increasing page number
    
    for pass_num in 1.. my_pages.length - 1
      for i in 0..my_pages.length - 1 - pass_num
        this_page = my_pages[i]
        next_page = my_pages[i+1]
        if (this_page.rating == next_page.rating) && (my_pages[i].name > my_pages[i+1].name) then
            #swap pages 
            temp = my_pages[i]
            my_pages[i] = my_pages[i+1]
            my_pages[i+1] = temp
            
        end
        
      end
    end
   
    #puts '** QUERY **  ' + my_query.inspect
    #puts '** PAGES ** ' + my_pages.inspect  
    
    for i in 0..4
      my_page = my_pages[i]
      if my_page.rating == 0 #exit
        break
      end
      top_five_pages << my_page
    end
    
    return top_five_pages  
  end
 
end