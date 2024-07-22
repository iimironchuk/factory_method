/*class Employee {
  late String name;
  late String position;
  late double salary;
  int? age;
  late String location;

  Employee();

  @override
  String toString() {
    String ageInfo = age != null ? "He's/She's $age." : "Age is not specified.";
    return '$name is $position. His/Her salary: $salary. $ageInfo Location: $location';
  }
}

abstract class IEmployeesBuilder {
  void setName(String name);
  void setPosition(String position);
  void setSalary(double salary);
  void setAge(int? age);
  void setLocation(String location);
  Employee build();
}

class EmployeeBuilder implements IEmployeesBuilder {
  Employee _employee = Employee();

  @override
  void setName(String name) {
    _employee.name = name;
  }

  @override
  void setPosition(String position) {
    _employee.position = position;
  }

  @override
  void setSalary(double salary) {
    _employee.salary = salary;
  }

  @override
  void setAge(int? age) {
    _employee.age = age;
  }

  @override
  void setLocation(String location) {
    _employee.location = location;
  }

  @override
  Employee build() {
    Employee builtEmployee = _employee;
    _employee = Employee();
    return builtEmployee;
  }
}

class EmployeeBuilderWithoutAge implements IEmployeesBuilder {
  Employee _employee = Employee();

  @override
  void setName(String name) {
    _employee.name = name;
  }

  @override
  void setPosition(String position) {
    _employee.position = position;
  }

  @override
  void setSalary(double salary) {
    _employee.salary = salary;
  }

  @override
  void setAge(int? age) { }

  @override
  void setLocation(String location) {
    _employee.location = location;
  }

  @override
  Employee build() {
    Employee builtEmployee = _employee;
    _employee = Employee();
    return builtEmployee;
  }
}

class Director {
  final IEmployeesBuilder builder;

  Director(this.builder);

  Employee createEmployeeInLviv({
    required String name,
    required String position,
    required double salary,
    int? age,
    required String location,
  }) {
    builder.setName(name);
    builder.setPosition(position);
    builder.setSalary(salary);
    builder.setAge(age);
    builder.setLocation(location);
    return builder.build();
  }

  Employee createEmployeeThatHideAge({
    required String name,
    required String position,
    required double salary,
    required String location,
  }) {
    builder.setName(name);
    builder.setPosition(position);
    builder.setSalary(salary);
    builder.setLocation(location);
    return builder.build();
  }
}

void main() {
  EmployeeBuilder normalBuilder = EmployeeBuilder();
  EmployeeBuilderWithoutAge builderWithoutAge = EmployeeBuilderWithoutAge();

  Director normalDirector = Director(normalBuilder);
  Director withoutAgeDirector = Director(builderWithoutAge);

  Employee employeeInLviv = normalDirector.createEmployeeInLviv(
    name: 'John',
    position: 'Developer',
    salary: 500,
    age: 22,
    location: 'Lviv',
  );
  print(employeeInLviv);

  Employee employeeWithoutAge = withoutAgeDirector.createEmployeeInLviv(
    name: 'Alice',
    position: 'Manager',
    salary: 600,
    location: 'Lviv',
  );
  print(employeeWithoutAge);

  Employee employeeThatHideAge = withoutAgeDirector.createEmployeeThatHideAge(
    name: 'Jane',
    position: 'Designer',
    salary: 400,
    location: 'Kyiv',
  );
  print(employeeThatHideAge);
}*/

class Employee {
  late String name;
  late String position;
  late double salary;
  int? age;
  late String location;

  Employee();

  @override
  String toString() {
    String ageInfo = age != null ? "He's/She's $age." : "Age is not specified.";
    return '$name is $position. His/Her salary: $salary. $ageInfo Location: $location';
  }
}

abstract class IEmployeesBuilder {
  void setName(String name);
  void setPosition(String position);
  void setSalary(double salary);
  void setAge(int? age);
  void setLocation(String location);
  Employee build();
}

class EmployeeBuilder implements IEmployeesBuilder {
  Employee _employee = Employee();

  @override
  void setName(String name) {
    _employee.name = name;
  }

  @override
  void setPosition(String position) {
    _employee.position = position;
  }

  @override
  void setSalary(double salary) {
    _employee.salary = salary;
  }

  @override
  void setAge(int? age) {
    _employee.age = age;
  }

  @override
  void setLocation(String location) {
    _employee.location = location;
  }

  @override
  Employee build() {
    Employee builtEmployee = _employee;
    _employee = Employee();
    return builtEmployee;
  }
}

class EmployeeBuilderWithoutAge implements IEmployeesBuilder {
  Employee _employee = Employee();

  @override
  void setName(String name) {
    _employee.name = name;
  }

  @override
  void setPosition(String position) {
    _employee.position = position;
  }

  @override
  void setSalary(double salary) {
    _employee.salary = salary;
  }

  @override
  void setAge(int? age) {}

  @override
  void setLocation(String location) {
    _employee.location = location;
  }

  @override
  Employee build() {
    Employee builtEmployee = _employee;
    _employee = Employee();
    return builtEmployee;
  }
}

class Director {
  final IEmployeesBuilder builder;

  Director(this.builder);

  Employee createEmployeeInLviv({
    required String name,
    required String position,
    required double salary,
    int? age,
    required String location,
  }) {
    builder.setName(name);
    builder.setPosition(position);
    builder.setSalary(salary);
    builder.setAge(age);
    builder.setLocation(location);
    return builder.build();
  }

  Employee createEmployeeThatHideAge({
    required String name,
    required String position,
    required double salary,
    required String location,
  }) {
    builder.setName(name);
    builder.setPosition(position);
    builder.setSalary(salary);
    builder.setLocation(location);
    return builder.build();
  }
}

void main() {
  EmployeeBuilder normalBuilder = EmployeeBuilder();
  EmployeeBuilderWithoutAge builderWithoutAge = EmployeeBuilderWithoutAge();

  Director normalDirector = Director(normalBuilder);
  Director withoutAgeDirector = Director(builderWithoutAge);

  Employee employeeInLviv = normalDirector.createEmployeeInLviv(
    name: 'John',
    position: 'Developer',
    salary: 500,
    age: 22,
    location: 'Lviv',
  );
  print(employeeInLviv);

  Employee employeeWithoutAge = withoutAgeDirector.createEmployeeInLviv(
    name: 'Alice',
    position: 'Manager',
    salary: 600,
    location: 'Lviv',
  );
  print(employeeWithoutAge);

  Employee employeeThatHideAge = withoutAgeDirector.createEmployeeThatHideAge(
    name: 'Jane',
    position: 'Designer',
    salary: 400,
    location: 'Kyiv',
  );
  print(employeeThatHideAge);
}

