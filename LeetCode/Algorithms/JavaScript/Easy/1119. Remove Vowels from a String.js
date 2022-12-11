/*
  Given a string s, remove the vowels 'a', 'e', 'i', 'o', and 'u' from it, and return the new string.

  Example 1:
    Input: s = "leetcodeisacommunityforcoders"
    Output: "ltcdscmmntyfrcdrs"

  Example 2:
    Input: s = "aeiou"
    Output: ""
 
  Constraints:
    1 <= s.length <= 1000
    s consists of only lowercase English letters.
  
  @param {string} s
  @return {string}
*/

// My first approach: Regex
// Time Complexity: O(n)
// Space Complexity: O(1)

var removeVowels = function (s) {
  return s.match(/[^aeiou]/gi)?.join('') || ''
}

// My first approach: Replace // Submitted
// Time Complexity: O(n)
// Space Complexity: O(1)

var removeVowels = function (s) {
  return s.replace(/[aeiou]/g, '')
}
