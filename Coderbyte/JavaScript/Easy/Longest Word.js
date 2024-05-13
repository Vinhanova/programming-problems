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

function LongestWord(sen) {
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

  let currMax = 0,
    max = 0,
    currWord = '',
    word
  for (let i = 0; i < sen.length; i++) {
    if (/[a-zA-z0-9]/.test(sen[i])) {
      currMax++
      currWord += sen[i]
    } else {
      if (currMax > max) {
        max = currMax
        word = currWord
      }
      currMax = 0
      currWord = ''
    }
  }

  return currMax > max ? currWord : word
}

// keep this function call here
console.log(LongestWord(readline()))
