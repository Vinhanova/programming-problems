/*
  Write a function that reverses a string. The input string is given as an array of characters s.
  You must do this by modifying the input array in-place with O(1) extra memory.

  Example 1:
    Input: s = ["h","e","l","l","o"]
    Output: ["o","l","l","e","h"]

  Example 2:
    Input: s = ["H","a","n","n","a","h"]
    Output: ["h","a","n","n","a","H"]
  
  Constraints:
    1 <= s.length <= 105
    s[i] is a printable ascii character.

  @param {character[]} s
  @return {void} Do not return anything, modify s in-place instead.
*/

// Time Complexity: O(n)
// Space Complexity: O(1)

var reverseString = function (s) {
  let aux

  for (let l = 0, r = s.length - 1; l < r; l++, r--) {
    aux = s[l]
    s[l] = s[r]
    s[r] = aux
  }
}
