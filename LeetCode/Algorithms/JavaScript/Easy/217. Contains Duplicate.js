/*
  Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

  Example 1:
    Input: nums = [1,2,3,1]
    Output: true

  Example 2:
    Input: nums = [1,2,3,4]
    Output: false
  
  Example 3:
    Input: nums = [1,1,1,3,3,4,3,2,4,2]
    Output: true
 
  Constraints:
    1 <= nums.length <= 105
    -109 <= nums[i] <= 109

  @param {number[]} nums
  @return {boolean}
*/

// My first approach: One-pass Hash Table *
// Time Complexity: O(n)
// Space Complexity: O(n)

//Runtime: 120 ms, faster than 79.69% of JavaScript online submissions for Contains Duplicate.
//Memory Usage: 51.3 MB, less than 33.14% of JavaScript online submissions for Contains Duplicate.

var containsDuplicate = function (nums) {
  map = {}
  for (let i = 0; i < nums.length; i++) {
    if (map[nums[i]]) return true
    map[nums[i]] = true
  }

  return false
}

// My second approach: Adopted Set and removed search *
// Time Complexity: O(n)
// Space Complexity: O(n)

//Runtime: 84 ms, faster than 97.13% of JavaScript online submissions for Contains Duplicate.
//Memory Usage: 49.9 MB, less than 87.97% of JavaScript online submissions for Contains Duplicate.

var containsDuplicate = function (nums) {
  set = new Set()
  for (let i = 0; i < nums.length; i++) {
    if (set.add(nums[i]).size != i + 1) return true // When tryind to add if it already exists does not add, so size remains the same // Example 1: 1 2 3 3
  }

  return false
}
