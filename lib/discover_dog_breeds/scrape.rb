class DiscoverDogBreeds::Scrape
  URL = "http://www.akc.org/dog-breeds"

  def get_dogs_by_letter(letter)
    result = get_html("?letter=#{letter}", "az_search")
    result.collect { |dog| dog.css('.scale-contents h2 a').text }[0..-2]
  end

  # Scrape#get_html returns an array of dog names by letter (with last element removed, which is a Nokogiri element node with no data)
  def get_html(arg, type)
    search = type == "az_search" ? "div.event-contain .event" : "div.breed-details__main li"
    Nokogiri::HTML(open("#{URL}/#{arg}")).css(search)
  end
end