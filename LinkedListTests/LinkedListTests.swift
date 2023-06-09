//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Vanesa Korbenfeld on 02/05/2023.
//

import XCTest
@testable import LinkedList

class LinkedListTests: XCTestCase {
    
    func testDeleteNodeInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(2)
        linkedList.add(8)
        linkedList.delete(8)
        XCTAssertEqual(linkedList.getAllElementsWithoutRecursivity(), [2])
    }
    
    func testDeleteHeadInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(2)
        linkedList.add(8)
        linkedList.delete(2)
        XCTAssertEqual(linkedList.getAllElementsWithoutRecursivity(), [8])
    }
    
    func testDeleteNodeAtTheMiddleLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(2)
        linkedList.add(8)
        linkedList.add(4)
        linkedList.add(3)
        linkedList.add(9)
        linkedList.delete(4)
        XCTAssertEqual(linkedList.getAllElementsWithoutRecursivity(), [2, 8, 3, 9])
    }
    
    func testDeleteNonExistentNodeInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(2)
        linkedList.add(8)
        linkedList.delete(5)
        XCTAssertEqual(linkedList.getAllElementsWithoutRecursivity(), [2, 8])
    }
    
    func testAddHeadInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        XCTAssertEqual(linkedList.head, LinkedList.Node(data: 8, next: nil))
    }
    
    func testAddWithZeroData() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(0)
        XCTAssertEqual(linkedList.head, LinkedList.Node(data: 0, next: nil))
    }
    
    func testAddWithNegativeNumberData() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(-2)
        XCTAssertEqual(linkedList.head, LinkedList.Node(data: -2, next: nil))
    }
    
    func testHeadWithMoreNodesInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        XCTAssertEqual(linkedList.head?.data, 8)
    }
    
    func testAddHeadWithMoreNodesInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        XCTAssertEqual(linkedList.head?.data, 8)
    }
    
    func testGetLastNodeWithRecursivityInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.getLastNodeWithRecursivity()?.data, 4)
    }
    
    func testGetLastNodeWithRecursivityInEmptyLinkedList() throws {
        let linkedList = LinkedList<Int>()
        XCTAssertEqual(linkedList.getLastNodeWithRecursivity(), nil)
    }
    
    func testGetLastNodeWithoutRecursivityInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.getLastNodeWithoutRecursivity()?.data, 4)
    }
    
    func testGetLastNodeWithoutRecursivityInEmptyLinkedList() throws {
        let linkedList = LinkedList<Int>()
        XCTAssertEqual(linkedList.getLastNodeWithoutRecursivity(), nil)
    }
    
    func testGetNodeAtPositionWithoutRecursivityInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.getNodeAtPositionWithoutRecursivity(0)?.data, 8)
    }
    
    func testGetNodeAtLastPositionWithoutRecursivityInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.getNodeAtPositionWithoutRecursivity(2)?.data, 4)
    }
    
    func testGetNodeAtNonexistentPositionWithoutRecursivityInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.getNodeAtPositionWithoutRecursivity(4)?.data, nil)
    }
    
    func testGetNodeAtPositionWithRecursivityInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.getNodeAtPositionWithRecursivity(0)?.data, 8)
    }
    
    func testGetNodeAtLastPositionWithRecursivityInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.getNodeAtPositionWithRecursivity(2)?.data, 4)
    }
    
    func testGetNodeAtNonexistentPositionWithRecursivityInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.getNodeAtPositionWithRecursivity(4)?.data, nil)
    }
    
    func testFirstNodeWithoutRecursivity_ConditionDontFoundWithLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(7)
        XCTAssertEqual(linkedList.firstNodeWithoutRecursivity({ return $0?.data == 4 ? $0 : nil
        }), nil)
    }
    
    func testFirstNodeWithoutRecursivity_ConditionFoundInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.firstNodeWithoutRecursivity({ return $0?.data == 4 ? $0 : nil
        }), LinkedList.Node(data: 4, next: nil))
    }
    
    func testFirstNodeWithRecursivity_ConditionDontFoundInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(7)
        XCTAssertEqual(linkedList.firstNodeWithRecursivity({
            return $0?.data == 4 ? $0 : nil
        }), nil)
    }
    
    func testFirstNodeWithRecursivity_ConditionFoundAtTheMiddleOfLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(7)
        XCTAssertEqual(linkedList.firstNodeWithRecursivity({
            return $0?.data == 5 ? $0 : nil
        }), LinkedList.Node(data: 5, next: LinkedList.Node(data: 7, next: nil)))
    }
    
    func testFirstNodeWithRecursivity_ConditionFoundInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.firstNodeWithRecursivity({
            return $0?.data == 4 ? $0 : nil
        }), LinkedList.Node(data: 4, next: nil))
    }
    
    func testFirstNodeWithoutRecursivity_ConditionFoundAtTheMiddleOfLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(7)
        XCTAssertEqual(linkedList.firstNodeWithoutRecursivity({
            return $0?.data == 5 ? $0 : nil
        }), LinkedList.Node(data: 5, next: LinkedList.Node(data: 7, next: nil)))
    }
    
    func testFilterWithoutRecursivity_ConditionDontFoundWithLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(7)
        XCTAssertEqual(linkedList.filterNodeWithoutRecursivity({ return $0?.data == 4 ? $0 : nil
        }), [])
    }
    
    func testFilterWithoutRecursivity_ConditionFoundInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.filterNodeWithoutRecursivity({ return $0?.data == 4 ? $0 : nil
        }), [LinkedList.Node(data: 4, next: nil)])
    }
    
    func testFilterWithoutRecursivity_ConditionFoundMoreThanOneInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(4)
        linkedList.add(4)
        XCTAssertEqual(linkedList.filterNodeWithoutRecursivity({ return $0?.data == 4 ? $0 : nil
        }), [LinkedList.Node(data: 4, next: LinkedList.Node(data: 4, next: nil)), LinkedList.Node(data: 4, next: nil)])
    }
    
    func testFilterWithRecursivity_ConditionDontFoundWithLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(7)
        XCTAssertEqual(linkedList.filterNodeWithRecursivity({ return $0?.data == 4 ? $0 : nil
        }), [])
    }
    
    func testFilterWithRecursivity_ConditionFoundInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.filterNodeWithRecursivity({ return $0?.data == 4 ? $0 : nil
        }), [LinkedList.Node(data: 4, next: nil)])
    }
    
    func testFilterWithRecursivity_ConditionFoundMoreThanOneInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(4)
        linkedList.add(4)
        XCTAssertEqual(linkedList.filterNodeWithRecursivity({ return $0?.data == 4 ? $0 : nil
        }), [LinkedList.Node(data: 4, next: LinkedList.Node(data: 4, next: nil)), LinkedList.Node(data: 4, next: nil)])
    }
    func testGetAllElementsWithoutRecursivityInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.getAllElementsWithoutRecursivity(), [8, 5, 4])
    }
    
    func testGetAllElementsWithoutRecursivityInEmptyLinkedList() throws {
        let linkedList = LinkedList<Int>()
        XCTAssertEqual(linkedList.getAllElementsWithoutRecursivity(), [])
    }
    
    func testGetAllElementsWithRecursivityInLinkedList() throws {
        let linkedList = LinkedList<Int>()
        linkedList.add(8)
        linkedList.add(5)
        linkedList.add(4)
        XCTAssertEqual(linkedList.getAllElementsWithRecursivity(), [8, 5, 4])
    }
    
    func testGetAllElementsWithRecursivityInEmptyLinkedList() throws {
        let linkedList = LinkedList<Int>()
        XCTAssertEqual(linkedList.getAllElementsWithRecursivity(), [])
    }
    
    func testPrintAllElementsWithoutRecursivityInLinkedList() throws {
        let console = ConsoleViewer()
        let linkedList = LinkedList<Int>(console: console)
        linkedList.add(1)
        linkedList.add(2)
        linkedList.printAllElementsWithoutRecursivity()
        XCTAssertEqual(console.printed, ["1", "2"])
    }
    
    func testPrintAllElementsWithoutRecursivityInEmptyLinkedList() throws {
        let console = ConsoleViewer()
        let linkedList = LinkedList<Int>(console: console)
        linkedList.printAllElementsWithoutRecursivity()
        XCTAssertEqual(console.printed, [])
    }
    
    func testPrintLastNodeWithoutRecursivityInLinkedList() throws {
        let console = ConsoleViewer()
        let linkedList = LinkedList<Int>(console: console)
        linkedList.add(1)
        linkedList.add(2)
        linkedList.printLastNodeWithoutRecursivity()
        XCTAssertEqual(console.printed, ["2"])
    }
    
    func testPrintLastNodeWithoutRecursivityInEmptyLinkedList() throws {
        let console = ConsoleViewer()
        let linkedList = LinkedList<Int>(console: console)
        linkedList.printLastNodeWithoutRecursivity()
        XCTAssertEqual(console.printed, [])
    }
    
    func testPrintLastNodeWithRecursivityInLinkedList() throws {
        let console = ConsoleViewer()
        let linkedList = LinkedList<Int>(console: console)
        linkedList.add(1)
        linkedList.add(2)
        linkedList.printLastNodeWithRecursivity()
        XCTAssertEqual(console.printed, ["2"])
    }
    
    func testPrintLastNodeWithRecursivityInEmptyLinkedList() throws {
        let console = ConsoleViewer()
        let linkedList = LinkedList<Int>(console: console)
        linkedList.printLastNodeWithRecursivity()
        XCTAssertEqual(console.printed, [])
    }
    
    func testPrintFirstNodeWithRecursivityInLinkedList() throws {
        let console = ConsoleViewer()
        let linkedList = LinkedList<Int>(console: console)
        linkedList.add(1)
        linkedList.add(2)
        linkedList.printFirstNode()
        XCTAssertEqual(console.printed, ["1"])
    }
    
    func testPrintFirstNodeWithRecursivityInEmptyLinkedList() throws {
        let console = ConsoleViewer()
        let linkedList = LinkedList<Int>(console: console)
        linkedList.printFirstNode()
        XCTAssertEqual(console.printed, [])
    }
    
    func testPrintAllElementsWithRecursivityInLinkedList() throws {
        let console = ConsoleViewer()
        let linkedList = LinkedList<Int>(console: console)
        linkedList.add(1)
        linkedList.add(2)
        linkedList.printAllElementsWithRecursivity()
        XCTAssertEqual(console.printed, ["1", "2"])
    }
    
    func testPrintAllElementsWithRecursivityInEmptyLinkedList() throws {
        let console = ConsoleViewer()
        let linkedList = LinkedList<Int>(console: console)
        linkedList.printAllElementsWithRecursivity()
        XCTAssertEqual(console.printed, [""])
    }
    
    func testPrintAllElementsWithRecursivityWithMultipleNodesInLinkedList() throws {
        let console = ConsoleViewer()
        let linkedList = LinkedList<Int>(console: console)
        linkedList.add(1)
        linkedList.add(2)
        linkedList.add(3)
        linkedList.add(4)
        linkedList.add(5)
        linkedList.add(6)

        linkedList.printAllElementsWithRecursivity()
        XCTAssertEqual(console.printed, ["1", "2", "3", "4", "5", "6"])
    }
}
