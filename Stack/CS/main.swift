import Foundation

struct Stack<T> {
    var stack: [T] = []
    
    // 초기화 시 아무 값이 주어지지 않을때 동작하는 초기화
    init() {}
    
    // 초기화 시 값이 주어질때 동작하는 초기화
    init(_ element: [T]) {
        stack = element
    }
    
    // 데이터 저장
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    // 데이터 추출함과 동시에 제거
    mutating func pop() -> T? {
        return stack.popLast()
    }
    
    // 데이터 추출만
    func peek() -> T? {
        return stack.last
    }
    
    // 스택이 비었는지 판별
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    // 스택의 갯수 카운트
    func count() -> Int? {
        return stack.count
    }
}

// 스택을 출력할때 커스텀한 설명을 추가하는 프로토콜
extension Stack: CustomStringConvertible {
    var description: String {
        return stack.description + "이 스택에 들어있습니다."
    }
}

// 스택 초기화 후 반복문 없이 배열로 스택을 넣을때 사용하는 프로토콜
extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        for element in elements {
            stack.append(element)
        }
    }
}

var firstStack: Stack = Stack<Int>()
var secondStack: Stack = Stack<Int>([1, 2, 3, 4])
var thirdStack: Stack = Stack<Int>()

firstStack = [2, 4, 6, 8]
thirdStack.push(10)
thirdStack.push(20)
print("\(firstStack)" + "\n" + "\(secondStack)" + "\n" + "\(thirdStack)")
