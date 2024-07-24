abstract class Prototype<T>{
  T clone();
}

class Employee implements Prototype<Employee>{
  final String? name;
  final String? position;
  final double? salary;
  final int? age; 
  final String? location;

  Employee({required this.name, required this.position, required this.salary, required this.age, required this.location});

  @override
  Employee clone({String? name, String? position, double? salary, int? age, String? location}) {
    return Employee(
      name: name ?? this.name, 
      position: position ?? this.position, 
      salary: salary ?? this.salary, 
      age: age ?? this.age, 
      location: location ?? this.location,
    );
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


  Employee clonedEmployee = originalEmployee.clone(name: 'Alice', position: 'Designer', salary: 500, age: 22, location: 'Kyiv');
  Employee clonedEmployee2 = originalEmployee.clone();

  print(originalEmployee);
  print(clonedEmployee);
  print(clonedEmployee2);

}