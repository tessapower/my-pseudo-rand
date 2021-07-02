require 'digest'

# An example Pseudo random number generator (PRNG) based on the algorithm for a mixed Linear Congruential Generator:
# https://en.wikipedia.org/wiki/Linear_congruential_generator

class MyPseudoRand
  attr_accessor :seed

  # The modulus sets the upper bound of the range for the random number, i.e. 0 <= Random Number < Modulus
  MODULUS = 2**32
  # Arbitrary values that help create pseudo randomness
  MULTIPLIER = 42
  INCREMENT = 1027

  # Creates a new instance of a random number generator with an optional starting value (seed)
  #
  # @param [Optional, Integer] seed integer to use as the starting value
  def initialize(seed = nil)
    if seed == nil
      # If the seed isn't set, we take the current time in milliseconds and create a SHA2 hash from it
      @seed = (Digest::SHA2.hexdigest Time.now.to_s).to_i(16) % MODULUS
    else
      @seed = seed
    end
    @last = @seed
  end

  # Public: generates a pseudo random floating point number between 0 and 1
  #
  # @return [Float] the random number
  def rand
    n = (MULTIPLIER * @last + INCREMENT).modulo(MODULUS)
    @last = n
    return n.to_f / MODULUS.to_f
  end
end
