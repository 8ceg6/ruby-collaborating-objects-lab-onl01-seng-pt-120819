class Artist 
  attr_accessor :name, :songs  
  
  @@all= [] 
  
  
  def initialize(name)
      @name = name 
      @@all << self
      # @songs = []
  end 
  
  def self.all 
      @@all 
  end 
  
  def songs 
    Song.all.select {|song| song.artist == self} 
     
  end 
  
   
  
  def add_song(song) 
      self.songs << song 
      song.artist = self 
  end 
  
  def self.find_or_create_by_name(name)
        
        if self.find(name) 
            self.find(name) 
        else
          self.create(name)
        end
  end
  
  def self.find(name)
      self.all.find {|artist| name == artist.name} 
  end
   
  def self.create(name)
      new_artist = self.new(name)
      new_artist
  end
  
  def print_songs
      songs.each {|song| puts song.name}
  end 
end 



