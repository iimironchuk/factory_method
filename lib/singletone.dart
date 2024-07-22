class Singleton{
  static final Singleton instance = Singleton._internal();

  Singleton._internal();

  factory Singleton(){
    return instance;
  }

  String data = 'Some data';

  void doSmthWithData(){
    print('This is my data: $data');
  }
}

void main(){
  Singleton singleton1 = Singleton();
  Singleton singleton2 = Singleton();

  singleton1.data = 'Change data';
  singleton2.doSmthWithData();

  print(singleton1==singleton2);
}