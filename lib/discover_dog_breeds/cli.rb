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
    letter = choose_letter

    dog_list = DiscoverDogBreeds::Scrape.new.get_dog_list_by_letter(letter)
    display_dog_list(letter, dog_list)
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
    letter
  end

  def display_dog_list(letter, list)
    puts "------------ Dog name begins with #{letter} ------------"
    list.each_with_index do |dog_name, index|
      puts "#{index.to_i + 1}. #{dog_name}"
    end
  end
end