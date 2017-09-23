require_relative './lib/discover_dog_breeds/version'

Gem::Specification.new do |s|
  s.name        = 'discover-dog-breeds'
  s.version     = DogBreeds::VERSION
  s.date        = '2017-09-23'
  s.summary     = "Discover Dog Breeds"
  s.description = "Find names of dog breeds and read detailed information about each breed."
  s.authors     = ["Robert Laws"]
  s.email       = 'roblaws@me.com'
  s.files       = ["lib/discover_dog_breeds.rb", "lib/discover_dog_breeds/cli.rb", "lib/discover_dog_breeds/scrape.rb", "lib/discover_dog_breeds/dog.rb", "config/environment.rb"]
  s.homepage    = 'http://rubygems.org/gems/discover-dog-breeds'
  s.license     = 'MIT'
  s.executables << 'discover-dog-breeds'

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end