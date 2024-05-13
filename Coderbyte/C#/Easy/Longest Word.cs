/*
  Have the function LongestWord(sen) take the sen parameter being passed and return the longest word in the string.
  If there are two or more words that are the same length, return the first word from the string with that length.
  Ignore punctuation and assume sen will not be empty. Words may also contain numbers, for example "Hello world123 567"
  
  Examples
    Input: "fun&!! time"
    Output: time
    
    Input: "I love dogs"
    Output: love
*/

// Regex Test
// Time Complexity: O(n)
// Space Complexity: O(log n) ?

  
using System;
using System.Text.RegularExpressions;

class MainClass {

  public static string LongestWord(string sen) {

    /*
    criar currMax, max, currWord, word
    for
      verificar se é uma letra
        currMax++
        currWord += sen[i]
      else
        se bate recorde currMax > max
          max = currMax
          word = currWord
        reset currMax
        currWord = ''
    */

    int max = 0, currMax = 0;
    string word = "", currWord = "";

    for(int i = 0; i < sen.Length; i++) {
      // .Success for boolean value, otherwise it would be the string found
      if(Regex.Match(sen[i].ToString(), @"[a-zA-Z0-9]").Success) {
        currMax++;
        currWord += sen[i];
      } else {
        if(currMax > max) {
          max = currMax;
          word = currWord;
        }
        currMax = 0;
        currWord = "";
      }
    }
 
    return currMax > max ? currWord : word;

  }

  static void Main() {  

    // keep this function call here
    Console.WriteLine(LongestWord(Console.ReadLine()));
    
  } 

}