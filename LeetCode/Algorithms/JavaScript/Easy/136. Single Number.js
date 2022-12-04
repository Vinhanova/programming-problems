/*
  Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
  You must implement a solution with a linear runtime complexity and use only constant extra space.

 

Example 1:

Input: nums = [2,2,1]
Output: 1
Example 2:

Input: nums = [4,1,2,1,2]
Output: 4
Example 3:

Input: nums = [1]
Output: 1
 

Constraints:

1 <= nums.length <= 3 * 104
-3 * 104 <= nums[i] <= 3 * 104
Each element in the array appears twice except for one element which appears only once.
*/

// My first approach: Hashmap with declarative functions
// Time Complexity: O(n)
// Space Complexity: O(n)

var singleNumber = function (nums) {
  map = {}

  nums.map(num => (map[num] = map[num] + 1 || 1))

  for (const [num, value] of Object.entries(map)) {
    if (value === 1) return num
  }
}

// My second approach: Hashmap with imperative functions and map object
// Time Complexity: O(n^2)
// Space Complexity: O(n)

var singleNumber = function (nums) {
  if (nums.length < 2) return nums[0]

  map = new Map()

  for (let i = 0; i < nums.length; i++) {
    //map.set(nums[i], !map.get(nums[i]))
    // OR
    if (map.get(nums[i])) {
      map.set(nums[i], false)
    } else {
      map.set(nums[i], true)
    }
  }

  for ([num, value] of map) {
    if (value) return num
  }
}

// My third approach: Hashmap (storing only non duplicates)
// Time Complexity: O(n^2)
// Space Complexity: O(n)

var singleNumber = function (nums) {
  if (nums.length < 2) return nums[0]

  map = new Map()

  for (let i = 0; i < nums.length; i++) {
    if (map.get(nums[i])) {
      map.delete(nums[i])
    } else {
      map.set(nums[i], true)
    }
  }

  //return [...map][0][0]
  //return map.keys().next().value
  const [firstKey] = map.keys()
  return firstKey
}

// My fourth approach: Array
// Time Complexity: O(n^2)
// Space Complexity: O(n)

var singleNumber = function (nums) {
  if (nums.length < 2) return nums[0]

  arr = []

  for (let i = 0; i < nums.length; i++) {
    index = arr.indexOf(nums[i])
    if (index !== -1) {
      arr.splice(index, 1)
    } else {
      arr.push(nums[i])
    }
  }

  return arr[0]
}

// My fifth approach: Bitwise operator XOR // Submitted
// Time Complexity: O(n)
// Space Complexity: O(1)

var singleNumber = function (nums) {
  var res = nums[0]
  for (var i = 1; i < nums.length; i++) {
    res ^= nums[i]
  }
  return res
}

// My sixth approach: Math (2 * (a+b+c) − (a+a+b+b+c) = c)
// Time Complexity: O(n)
// Space Complexity: O(n)

var singleNumber = function (nums) {
  let totalSum = nums.reduce((a, b) => a + b, 0)
  let uniqueSum = 0
  let set = new Set(nums)

  set.forEach(a => (uniqueSum += a))

  return 2 * uniqueSum - totalSum
}
