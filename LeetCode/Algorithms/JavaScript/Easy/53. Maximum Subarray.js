/*
  Given an integer array nums, find the subarray which has the largest sum and return its sum.

  Example 1:
    Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
    Output: 6
    Explanation: [4,-1,2,1] has the largest sum = 6.

  Example 2:
    Input: nums = [1]
    Output: 1

  Example 3:
    Input: nums = [5,4,-1,7,8]
    Output: 23

  Constraints:
    1 <= nums.length <= 105
    -104 <= nums[i] <= 104

  Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

  @param {number[]} nums
  @return {number}
*/

// My first approach: Brute force
// Time Complexity: O(n^2)
// Space Complexity: O(1)

var maxSubArray = function (nums) {
  maxSum = Number.NEGATIVE_INFINITY

  nums.map((n, index) => {
    currSum = 0
    for (let i = index; i < nums.length; i++) {
      currSum += nums[i]
      maxSum = Math.max(maxSum, currSum)
    }
  })

  return maxSum
}

// My second approach: Dynamic Programming, Kadane's Algorithm
// Time Complexity: O(n)
// Space Complexity: O(1)

var maxSubArray = function (nums) {
  maxSum = currSum = nums[0]

  for (let i = 1; i < nums.length; i++) {
    currSum = Math.max(nums[i], currSum + nums[i])
    maxSum = Math.max(maxSum, currSum)
  }

  return maxSum
}
