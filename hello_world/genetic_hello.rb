require 'rubygems'
require 'ostruct'
require 'pp'
require 'pry'

MAX_ITERATIONS  = 16384
POPULATION_SIZE = 2048
ELITISM_RATE    = 0.10
MUTATION_RATE   = 0.25
GA_TARGET       = "Hello world!"

Struct.new "GAStruct", :str, :fitness

def init_population
  @population  = POPULATION_SIZE.times.map { Struct::GAStruct.new generate_random_word, 0 }
  @buffer      = []

  @population.each do |citizen|
  end
end

def generate_random_word
  (1..GA_TARGET.size).map { (rand(90) + 32).chr }.join
end

def calc_fitness
  @population.each do |citizen|
    citizen.fitness = citizen.str.chars.each_with_index.map do |char, index|
      (char.ord - GA_TARGET[index].ord).abs
    end.inject(:+)
  end
end

def print_best(best)
  puts "Best: #{ best.str } (#{ best.fitness })"
end

def mate
  elitism_size   = POPULATION_SIZE * ELITISM_RATE

  elitism elitism_size

  # Mate the rest
  @population[elitism_size..@population.size].each do
    new_citizen     = Struct::GAStruct.new "", 0
    splice_position = rand GA_TARGET.size
    mom             = @population[rand(POPULATION_SIZE)]
    dad             = @population[rand(POPULATION_SIZE)]

    new_citizen.str = mom.str[0..splice_position] + dad.str[(splice_position+1)..dad.str.size]
    puts "SIZE NOT EQUAL!! #{ new_citizen.str.size }" if new_citizen.str.size != GA_TARGET.size

    mutate new_citizen if rand < MUTATION_RATE

    @buffer << new_citizen
  end
end

def elitism(elitism_size)
  @buffer = @population.first elitism_size
end

def mutate(citizen)
  position = rand GA_TARGET.size
  delta    = rand(90) + 32

  citizen.str[position] = ((citizen.str[position].ord + delta) % 122).chr
end

# Main Program

init_population

(0..MAX_ITERATIONS).each do
  calc_fitness
  @population.sort_by! {|citizen| citizen.fitness }
  print_best @population.first

  break if @population.first.fitness == 0

  mate

  # Swap population and buffer
  @population, @buffer = @buffer, @population
end




