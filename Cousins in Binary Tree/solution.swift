
// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var xParent = TreeNode()
        var xDepth = depth(of: x, on: root, &xParent)
        
        var yParent = TreeNode()
        var yDepth = depth(of: y, on: root, &yParent)
        
        print("X Depth: \(xDepth) - Parent \(xParent.val)")
        print("Y Depth: \(yDepth) - Parent \(yParent.val)")
        
        guard xParent.val != 0, yParent.val != 0 else { return false }
        
        return xDepth == yDepth && xParent.val != yParent.val
    }
    
    func depth(of value: Int, on tree: TreeNode?, _ parent: inout TreeNode) -> Int {
        guard let currentNode = tree else { return -1}
        
        if currentNode.val == value { 
            return 1
        }
    
        var result = depth(of: value, on: currentNode.left, &parent)
        if result == -1 {
            // print("Searching on the right node")
            result = depth(of: value, on: currentNode.right, &parent)
        }
        
        if result == 1 {
            // print("Found \(value) with parent \(currentNode.val)")
            parent = currentNode
        }
        
        return result != -1 ? result + 1 : result
    }
}