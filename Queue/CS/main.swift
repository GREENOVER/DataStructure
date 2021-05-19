import Foundation

struct Queue<T: Equatable> {
    // 큐에 들어올 데이터를 담은 enqueue & 리버스 시켜 데이터를 내보낼 dequeue
    var enqueue: [T] = []
    var dequeue: [T] = []
    
    // 아무값이 주어지지 않은 초기화 시 동작
    init() {}
    
    // 큐 인자로 엔큐 배열을 초기화
    init(_ queue: [T]) {
        enqueue = queue
    }
    
    // 데이터 추가 push 메서드를 통해 엔큐 배열에 추가
    mutating func push(_ element: T) {
        enqueue.append(element)
    }
    
    // 데이터 꺼낼때 엔큐를 거꾸로 하여 디큐로 지정해주고 엔큐를 삭제 후 디큐의 마지막 요소 추출
    mutating func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
    // 엔큐, 디큐 초기화
    mutating func remove() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
    
    // 비어있는지에 대한 연산프로퍼티 변수
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    // 첫번째 데이터값에 대한 연산프로퍼티 변수
    var firstIndex: T? {
        if dequeue.isEmpty {
            return enqueue.first
        } else {
            return dequeue.last
        }
    }
    
    // 마지막 데이터값에 대한 연산프로퍼티 변수
    var lastIndex: T? {
        if enqueue.isEmpty {
            return dequeue.first
        } else {
            return enqueue.last
        }
    }
    
    // 전체 큐에 대한 데이터 수 연산프로퍼티 변수
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    // 데이터가 포함되어 있는지 찾는 메서드
    // Equatable 프로토콜을 채택해주어야지 같은 값인지 판별할 수 있는 contains를 사용할 수 있음
    func contains(_ element: T) -> Bool {
        return enqueue.contains(element) || dequeue.contains(element)
    }
}

var firstQueue: Queue = Queue<Int>()
var secondQueue: Queue = Queue([1,2,3,4])

firstQueue.push(10)
firstQueue.push(20)
secondQueue.pop()

print("\(firstQueue)" + "\n" + "\(secondQueue)")
