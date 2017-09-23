class DiscoverDogBreeds::Dog
  attr_accessor :name, :personality, :energy, :with_children, :with_dogs, :shedding, :grooming, :trainability, :height_male, :height_female, :weight_male, :weight_female, :life, :barking

  def self.create_new_from_details(name, details)
    n = name.split("-").each { |w| w.capitalize! }.join(" ")
    p = details[0]
    e = details[1]
    wc = details[2]
    wd = details[3]
    s = details[4]
    g = details[5]
    t = details[6]
    hm = details[7].split(",").count == 2 ? details[7].split(",")[0] : details[7]
    hf = details[7].split(",").count == 2 ? details[7].split(",")[0] : details[7]
    wm = details[8].split(",").count == 2 ? details[8].split(",")[1] : details[8]
    wf = details[8].split(",").count == 2 ? details[8].split(",")[1] : details[8]
    l = details[9]
    b = details[10]
    self.new(n, p, e, wc, wd, s, g, t, hm, hf, wm, wf, l, b)
  end

  def initialize(name, personality = nil, energy = nil, with_children = nil, with_dogs = nil, shedding = nil, grooming = nil, trainability = nil, height_male = nil, height_female = nil, weight_male = nil, weight_female = nil, life = nil, barking = nil)
    @name = name
    @personality = personality
    @energy = energy
    @with_children = with_children
    @with_dogs = with_dogs
    @shedding = shedding
    @grooming = grooming
    @trainability = trainability
    @height_male = height_male
    @height_female = height_female
    @weight_male = weight_male
    @weight_female = weight_female
    @life = life
    @barking = barking
    @@all << self
  end

end