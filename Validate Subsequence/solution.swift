/*
Given two non-empty arrays of integers, write a function that determines
whether the second array is a subsequence of the first one.

A subsequence of an array is a set of numbers that aren't necessarily adjacent
in the array but that are in the same order as they appear in the array. For
instance, the numbers [1, 3, 4] form a subsequence of the array [1, 2, 3, 4], and so do the numbers [2, 4].

Note that a single number in an array and the array itself are both valid subsequences of the array.

Sample Input
array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [1, 6, -1, 10] 

Sample Output
true
*/

class Program {
  static func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {
    var arrayIndex = 0
		var isValid = true
	
  	for (index, item) in sequence.enumerated() {
			for index in arrayIndex..<array.count {
				print("Checking if \(item) is equal to \(array[index])")
				if item == array[index] {
					print("true")
					arrayIndex = index + 1
					break
				} else if index == array.count - 1 {
					print("false - Broke Sequence")
					isValid = false
				}
				print("false")
			}
			if isValid == false {
				return false
			} 
			if index != sequence.count - 1 && arrayIndex == array.count {
				print("Sequence is larger than array, therefore not a subsequence.")
				return false
			}
		}
		return true
  }
}