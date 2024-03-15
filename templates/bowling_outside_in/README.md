
# Deliberate Practice for Ten-Pin Bowling Scoring Using Outside-In TDD

## Problem:

Write a program to score a game of Ten-Pin Bowling, which should include a class or module exposing a single public method:

```plaintext
int score(string game)
```

The input to this function should be a string describing a bowling game in a specific format, e.g., "X|7/|9-|X|-8|8/|-6|X|X|X||81", where symbols represent strikes, spares, misses, frame separators, and bonus balls.

## Deliberate Practice Approach:

### Understanding the Problem:
- Grasp the rules of Ten-Pin Bowling thoroughly, including how scores are calculated for strikes, spares, and open frames.

### Outside-In TDD Steps:
1. **Begin with the End in Mind**: Start by writing a high-level test for the expected outcome of the program based on a given input string. This test will initially fail but serves as a target for the development process.
2. **Define Interfaces and High-Level Behavior**: Identify and define the high-level behavior of your application, focusing on the input and expected output without delving into the details of how the score is calculated.
3. **Start with Integration Tests**: Write integration tests that describe how the system should behave, using examples of game strings and their expected scores. These tests will guide the development of the internal logic.
4. **Implement Inner Logic**: Break down the problem into smaller components (e.g., parsing the input string, calculating frame scores, handling special cases like strikes and spares) and implement these components one at a time, guided by the failing integration tests.
5. **Incrementally Build the Solution**: Continue to refine and add to your solution, using each passing test as a stepping stone to the next piece of functionality. Regularly refactor your code to keep it clean and maintainable.
6. **Refine and Expand**: With all tests passing, further refine your code for readability, maintainability, and performance. Expand your test cases to cover edge cases and ensure your solution robustly handles all valid input formats.

### Outside-In Specifics:
- This approach emphasizes starting with the desired outcomes and gradually implementing the internal logic required to achieve those outcomes.
- It fosters a better understanding of the system as a whole and encourages designing interfaces that are intuitive and easy to use.
- Particularly useful in scenarios where the system interacts with external components or when the final interface is crucial to the application's functionality.

# Source
https://kata-log.rocks/bowling-game-kata