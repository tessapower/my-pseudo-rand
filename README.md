## Pseudo Random Number Generator

A pseudo random number generator based on the [Linear Congruential Generator](https://en.wikipedia.org/wiki/Linear_congruential_generator#Sample_code) algorithm.

The LCG is defined by the recurrence relation:

x_n+1 = (a*x_n + c) % m, where:

- { m | m > 0 } (modulus)
- { a | a < m } (multiplier)
- { c | 0 <= c < m } (increment)
- { x_0 | 0 <= x_0 < m } (seed/starting value)

