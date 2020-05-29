module Slugifiable

  module InstanceMethods 

    def slug
      self.name.downcase.split(" ").join("-")
    end 

  end 

  module ClassMethods

    def find_by_slug(slug)
      name = slug.split("-").map { |word| word.capitalize }.join(" ")
      self.find_by(name: name)
    end
    
  end
   
end 