void main() {
  Counter obj1 = Counter.getInstance();
  Counter obj2 = Counter.getInstance();
  obj1.addOne();
  obj2.addOne();
  
  print('obj1 : ${obj1.count}');
  print('obj2 : ${obj2.count}');
  
  obj1.addOne();
  
  print('obj1 : ${obj1.count}');
  print('obj2 : ${obj2.count}');
}

class Counter {
  int count = 0;
  
  //create private object.
  static  Counter _instance = null;
  
  //private constructor.
  Counter._() {} 
  
  //create static method to return object.
  static Counter getInstance() {
    if(_instance == null) {
      _instance = new Counter._();
    }
    return _instance;
  }
  
  void addOne() {
    count++;
  }
}
