//
//  LinkedList.swift
//  LinkedList
//
//  Created by Vanesa Korbenfeld on 02/05/2023.
//

import Foundation

// Linked list o lista enlazada ->
// Cómo se implementa?
// Cuáles son las ventajas y desventajas?
// Crear objetos en swift como para poder implementarla.
// Todo lo siguiente con tests:
// Crear objetos para poder implementarlo con tests.

class LinkedList<T: Equatable> {
    class Node<T: Equatable>: Equatable {
        static func == (lhs: Node, rhs: Node) -> Bool {
            let sameNext = (lhs.next?.data == rhs.next?.data) || (lhs.next?.data == nil && rhs.next?.data == nil)
            return lhs.data == rhs.data && sameNext
        }
        
        var data: T
        var next: Node?
        
        init(data: T, next: Node?){
            self.data = data
            self.next = next
        }
    }
    private var console: Console?
    private(set) var head: Node<T>?
    internal var total: Int = 0
    
    init() {}
    
    init(console: Console) {
        self.console = console
    }
    
    func add(_ data: T) {
        if head == nil {
            head = Node(data: data, next: nil)
        } else {
            if let last = getLastNodeWithRecursivity(head) {
                last.next = Node(data: data, next: nil)
            }
        }
        total += 1
    }
    
    func delete(_ data: T) {
        var control = head
        var previous: Node<T>?
        
        if head?.data == data {
            head = head?.next
            total -= 1
            return
        }
        
        while data != control?.data && control != nil {
            if control?.next?.data == data {
                previous = control
                previous?.next = previous?.next?.next
            }
            control = control?.next
        }
        total -= 1
    }
    
    func getLastNodeWithoutRecursivity() -> Node<T>? {
        var last: Node<T>?
        var nextNode: Node? = head
        
        while nextNode != nil {
            last = nextNode
            nextNode = nextNode?.next
        }
        
        return last
    }
    
    func getLastNodeWithRecursivity(_ node: Node<T>? = nil) -> Node<T>? {
        let node = node ?? head
        if node?.next == nil {
            return node
        }
        
        return getLastNodeWithRecursivity(node?.next)
    }
    
    func getNodeAtPositionWithoutRecursivity(_ position: Int) -> Node<T>? {
        var nodeAtPosition: Node? = head
        var actualPosition: Int = 0
        
        while actualPosition != position {
            nodeAtPosition = nodeAtPosition?.next
            actualPosition += 1
        }
        
        return nodeAtPosition
    }
    
    func getNodeAtPositionWithRecursivity(_ position: Int,_ node: Node<T>? = nil) -> Node<T>? {
        let node = node ?? head

        if position == 0 {
            return node
        }
        
        if node?.next == nil {
            return nil
        }
        
        return getNodeAtPositionWithRecursivity(position - 1, node?.next)
    }
    
    //    Cómo buscar un elemento en una linked list (con recursividad y sin recursividad).
    
    func firstNodeWithoutRecursivity(_ condition: (Node<T>?) -> Node<T>?) -> Node<T>? {
        var node: Node? = head
        var nodeFound: Node<T>?

        while node != nil && nodeFound == nil {
            nodeFound = condition(node)
            node = node?.next
        }
        
        return nodeFound
    }
    
    func firstNodeWithRecursivity(_ condition: ((Node<T>?) -> Node<T>?), _ node: Node<T>? = nil) -> Node<T>? {
        let node = node ?? head
        if condition(node) != nil {
            return node
        }
        
        if node?.next == nil {
            return nil
        }
        
        return firstNodeWithRecursivity(condition, node?.next)
    }
    
    func filterNodeWithoutRecursivity(_ condition: (Node<T>?) -> Node<T>?) -> [Node<T>]? {
        var node: Node? = head
        var nodesFound: [Node<T>] = []

        while node != nil {
            guard let nodeUnwrapped = node else {
                return nodesFound
            }
            
            if let filterNode = condition(nodeUnwrapped) {
                nodesFound.append(filterNode)
            }
            
            node = node?.next
        }
        
        return nodesFound
    }
    
    func filterNodeWithRecursivity(_ condition: ((Node<T>?) -> Node<T>?), _ node: Node<T>? = nil) -> [Node<T>?] {
        let node = node ?? head

        if node?.next == nil && condition(node) != nil {
            return [node]
        }
        
        if node?.next == nil {
            return []
        }
        
        return (condition(node) != nil ? [node] : []) + filterNodeWithRecursivity(condition, node?.next)
    }
    
    func printAllElementsWithoutRecursivity() {
        var node: Node? = head
        
        while node != nil {
            guard let data = node?.data else {
                return
            }
            console?.print(String(describing: data))
            node = node?.next
        }
    }
    
    func printAllElementsWithRecursivity(_ node: Node<T>? = nil) {
        if total == 0 {
            console?.print("")
            return
        }
        
        let node = node ?? head
        
        guard let data = node?.data else {
            return
        }
        
        console?.print(String(describing: data))

        if node?.next == nil {
            return
        }

        return printAllElementsWithRecursivity(node?.next)
    }

    // Imprimir el último elemento de una linked list. (con recursividad y sin recursividad)
    
    func printLastNodeWithoutRecursivity() {
        var node: Node<T>? = head
        var last: T?
        
        while node != nil {
            last = node?.data
            node = node?.next
        }
        
        guard let last = last else {
            return
        }

        console?.print(String(describing: last))
    }
    
    func printLastNodeWithRecursivity(_ node: Node<T>? = nil) {
        let node = node ?? head
        
        if node?.next == nil {
            guard let data = node?.data else {
                return
            }
            
            console?.print(String(describing: data))
            return
        }
        return printLastNodeWithRecursivity(node?.next)
    }
    
    // Imprimir primer elemento de una linked list.

    func printFirstNode() {
        guard let data = head?.data else {
            return
        }
        console?.print(String(describing: data))
    }
    
    func getAllElementsWithoutRecursivity() -> [T] {
        var node: Node? = head
        var nodesToT: [T] = []
        
        while node != nil {
            guard let data = node?.data else { return [] }
            nodesToT.append(data)
            node = node?.next
        }
        
        return nodesToT
    }
    
    func getAllElementsWithRecursivity(_ node: Node<T>? = nil) -> [T?] {
        if total == 0 {
            return []
        }
        
        let node = node ?? head

        if node?.next == nil {
            return [node?.data]
        }

        return [node?.data] + getAllElementsWithRecursivity(node?.next)
    }
    
    // Imprimir primer elemento de una linked list.

    func getFirstNode() -> T? {
        return head?.data
    }
}
