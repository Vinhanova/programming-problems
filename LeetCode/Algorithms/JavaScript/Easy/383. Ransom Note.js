/* 
  Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.
  Each letter in magazine can only be used once in ransomNote.

  Example 1:
    Input: ransomNote = "a", magazine = "b"
    Output: false

  Example 2:
    Input: ransomNote = "aa", magazine = "ab"
    Output: false

  Example 3:
    Input: ransomNote = "aa", magazine = "aab"
    Output: true
 
  Constraints:
    1 <= ransomNote.length, magazine.length <= 105
    ransomNote and magazine consist of lowercase English letters.

  @param {string} ransomNote
  @param {string} magazine
  @return {boolean}
*/

// My first approach: Declarative way with hash map?*
// Time Complexity: O(rm)* r: ransomNote, m: magazine
// Space Complexity: O(m)

var canConstruct = function (ransomNote, magazine) {
  map = {}
  magazine.split('').map(magChar => (map[magChar] = (map[magChar] || 0) + 1))
  // OR
  //magazine.split('').map(magChar => (map[magChar] ? (map[magChar] += 1) : (map[magChar] = 1)))
  return ransomNote.split('').every(rnChar => map[rnChar]--)
}

// My second approach: Imperative way
// Time Complexity: O(rm) r: ransomNote, m: magazine
// Space Complexity: O(rm)

var canConstruct = function (ransomNote, magazine) {
  // TC O(r):
  for (i = 0; i < ransomNote.length; i++) {
    // TC O(m):
    index = magazine.indexOf(ransomNote[i])
    if (index === -1) {
      return false
    }
    // TC O(m) // SC O(m):
    magazine = magazine.substring(0, index) + magazine.substring(index + 1)
  }

  return true
}

// My third approach: Using regex for fun

var canConstruct = function (ransomNote, magazine) {
  for (i = 0; i < ransomNote.length; i++) {
    index = magazine.match(new RegExp(`${ransomNote[i]}`, 'i'))?.index
    if (index === undefined) {
      return false
    }
    magazine = magazine.substring(0, index) + magazine.substring(index + 1)
  }

  return true
}
