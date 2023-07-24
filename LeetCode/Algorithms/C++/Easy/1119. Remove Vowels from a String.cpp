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
*/

// My first approach: Brute Force
// Time Complexity: O(n)
// Space Complexity: O(n)


class Solution {
public:
    string removeVowels(string s) {
        std::string result = "";

        for(int i = 0; i < s.length(); i++) {
            switch (s[i]) {
                case 'a':
                case 'e':
                case 'i':
                case 'o':
                case 'u': break;
                default: result += s[i];
            }
        }

        return result;
    }
};