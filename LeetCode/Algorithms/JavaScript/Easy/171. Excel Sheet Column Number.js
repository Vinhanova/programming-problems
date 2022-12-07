/*
  Given a string columnTitle that represents the column title as appears in an Excel sheet, return its corresponding column number.

  For example:
    A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28 
    ...
 
  Example 1:
    Input: columnTitle = "A"
    Output: 1

  Example 2:
    Input: columnTitle = "AB"
    Output: 28

  Example 3:
    Input: columnTitle = "ZY"
    Output: 701

  Constraints:
    1 <= columnTitle.length <= 7
    columnTitle consists only of uppercase English letters.
    columnTitle is in the range ["A", "FXSHRXW"].

  @param {string} columnTitle
  @return {number}
*/

// My first approach: Charcode (Left to Right)
// Time Complexity: O(n)
// Space Complexity: O(1)

var titleToNumber = function (columnTitle) {
  sum = charCode(columnTitle, 0)

  for (let i = 1; i < columnTitle.length; i++) {
    sum = sum * 26 + charCode(columnTitle, i)
  }

  return sum
}

const charCode = function (string, i) {
  return string.charCodeAt(i) - 64
}
