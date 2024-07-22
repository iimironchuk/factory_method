abstract class Prototype<T>{
  T clone();
}

class Employee implements Prototype<Employee>{
  late String name;
  late String position;
  late double salary;
  late int age; 
  late String location;

  Employee({required this.name, required this.position, required this.salary, required this.age, required this.location});

  @override
  Employee clone() {
    return Employee(
      name: name, 
      position: position, 
      salary: salary, 
      age: age, 
      location: location);
  }

  @override
  String toString() {
    return '$name is $position. His/Her salary: $salary. Age: $age Location: $location';
  }
}

void main() {
  Employee originalEmployee = Employee(
    name: 'John',
    position: 'Developer',
    salary: 500,
    age: 30,
    location: 'Lviv',
  );

  Employee clonedEmployee = originalEmployee.clone();

  print(originalEmployee);
  print(clonedEmployee);

  clonedEmployee.name = 'Alice';
  clonedEmployee.position = 'designer';

  print(clonedEmployee);
}