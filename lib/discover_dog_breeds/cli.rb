class DiscoverDogBreeds::CLI

  def call
    puts "hello there"
  end

  DiscoverDogBreeds::Scrape.new.say_hello
end