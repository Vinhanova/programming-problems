/*
  There is a programming language with only four operations and one variable X:
    ++X and X++ increments the value of the variable X by 1.
    --X and X-- decrements the value of the variable X by 1.

  Initially, the value of X is 0.

  Given an array of strings operations containing a list of operations, return the final value of X after performing all the operations.

  Example 1:
    Input: operations = ["--X","X++","X++"]
    Output: 1
    Explanation: The operations are performed as follows:
    Initially, X = 0.
    --X: X is decremented by 1, X =  0 - 1 = -1.
    X++: X is incremented by 1, X = -1 + 1 =  0.
    X++: X is incremented by 1, X =  0 + 1 =  1.

  Example 2:
    Input: operations = ["++X","++X","X++"]
    Output: 3
    Explanation: The operations are performed as follows:
    Initially, X = 0.
    ++X: X is incremented by 1, X = 0 + 1 = 1.
    ++X: X is incremented by 1, X = 1 + 1 = 2.
    X++: X is incremented by 1, X = 2 + 1 = 3.

  Example 3:
    Input: operations = ["X++","++X","--X","X--"]
    Output: 0
    Explanation: The operations are performed as follows:
    Initially, X = 0.
    X++: X is incremented by 1, X = 0 + 1 = 1.
    ++X: X is incremented by 1, X = 1 + 1 = 2.
    --X: X is decremented by 1, X = 2 - 1 = 1.
    X--: X is decremented by 1, X = 1 - 1 = 0.
 
  Constraints:
    1 <= operations.length <= 100
    operations[i] will be either "++X", "X++", "--X", or "X--".

  @param {string[]} operations
  @return {number}
*/

// My first approach: Declarative way
// Time Complexity: O(n)
// Space Complexity: O(1)

var finalValueAfterOperations = function (operations) {
  let n = 0

  operations.map(op => (op[1] === '+' ? n++ : n--))

  return n
}

// My second approach: Imperative way // Submitted
// Time Complexity: O(n)
// Space Complexity: O(1)

var finalValueAfterOperations = function (operations) {
  let n = 0

  for (let i = 0; i < operations.length; i++) {
    //operations[i][1] === "+" ? n++ : n--
    if (operations[i][1] === '+') {
      n++
    } else {
      n--
    }
  }

  return n
}

// My third approach: Eval function
// Time Complexity: O(n)
// Space Complexity: O(1)

var finalValueAfterOperations = function (operations) {
  let X = 0

  for (let i = 0; i < operations.length; i++) {
    eval(operations[i])
  }

  return X
}

// My fourth approach: Reduce method
// Time Complexity: O(n)
// Space Complexity: O(1)

var finalValueAfterOperations = function (operations) {
  return operations.reduce((sum, op) => sum + (op[1] === '+' ? 1 : -1), 0)
}
