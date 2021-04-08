class Program {
  class LinkedList {
    var value: Int
    var next: LinkedList?

    init(value: Int) {
      self.value = value
      next = nil
    }
  }

  static func shiftLinkedList(_ head: LinkedList, _ k: Int) -> LinkedList? {
		if k == 0 { 
			return head
		}
		
		var remainingMoves = k
		var currentNode: LinkedList? = head
		var previousNode: LinkedList? = nil
		var newHead: LinkedList? = head
    
		if k > 0 {
			// shift forwards
			while remainingMoves > 0 {
				// find the tail
				while currentNode?.next != nil {
					previousNode = currentNode
					currentNode = currentNode?.next
				}
				
				currentNode?.next = newHead
				previousNode?.next = nil
				newHead = currentNode
				
				remainingMoves -= 1
			}
			
			return currentNode
		}
		// shift backwards
		while remainingMoves < 0 {
			// find the tail
			while currentNode?.next != nil {
				currentNode = currentNode?.next
			}
				
			currentNode?.next = newHead
			let auxHead = newHead
			newHead = newHead?.next
			auxHead?.next = nil
				
			remainingMoves += 1
		}
			
		return newHead		
  }
}