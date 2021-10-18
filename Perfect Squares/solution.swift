class Solution {
    func numSquares(_ n: Int) -> Int {
        var perfectSquares: [Int] = []
        var numbers: [Int: Int] = [0: 0]
        
        // calculate the perfect squares to N
        // initialize numbers dict
        for i in 1...n {
            let square = i * i
            perfectSquares.append(square)
            numbers[i] = Int.max - 1
        }
        
        for i in 1...n {
            for j in 0..<perfectSquares.count {
                let currentSquare = perfectSquares[j]
                if currentSquare <= i {
                    if let quantity = numbers[i], let remainderQuantity = numbers[i - currentSquare] {
                        numbers[i] = min(quantity, remainderQuantity + 1)
                    }
                }
            }
        }
        
        return numbers[n] ?? -1
    }
}

let solution = Solution()
print(solution.numSquares(12))
print(solution.numSquares(13))