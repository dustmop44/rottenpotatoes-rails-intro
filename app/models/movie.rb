class Movie < ActiveRecord::Base

  def self.ratings_present
    @list_of_ratings = []
    Movie.all.each do |movie|
      if @list_of_ratings.include? movie.rating
        next
      else
        @list_of_ratings << movie.rating
      end
    end
    return @list_of_ratings.sort
  end
  
  def self.filter_by_rating(ratings, sort_by)
    if ratings.nil?
      return Movie.order(sort_by).all
    else
      return Movie.order(sort_by).where(rating: ratings.keys)
    end
  end
      
    
  
    
end
