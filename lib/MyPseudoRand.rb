require 'digest'

# An example Pseudo-Random Number Generator (PRNG) based on the algorithm for a mixed Linear Congruential Generator:
# https://en.wikipedia.org/wiki/Linear_congruential_generator
class MyPseudoRand
  attr_accessor :seed

  # The modulus sets the upper bound of the range for the random number, which means the random number can be
  # between 0 and the modulus - 1.
  MODULUS = 2**32
  # Arbitrary values that help create pseudo randomness taken from:
  # http://numerical.recipes/
  MULTIPLIER = 1664525
  INCREMENT = 1013904223

  # Creates a new instance of a random number generator.
  #
  # @param [Optional, Integer] seed Provide a starting value to create a reproducible sequence of pseudo-random numbers.
  #   A PRNG's number sequence is completely determined by the seed. Given a seed, the +.rand+ method will produce the
  #   same sequence of numbers. Get the current seed with the +.seed+ method.
  def initialize(seed = nil)
    if seed == nil
      # If the seed isn't set, we take the current time, create a hex hash from it, and convert that into an number.
      @seed = (Digest::SHA2.hexdigest Time.now.to_s).to_i(16) % MODULUS
    else
      @seed = seed
    end
    @last = @seed
  end

  # Public: generates a pseudo random floating point number between 0 and 1.
  #
  # @return [Float] A random number
  def rand
    n = (MULTIPLIER * @last + INCREMENT).modulo(MODULUS)
    @last = n
    n.to_f / MODULUS.to_f
  end
end
