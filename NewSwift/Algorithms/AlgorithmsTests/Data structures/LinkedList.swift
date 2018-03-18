import Foundation

final class LinkedList<T> {
  
  final class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    init(value: T) {
      self.value = value
    }
  }
  
  typealias Node = LinkedListNode<T>
  var head: Node?
  
  var isEmpty: Bool {
    return head == nil
  }
  
  var first: Node? {
    return head
  }
  var last: Node? {
    guard var node = head else { return nil }
    
    while let next = node.next {
      node = next
    }
    return node
  }
  
  var count: Int {
    guard var node = head else { return 0 }
    
    var count = 1
    
    while let next = node.next {
      node = next
      count += 1
    }
    return count
  }
  
  func node(at index: Int) -> Node? {
    guard index >= 0 else { return nil }
    guard var node = head else { return nil }
    
    for _ in 0...index {
      if let next = node.next {
        node = next
      } else {
        return nil
      }
    }
    return node
  }
  
  func append(value: T) {
    append(node: LinkedListNode(value: value))
  }
  
  func append(node: Node) {
    if last != nil {
      last?.next = node
      node.previous = last
    } else {
      head = node
    }
  }
  
  func insert(node: Node, at index: Int) {
    guard index >= 0 else { return }
    
    if index == 0 {
      node.next = head
      head?.previous = node
      head = node
    } else {
      let prev = self.node(at: index-1)
      let next = prev?.next
      node.previous = prev
      node.next = next
      next?.previous = node
      prev?.next = node
    }
  }
  
  func removeAll() {
    head = nil
  }
  
  func removeLast() {
    
  }
  
  func remove(at index: Int) {
    if let node = self.node(at: index) {
      remove(node: node)
    }
  }
  
  func remove(node: Node) {
    let nodePrev = node.previous
    let nodeNext = node.next
    if let prev = nodePrev {
      nodePrev?.next = prev
    } else {
      head = nodeNext
    }
    nodeNext?.previous = nodePrev
    node.next = nil
    node.previous = nil
  }
}
