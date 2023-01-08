"""
  Given an integer array nums, find a subarray that has the largest product, and return the product.
  The test cases are generated so that the answer will fit in a 32-bit integer.

  Example 1:
    Input: nums = [2,3,-2,4]
    Output: 6
    Explanation: [2,3] has the largest product 6.

  Example 2:
    Input: nums = [-2,0,-1]
    Output: 0
    Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
  
  Constraints:
    1 <= nums.length <= 2 * 104
    -10 <= nums[i] <= 10
    The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
"""

# My first approach: Brute force
# Time Complexity: O(n^2)
# Space Complexity: O(1)

class Solution:
  def maxProduct(self, nums: List[int]) -> int:
    if len(nums) == 0:
      return 0

    max_prodarray = nums[0]
      
    for i in range(len(nums)):
      current_prodarray = 1
      for j in range(i, len(nums)):
        current_prodarray *= nums[j]
        max_prodarray = max(max_prodarray, current_prodarray)
      
    return max_prodarray

# My second approach: Dynamic Programming
# Time Complexity: O(n)
# Space Complexity: O(1)

class Solution:
  def maxProduct(self, nums: List[int]) -> int:
    if len(nums) == 0:
      return 0

    max_so_far = nums[0]
    min_so_far = nums[0]
    result = max_so_far

    for i in range(1, len(nums)):
      curr_num = nums[i]
      temp_max = max(curr_num, max_so_far * curr_num, min_so_far * curr_num)
      min_so_far = min(curr_num, max_so_far * curr_num, min_so_far * curr_num)

      max_so_far = temp_max

      result = max(max_so_far, result)

    return result