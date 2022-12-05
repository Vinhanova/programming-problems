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

// My first approach: Declarative way using one hashmap
// Time Complexity: O(r+m) r: ransomNote, m: magazine
// Space Complexity: O(m)

var canConstruct = function (ransomNote, magazine) {
  map = {}
  magazine.split('').map(magChar => (map[magChar] = map[magChar] + 1 || 1))
  // Other examples of assignment:
  //map[magChar] = (map[magChar] || 0) + 1
  //map[magChar] = ~~map[magChar] + 1 // "~~" turns falsey values to "0" or keeps the current value if there is one (sets truthy values that aren't ints to 1) @NateOsterfeld
  //map[magChar] ? map[magChar] += 1 : map[magChar] = 1
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

// My fourth approach: Testing other ways

var canConstruct = function (ransomNote, magazine) {
  map = {}

  for (i = 0; i < ransomNote.length; i++) {
    map[ransomNote[i]] = map[ransomNote[i]] + 1 || 1
  }

  for ([char, value] of Object.entries(map)) {
    match = magazine.match(new RegExp(`${char}`, 'gi'))
    if (match === null || match.length < value) {
      return false
    }
  }

  return true
}

// My fifth approach: Testing other ways*

// ( Two Hash Maps!* )

var canConstruct = function (ransomNote, magazine) {
  let rnMap = new Map()
  let mMap = new Map()

  for (let i = 0; i < ransomNote.length; i++) {
    if (rnMap.has(ransomNote[i])) rnMap.set(ransomNote[i], rnMap.get(ransomNote[i]) + 1)
    if (!rnMap.has(ransomNote[i])) rnMap.set(ransomNote[i], 1)
  }
  for (let i = 0; i < magazine.length; i++) {
    if (mMap.has(magazine[i])) mMap.set(magazine[i], mMap.get(magazine[i]) + 1)
    if (!mMap.has(magazine[i])) mMap.set(magazine[i], 1)
  }

  rnMap = Array.from(rnMap)

  for (let i = 0; i < rnMap.length; i++) {
    if (!mMap.has(rnMap[i][0]) || mMap.get(rnMap[i][0]) < rnMap[i][1]) return false
  }

  return true
}

// My sixth approach: Charcode // Submitted
// Time Complexity: O(rm) r: ransomNote, m: magazine
// Space Complexity: O(1) (max 26 lower case letters)

var canConstruct = function (ransomNote, magazine) {
  if (ransomNote.length > magazine.length) {
    return false
  }

  let freq = new Array(26).fill(0)

  for (let i = 0; i < magazine.length; i++) {
    freq[magazine.charCodeAt(i) - 97]++
  }
  for (let j = 0; j < ransomNote.length; j++) {
    freq[ransomNote.charCodeAt(j) - 97]--
  }

  for (let k = 0; k < freq.length; k++) {
    if (freq[k] < 0) {
      return false
    }
  }
  return true
}
