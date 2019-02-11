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
    if !ratings.nil? && !sort_by.nil?
      return Movie.order(sort_by).where(rating: ratings.keys)
    elsif !ratings.nil? && sort_by.nil?
      return Movie.where(rating: ratings.keys)
    else
      return Movie.all
    end
  end
      
    
  
    
end
