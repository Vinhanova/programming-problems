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
*/


// Time Complexity: O(n)
// Space Complexity: O(1)

public class Solution {
    public void ReverseString(char[] s) {
      for(int i = 0; i < s.Length / 2; i++) {
        char aux = s[i];
        int opposite = s.Length - 1 - i;
        s[i] = s[opposite];
        s[opposite] = aux;
      }
    }
}


// Time Complexity: O(n)
// Space Complexity: O(1)

public class Solution {
    public void ReverseString(char[] s) {
      for(int l = 0, r = s.Length - 1; l<r; l++, r--) {
        char aux2 = s[l];
        s[l] = s[r];
        s[r] = aux2;
      }
    }
}