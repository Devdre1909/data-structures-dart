class LinkedList {
  Node head;

  LinkedList() {
    this.head = null;
  }

  /// Adds a new node of [data] depending on the [position] provided.
  ///
  /// Adding to the start of the list
  /// ```
  ///  list.insert(4, position: 'start');
  /// ```
  ///
  /// Adding to the end of the list
  /// ```
  ///  list.insert(4, position: 'end');
  ///  ```
  /// The above code is the same as
  /// ```
  ///  list.insert(4)
  /// ```
  void insert(data, {String position: "end"}) {
    if (position.toLowerCase() == "end") {
      this.addToEnd(data);
    } else if (position.toLowerCase() == "start") {
      this.addToStart(data);
    } else {
      print("Position can only be 'end' or  'start'");
      return;
    }
  }

  /// Adds a new node of [data] to the end of the List
  ///
  /// ```
  ///  list.push(3);
  /// ```
  void push(data) {
    this.addToEnd(data);
  }

  /// Removes and return the last Node on the list
  ///
  ///
  Node pop() {
    Node start = this.head;
    Node previous = null;
    while (start.next != null) {
      previous = start;
      start = start.next;
    }
    Node tempNode = start;
    previous.next = null;
    return tempNode;
  }

  /// Adds a new node of data [data] to the end of the list, same with `push()`
  void addToEnd(data) {
    Node start = this.head;
    Node tempNode = Node(data);
    if (start == null) {
      this.head = tempNode;
      return;
    }
    while (start.next != null) {
      start = start.next;
    }
    start.next = tempNode;
  }

  /// Adds a new node of data [data] to the beginning of the list, same with `insert()`
  void addToStart(data) {
    Node tempNode = Node(data);
    tempNode.next = this.head;
    this.head = tempNode;
  }

  @override
  String toString() {
    Node start = this.head;
    if (start == null) {
      return "List is empty";
    }
    String result = "";
    while (start != null) {
      result = result + start.data.toString() + " ";
      start = start.next;
      if (start != null) {
        result = result + "--> ";
      }
    }
    return result;
  }

  // Returns length of linked list
  num get length {
    Node start = this.head;
    num size = 0;
    while (start != null) {
      size++;
      start = start.next;
    }
    return size;
  }

  // Returns index of element given in the linked list
  // Returns -1 if not found
  num indexOf(data) {
    Node start = this.head;
    num position = 1;
    while (start != null) {
      if (start.data == data) {
        return position;
      } else {
        position++;
        start = start.next;
      }
    }
    return -1;
  }

  bool remove(data) {
    Node start = this.head;
    Node previous = null;

    if (start.data == data) {
      this.head = start.next;
      return true;
    }
    while (start != null && start.data != data) {
      previous = start;
      start = start.next;
    }
    if (start != null && start.data == data) {
      previous.next = start.next;
      return true;
    }
    return false;
  }

  num get max {
    Node start = this.head;
    num largest = start.data;
    while (start != null) {
      if (largest < start.data) {
        largest = start.data;
      }
      start = start.next;
    }
    return largest;
  }

  num get min {
    Node start = this.head;
    num smallest = start.data;
    while (start != null) {
      if (smallest > start.data) {
        smallest = start.data;
      }
      start = start.next;
    }
    return smallest;
  }

  List toList() {
    Node start = this.head;
    List tempList = [];
    while (start != null) {
      tempList.add(start.data);
      start = start.next;
    }
    return tempList;
  }

  void reverse() {
    Node start = this.head, tempNode, previousNode;
    while (start != null) {
      tempNode = start.next;
      start.next = previousNode;
      previousNode = start;
      start = tempNode;
    }
    this.head = previousNode;
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
  LinkedList list = new LinkedList();
  list.insert(10);
  list.insert(11);
  print(list);
  list.insert(9);
  list.insert(15, position: 'start');
  print(list);
  print(list.length);
  print(list.indexOf(10));
  list.remove(11);
  print(list);
  list.insert(3);
  print("Max ${list.max}");
  print("Min ${list.min}");
  print(list);
  print(list.toList());
  list.insert(21);
  print(list);
  list.reverse();
  list.pop();
  print(list);
  list.reverse();
  print(list);
}
