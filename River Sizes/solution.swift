
class Program {
  func riverSizes(_ matrix: [[Int]]) -> [Int] {
    var rivers: [Int] = []
		var height = matrix.count
		var width = matrix.first?.count ?? 0
		var riverSize = 0
		
		var visited = Array(repeating: Array(repeating: false, count: width), count: height)
		var visitQueue: [(Int, Int)] = []
		
		print("Height: \(height)")
		print("Width: \(width)")
		
		for i in 0..<height {
			for j in 0..<width {
				if visited[i][j] {
					// adititional check to avoid adding to the queue
					continue
				}
				
				visitQueue.insert((i,j), at: 0)
				print("Starting a new queue")
				while !visitQueue.isEmpty {
					// remove the current node from the queue
					let indexes = visitQueue.remove(at: 0)
					let currentI = indexes.0
					let currentJ = indexes.1
					
					if visited[currentI][currentJ] {
						// if has already been visited, we should not visit again
						continue
					}
					
					let item = matrix[currentI][currentJ]
					print("Visiting: \(indexes)")
					
					// mark as visited
					visited[currentI][currentJ] = true
					
					if item == 1 {
						// increase the size of this river
						riverSize += 1
						
						if currentI < height - 1 {
							// append the down adjacent node to be visited
							print("Appending \(currentI + 1),\(currentJ) to queue")
							visitQueue.append((currentI + 1, currentJ))
						}
						if currentI > 0 {
							// append the up adjacent node to be visited
							print("Appending \(currentI - 1),\(currentJ) to queue")
							visitQueue.append((currentI - 1, currentJ))
						}
						if currentJ < width - 1 {
							// append the right adjacent node to be visited
							print("Appending \(currentI),\(currentJ + 1) to queue")
							visitQueue.append((currentI, currentJ + 1))
						}
						if currentJ > 0 {
							// append the left adjacent node to be visited
							print("Appending \(currentI),\(currentJ + 1) to queue")
							visitQueue.append((currentI, currentJ - 1))
						}
					}
				}
				if riverSize != 0 {
					// a river has ended
					rivers.append(riverSize)
					riverSize = 0
				}
			}
		}
		
		return rivers
  }
}