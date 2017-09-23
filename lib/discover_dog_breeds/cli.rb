class DiscoverDogBreeds::CLI
  attr_accessor :count

  def initialize
    @count = 0
  end

  def call
    puts "*** Welcome to the discover dog breeds app. With this tool you can view names of dog breeds and read more information about a selected breed. ***"
    start
  end

  def start
    puts ""
    p choose_letter


  end

  def choose_letter
    letter = nil
    if @count > 0
      puts "You did not select a letter..."
    end

    puts "Select a letter between A to Z for a list of dogs."

    @count += 1
    input = gets.strip
    input.match(/^[a-zA-Z]{1}$/i) ? letter = input.upcase : choose_letter
    @count = 0
  end
end