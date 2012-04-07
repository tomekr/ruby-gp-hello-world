require 'rubygems'
require 'ostruct'

MAX_ITERATIONS = 16384
POPULATION_SIZE = 2048
ELITISM_RATE = 0.10
MUTATION_RATE = 0.25
GA_TARGET = "Hello world!"


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

pop_alpha, pop_beta = init_population

population = pop_alpha
buffer     = pop_beta

(0..MAX_ITERATIONS).each do
  calc_fitness    population
  sort_by_fitness population
  print_best      population

  break if population.first.fitness == 0

  mate population, buffer
  swap population, buffer
end




