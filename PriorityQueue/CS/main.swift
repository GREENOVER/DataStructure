import Foundation

struct Heap<T: Comparable> {
    var nodes: [T] = []
    let sort: (T,T) -> Bool
    
    init(sort: @escaping (T,T) -> Bool) {
        self.sort = sort
    }
    
    mutating func insert(_ element: T) {
        let count = nodes.count
        nodes.append(element)
        
        up(count - 1)
    }
    
    mutating func delete() -> T? {
        if nodes.isEmpty {
            return nil
        }
        if nodes.count == 1 {
            return nodes.removeFirst()
        }
        nodes.swapAt(0, nodes.count - 1)
        
        let result = nodes.removeLast()
        down(0)
        
        return result
    }
    
    mutating func remove(_ element: T) {
        if let index = nodes.firstIndex(of: element) {
            nodes.swapAt(index, nodes.count - 1)
            nodes.removeLast()
            up(index)
            down(index)
        }
    }
    
    mutating func removeAll(_ element: T) {
        var count = nodes.count
        remove(element)
        while nodes.count < count {
            remove(element)
            count = nodes.count
        }
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    mutating func clear() {
        nodes.removeAll()
    }
    
    mutating func down(_ index: Int) {
        var index = index
        let count = nodes.count
        while 2 * index + 1 < count {
            var i = 2 * index + 1
            if i < (count - 1) && sort(nodes[i], nodes[i + 1]) {
                i += 1
            }
            if !sort(nodes[index], nodes[i]) {
                break
            }
            nodes.swapAt(index, i)
            index = i
        }
    }
    
    mutating func up(_ index: Int) {
        var index = index
        while index > 0 && !sort(nodes[(index - 1)], nodes[index]) {
            nodes.swapAt((index - 1) / 2, index)
            index = (index - 1) / 2
        }
    }
}

var queue: Heap<Int> = Heap<Int>() {
    return $0 > $1
}
queue.insert(3)
queue.insert(5)
queue.insert(2)
queue.insert(1)
queue.insert(6)
queue.insert(7)
queue.insert(4)
queue.remove(4)
// nodes: [7, 5, 6, 1, 3, 2, 4]

