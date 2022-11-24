/*
  Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
  Return the running sum of nums.

  Example 1:
    Input: nums = [1,2,3,4]
    Output: [1,3,6,10]
    Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].

  Example 2:
    Input: nums = [1,1,1,1,1]
    Output: [1,2,3,4,5]
    Explanation: Running sum is obtained as follows: [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1].

  Example 3:
    Input: nums = [3,1,2,10,1]
    Output: [3,4,6,16,17]
 
  Constraints:
    1 <= nums.length <= 1000
    -10^6 <= nums[i] <= 10^6

  @param {number[]} nums
  @return {number[]}
*/

// My first approach: Creating an auxiliary array
// Time Complexity: O(n)
// Space Complexity: O(1) // O(n) but output space not usually counted

var runningSum = function (nums) {
  auxArr = []
  for (let i = 0; i < nums.length; i++) {
    auxArr.push(nums[i] + (i == 0 ? 0 : auxArr[i - 1]))
  }
  return auxArr
}

// My second approach: Removing the unnecessary if condition
// Time Complexity: O(n)
// Space Complexity: O(1) // O(n) but output space not usually counted

var runningSum = function (nums) {
  auxArr = [nums[0]]
  for (let i = 1; i < nums.length; i++) {
    auxArr[i] = auxArr[i - 1] + nums[i]
  }
  return auxArr
}

// My third approach: Using input array for output saving space (not recommended)
// Time Complexity: O(n)
// Space Complexity: O(1) // Truly O(1) now

var runningSum = function (nums) {
  for (let i = 1; i < nums.length; i++) {
    nums[i] += nums[i - 1]
  }
  return nums
}
