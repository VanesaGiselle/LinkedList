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
    
    internal var head: Node<T>?
    internal var total: Int = 1
    
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
            return
        }
        
        while data != control?.data && control != nil {
            if control?.next?.data == data {
                previous = control
                previous?.next = previous?.next?.next
            }
            control = control?.next
        }
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
    
    func getLastNodeWithRecursivity(_ node: Node<T>?) -> Node<T>? {
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
    
    func getNodeAtPositionWithRecursivity(_ position: Int,_ node: Node<T>?) -> Node<T>? {
        if position == 0 {
            return node
        }
        
        if node == nil {
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
    
    func firstNodeWithRecursivity(_ condition: ((Node<T>?) -> Node<T>?), _ node: Node<T>?) -> Node<T>? {
        if condition(node) != nil {
            return node
        }
        
        if node == nil {
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
    
    func filterNodeWithRecursivity(_ condition: ((Node<T>?) -> Node<T>?), _ node: Node<T>?) -> [Node<T>?] {
        if node == nil {
            return []
        }
        
        return (condition(node) != nil ? [node] : []) + filterNodeWithRecursivity(condition, node?.next)
    }
    
    // Imprimir toda una linked list por pantalla (Con recursividad y sin recursividad)
    
    func printAllElementsWithoutRecursivity() {
        var node: Node? = head
        
        while node?.next != nil {
            print("\(String(describing: node?.data))")
            node = node?.next
        }
    }
    
    func printAllElementsRecursivity(_ node: Node<T>?) {
        if node == nil {
            return
        }
        print("\(String(describing: node?.data))")
        return printAllElementsRecursivity(node?.next)
    }

    // Imprimir el último elemento de una linked list. (con recursividad y sin recursividad)
    
    func printLastNodeWithoutRecursivity() {
        var nextNode: Node<T>?
        var last: T?
        
        while nextNode?.next != nil {
            last = head?.data
            nextNode = head?.next
        }
        print(String(describing: last))
    }
    
    func printLastNodeWithRecursivity(_ node: Node<T>?) {
        if node?.next == nil {
            print(String(describing: node?.data))
        }
        return printLastNodeWithRecursivity(node?.next)
    }
    
    // Imprimir primer elemento de una linked list.

    func printFirstNode() {
        print(String(describing: head?.data))
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
    
    func getAllElementsWithRecursivity(_ node: Node<T>?) -> [T?] {
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
