## Pseudo-Random Number Generator

This is a Pseudo-Random Number Generator (PRNG). This generator produces a sequence of pseudo-random numbers in
the range [0, 1)—between 0 and 1 (not including 1).

### Organised Chaos

The numbers generated are pseudo-random because the generator will produce the same sequence of numbers given the same
starting (seed) value. To a human, however, we are not able to reasonably predict the next number in the sequence, so
they appear to be random.

With this algorithm, and given any term of the sequence, we can always calculate the next term of the sequence.
Importantly, these properties mean that the PRNG is *deterministic*.

### Algorithm

There are many algorithms that can be used to generate a random number. A fairly simple one is the 
[Linear Congruential Generator](https://en.wikipedia.org/wiki/Linear_congruential_generator#Sample_code)
(LCG) algorithm, which this generator uses.

#### Definition

The LCG algorithm is defined by the recurrence relation:

<img alt="LCG Recurrence Relation" src="./assets/lcg-recurrence-relation.svg" height=30 />

where:

<img alt="Modulus" src="./assets/m.svg" height=30 /> — The "Modulus"<br>
<img alt="Multiplier" src="./assets/a.svg" height=30 /> — The "Multiplier"<br>
<img alt="Increment" src="./assets/c.svg" height=30 /> — The "Increment"<br>
<img alt="Seed or Starting Value" src="./assets/X_0.svg" height=30 /> — The "Seed"<br>

#### Modulus

The Modulus provides the upper bound of the random number generated, so the possible range is limited to any number
between 0 and the Modulus - 1. In this case, we use the Modulus to create a large range of numbers so that the next
number in the sequence is not (easily) predictable.

#### Multiplier and Increment

The Multiplier and Increment introduce "chaos" into the calculation that helps to make the output *appear* random to
mere mortals.

#### Seed

The Seed `X_0` replaces `X_n` in the recurrence relation equation to calculate the first number in the sequence, which
all following numbers extend from.

#### Chosen Values

The values of the Modulus, Multiplier, and Increment can be arbitrary. However, there are certain tried and tested
values which are more effective than the ones we can think of off the top of our heads. This generator uses:

| Source | Modulus (m) | Multiplier (a) | Increment (c) |
|:------:|:-----------:|:--------------:|:-------------:|
| [Numerical Recipes](http://numerical.recipes/) | `2^32` | `1664525` | `1013904223` |

If a seed isn't supplied, we convert a hash created from the current time into a number. Using an arbitrary hardcoded
value by default will mean the first value in the sequence is the same each time—using a value that constantly changes,
i.e. the current time, will appear more random.

Using the time alone, however, will mean that two objects instantiated around the same time will have similar seeds, and
the first number in their sequences will also appear similar. For this reason, we use a hash to ensure the seed is
completely different, given a small change in the value of the seed.