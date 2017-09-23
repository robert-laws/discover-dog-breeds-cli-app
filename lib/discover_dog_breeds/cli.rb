require 'pry'

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

    if dog_list.count == 0
      puts "No dogs are listed under letter #{letter}. Please choose another letter."
      start
    else
      display_dog_list(letter, dog_list)

      puts ""
      dog_name = choose_dog(dog_list)
  
      dog_details = DiscoverDogBreeds::Scrape.new.get_dog_details_by_name(dog_name)
      
      if dog_details.count == 0
        puts "No details for the dog you choose. Please search for another dog breed"
        start
      else
        dog = DiscoverDogBreeds::Dog.create_new_from_details(dog_name, dog_details)
        display_dog_details(dog)
  
        puts ""
        answer = view_again?
        if answer == "yes"
          start
        else
          exit
        end
      end
    end
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

  def display_dog_details(dog)
    puts "------------ Details for #{dog.name} ------------"

    # display dog details
    puts "Name:                  #{dog.name}"
    puts "Personality:           #{dog.personality}"
    puts "Energy Level:          #{dog.energy}"
    puts "Good with Children:    #{dog.with_children}"
    puts "Good with other dogs:  #{dog.with_dogs}"
    puts "Shedding:              #{dog.shedding}"
    puts "Grooming:              #{dog.grooming}"
    puts "Trainability:          #{dog.trainability}"
    puts "Barking Level:         #{dog.barking}"
    puts ""
    puts "---------------- #{dog.name} Stats ---------------"
    puts "Height Male:           #{dog.height_male}"
    puts "Height Female:         #{dog.height_female}"
    puts "Weight Male:           #{dog.weight_male}"
    puts "Weight Female:         #{dog.weight_female}"
    puts "Life Expectancy:       #{dog.life}"
  end

  def view_again?
    answer = nil
    if @count > 0
      puts "You did not select either Y or N"
    end

    @count += 1
    puts "Do you want to search for another dog breed? Enter Y or N"
    input = gets.strip.downcase

    if input == "y"
      answer = "yes"
      @count = 0
    elsif input == "n"
      answer = "no"
      @count = 0
    else
      view_again?
    end

    answer
  end

  def exit
    puts "Thank you for using the Discover Dog Breed App"
    puts "Here are all the dog breeds you viewed during this session"
    puts ""

    dogs_viewed = DiscoverDogBreeds::Dog.all
    dogs_viewed.each_with_index do |dog, index|
      puts "#{index.to_i + 1}. #{dog.name}"
    end
  end
end