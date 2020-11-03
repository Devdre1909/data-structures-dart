class Queue {
  Node front, rear;

  Queue() {
    this.front = null;
    this.rear = null;
  }

  /// Return `true` if list is empty
  bool get isEmpty => this.front == null && this.rear == null;

  /// Add a new Node to the list
  enqueue(data) {
    Node tempNode = Node(data);
    if (this.rear == null) {
      this.front = this.rear = tempNode;
      return;
    }
    this.rear.next = tempNode;
    this.rear = tempNode;
  }

  /// Return and remove the last Node from the list
  Node dequeue() {
    if (this.front == null) {
      return null;
    }
    Node temp = this.front;
    this.front = this.front.next;
    if (this.front == null) {
      this.rear = null;
    }
    return temp;
  }

  /// Return a list representation of the Queue
  List toList() {
    if (this.front == null) {
      return [];
    }
    List tempList = [];
    Node start = this.front;
    while (start != null) {
      tempList.add(start.data);
      start = start.next;
    }
    return tempList;
  }

  @override
  String toString() {
    Node start = this.front;
    if (start == null) {
      return "Queue is empty";
    }
    String result = "";
    while (start != null) {
      result = result + start.data.toString() + " ";
      start = start.next;
      if (start != null) {
        result = result + "<-- ";
      }
    }
    return result;
  }
}

class Node {
  num _data;
  Node _next;

  Node(this._data) {
    this.next = null;
  }

  num get data => _data;
  Node get next => _next;

  set data(num data) {
    _data = data;
  }

  set next(Node next) {
    _next = next;
  }
}

main(List<String> args) {
  Queue queue = Queue();
  print(queue.isEmpty);
  print(queue.toList());
  queue.enqueue(10);
  queue.enqueue(23);
  print(queue.isEmpty);
  print(queue.front.data);
  print(queue);
  queue.enqueue(9);
  print(queue.rear.data);
  queue.dequeue();
  print(queue.front.data);
  print(queue);
  print(queue.toList());
}
