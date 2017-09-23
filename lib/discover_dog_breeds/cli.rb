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

    puts ""
    choice = choose_dog(dog_list)

    dog_details = DiscoverDogBreeds::Scrape.new.get_dog_details_by_name(choice)

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

  def choose_dog(list)
    dog_name_search = nil
    if @count > 0
      puts "You did not enter a number or type 'start'"
    end

    puts "Enter a number between 1 and #{list.count} to view a dog breeds details or type 'start' to choose a new letter"

    @count += 1
    input = gets.strip
    if input == "start"
      @count = 0
      start
    else
      input.match(/^([1-9]|[12][0-9])$/) && input.to_i < list.count + 1 ? dog_name_search = list[input.to_i - 1].downcase.split(" ").join("-") : choose_dog(list)
    end
    @count = 0
    dog_name_search
  end

  def display_dog_list(letter, list)
    puts "------------ Dog name begins with #{letter} ------------"
    list.each_with_index do |dog_name, index|
      puts "#{index.to_i + 1}. #{dog_name}"
    end
  end
end