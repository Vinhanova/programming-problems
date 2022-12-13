/* 
  Given a valid (IPv4) IP address, return a defanged version of that IP address.
  A defanged IP address replaces every period "." with "[.]".

  Example 1:
    Input: address = "1.1.1.1"
    Output: "1[.]1[.]1[.]1"

  Example 2:
    Input: address = "255.100.50.0"
    Output: "255[.]100[.]50[.]0"
 
  Constraints:
    The given address is a valid IPv4 address.

  @param {string} address
  @return {string}
*/

// My first approach: Replace
// Time Complexity: O(n)
// Space Complexity: O(1)

var defangIPaddr = function (address) {
  return address.replace(/\./g, '[.]')
}

// My second approach: Split & Join
// Time Complexity: O(n)
// Space Complexity: O(1)

var defangIPaddr = function (address) {
  return address.split('.').join('[.]')
}

// My third approach: ReplaceAll // Submitted
// Time Complexity: O(n)
// Space Complexity: O(1)

var defangIPaddr = function (address) {
  return address.replaceAll('.', '[.]')
}

// My fourth approach: For loop
// Time Complexity: O(n)
// Space Complexity: O(n)

var defangIPaddr = function (address) {
  let newAddress = ''

  for (let i = 0; i < address.length; i++) {
    newAddress += address[i] == '.' ? '[.]' : address[i]
  }

  return newAddress
}
