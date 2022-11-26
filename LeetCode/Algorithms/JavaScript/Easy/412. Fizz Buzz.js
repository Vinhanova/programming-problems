/*
  Given an integer n, return a string array answer (1-indexed) where:
    answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
    answer[i] == "Fizz" if i is divisible by 3.
    answer[i] == "Buzz" if i is divisible by 5.
    answer[i] == i (as a string) if none of the above conditions are true.
  
  Example 1:
    Input: n = 3
    Output: ["1","2","Fizz"]
  
  Example 2:
    Input: n = 5
    Output: ["1","2","Fizz","4","Buzz"]
  
  Example 3:
    Input: n = 15
    Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]

  Constraints:
    1 <= n <= 104

  @param {number} n
  @return {string[]}
*/

// My first approach: Brute force
// Time Complexity: O(n)
// Space Complexity: O(1)

var fizzBuzz = function (n) {
  let resultArr = []
  for (let i = 1; i <= n; i++) {
    resultArr[i - 1] = i.toString()
    if (i % 3 === 0) resultArr[i - 1] = 'Fizz'
    if (i % 5 === 0) resultArr[i - 1] = 'Buzz'
    if (i % 3 == 0 && i % 5 == 0) resultArr[i - 1] = 'FizzBuzz'
  }

  return resultArr
}

// My second approach: Different brute force // Submitted
// Time Complexity: O(n)
// Space Complexity: O(1)

var fizzBuzz = function (n) {
  let resultArr = []

  for (let i = 1; i <= n; i++) {
    let aux = ''
    if (i % 3 === 0) aux += 'Fizz'
    if (i % 5 === 0) aux += 'Buzz'
    resultArr.push(aux ? aux : i.toString())
    // OR
    //resultArr[i - 1] = aux ? aux : i.toString()
    // OR
    //if (aux) resultArr[i - 1] = aux
    //else resultArr[i - 1] = i.toString()
  }

  return resultArr
}

// My third approach: Recursive for fun

var fizzBuzz = function (n) {
  if (n == 1) return ['1']

  if (n % 3 === 0 && n % 5 === 0) return [...fizzBuzz(n - 1), 'FizzBuzz']
  if (n % 3 === 0) return [...fizzBuzz(n - 1), 'Fizz']
  if (n % 5 === 0) return [...fizzBuzz(n - 1), 'Buzz']

  return [...fizzBuzz(n - 1), n.toString()]
}
