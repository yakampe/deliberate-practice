# Deliberate Practice for FizzBuzz Using the Strategy Pattern

## Problem:

The task is to write a program that prints the numbers from 1 to 100, but for multiples of 3, print "Fizz" instead of the number, and for multiples of 5, print "Buzz". For numbers which are multiples of both three and five, print "FizzBuzz".

## Deliberate Practice Approach:

### Understanding the Problem:
- Ensure a clear understanding of the FizzBuzz rules and the desired outcomes for different inputs.

### Strategy Pattern Application Steps:
1. **Define Strategy Interface**: Start by defining a strategy interface with a method that each specific strategy (Fizz, Buzz, FizzBuzz, Number) will implement. This method could be named something like `execute` or `getResult`, taking an integer as input and returning a string.
2. **Implement Strategies**: Create concrete classes implementing the strategy interface for each scenario:
    - A `FizzStrategy` for multiples of 3.
    - A `BuzzStrategy` for multiples of 5.
    - A `FizzBuzzStrategy` for multiples of both 3 and 5.
    - A `NumberStrategy` for numbers that do not meet the above conditions, simply returning the number itself.
3. **Context Configuration**: Implement a context class that accepts a strategy instance and uses it to determine the output for a given number. This class will select the appropriate strategy based on the input number.
4. **Integration**: Write a loop from 1 to 100, where for each number, the context class determines and applies the appropriate strategy to get the output (Fizz, Buzz, FizzBuzz, or the number itself).
5. **Refinement and Extension**: Refactor the strategies and context class as needed to ensure clarity, simplicity, and extensibility. Consider how new rules (e.g., a new word for a different multiple) could be easily added as new strategies.
