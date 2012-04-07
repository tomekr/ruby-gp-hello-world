require 'rubygems'
require 'ostruct'
require 'pp'

MAX_ITERATIONS = 16384
POPULATION_SIZE = 2048
ELITISM_RATE = 0.10
MUTATION_RATE = 0.25
GA_TARGET = "Hello world!"

Struct.new "GAStruct", :str, :fitness

def init_population
  population  = []
  buffer      = []
  target_size = GA_TARGET.size

  (0..POPULATION_SIZE).each do
    citizen = Struct::GAStruct.new "", 0 

    (0..target_size).each { citizen.str << (rand(90) + 32).chr }
    population << citizen
  end

  return [population, buffer]
end

def calc_fitness(population)
  #TODO
end

def sort_by_fitness(population)
  #TODO
end

def print_best(population)
  #TODO
end

def mate(population, buffer)
  #TODO
end

def swap(population, buffer)
  #TODO
end

# Main Program

population, buffer = init_population
pp population

(0..MAX_ITERATIONS).each do
  calc_fitness    population
  sort_by_fitness population
  print_best      population

  break if population.first.fitness == 0

  mate population, buffer
  swap population, buffer
end




