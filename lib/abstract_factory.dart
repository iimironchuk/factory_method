/*abstract class Device{
  void device();
}

class AcerLaptop implements Device {
  @override
  void device() {
    print('This is an acer laptop!');
  }
}

class AcerSmartphone implements Device{
  @override
  void device(){
    print('This is an acer Smartphone!');
  }
}

class AsusLaptop implements Device {
  @override
  void device() {
    print('This is an asus laptop!');
  }
}

class AsusSmartphone implements Device{
  @override
  void device(){
    print('This is an asus Smartphone!');
  }
}

abstract class DeviceFactory{
  Device createLaptop();
  Device createSmartphone();
}

class AcerFactory implements DeviceFactory{
  @override
  Device createLaptop() {
    return AcerLaptop();
  }

  @override
  Device createSmartphone() {
    return AcerSmartphone();
  }
}

class AsusFactory implements DeviceFactory{
  @override
  Device createLaptop() {
    return AsusLaptop();
  }

  @override
  Device createSmartphone() {
    return AsusSmartphone();
  }
}

void main(){
  DeviceFactory asusFactory = AsusFactory();
  Device asuslaptop = asusFactory.createLaptop();
  asuslaptop.device();
  Device asusSmartphone = asusFactory.createSmartphone();
  asusSmartphone.device();

  DeviceFactory acerFactory = AcerFactory();
   Device acerlaptop = acerFactory.createLaptop();
  acerlaptop.device();
  Device acerSmartphone = acerFactory.createSmartphone();
  acerSmartphone .device();
}*/



/*abstract class AcerDevice{
  void device();
}

class AcerLaptop implements AcerDevice{
  @override
  void device() {
    print('This is an acer laptop!');
  }
}

class AcerSmartphone implements AcerDevice{
  @override
  void device(){
    print('This is an acer smartphone!');
  }
}

abstract class AsusDevice{
  void device();
}

class AsusLaptop implements AsusDevice{
  @override
  void device() {
    print('This is an asus laptop!');
  }
}

class AsusSmartphone implements AsusDevice{
  @override
  void device(){
    print('This is an asus smartphone!');
  }
}

abstract class DeviceFactory{
  createLaptop();
  createSmartphone();
}

class AcerFactory implements DeviceFactory{
  @override
  createLaptop() {
    return AcerLaptop();
  }

  @override
  createSmartphone() {
    return AcerSmartphone();
  }
}

class AsusFactory implements DeviceFactory{
  @override
  createLaptop() {
    return AsusLaptop();
  }

  @override
  createSmartphone() {
    return AsusSmartphone();
  }
}

void main(){
  DeviceFactory asusFactory = AsusFactory();
  AsusDevice asuslaptop = asusFactory.createLaptop();
  asuslaptop.device();
  AsusDevice asusSmartphone = asusFactory.createSmartphone();
  asusSmartphone.device();

  DeviceFactory acerFactory = AcerFactory();
  AcerDevice acerlaptop = acerFactory.createLaptop();
  acerlaptop.device();
  AcerDevice acerSmartphone = acerFactory.createSmartphone();
  acerSmartphone .device();
}*/

abstract class Laptop{
  void laptop();
}

class AcerLaptop implements Laptop{
  @override
  void laptop() {
    print('This is an acer laptop!');
  }
}

class AsusLaptop implements Laptop{
  @override
  void laptop() {
    print('This is an asus laptop!');
  }
}

abstract class Smartphone{
  void smartphone();
}

class AcerSmartphone implements Smartphone{
  @override
  void smartphone() {
    print('This is an acer smartphone!');
  }
}

class AsusSmartphone implements Smartphone{
  @override
  void smartphone() {
    print('This is an asus smartphone!');
  }
}

abstract class DeviceFactory{
  Laptop createLaptop();
  Smartphone createSmartphone();
}

class AcerFactory implements DeviceFactory{
  @override
  Laptop createLaptop() {
    return AcerLaptop();
  }

  @override
  Smartphone createSmartphone() {
    return AcerSmartphone();
  }
}

class AsusFactory implements DeviceFactory{
  @override
  Laptop createLaptop() {
    return AsusLaptop();
  }

  @override
  Smartphone createSmartphone() {
    return AsusSmartphone();
  }
  
}

class CompanyFactory{
  DeviceFactory? getCompany(String company){
    if(company == 'acer'){
      return AcerFactory();
    }
    if(company == 'asus'){
      return AsusFactory();
    }
    return null;
  }
}

void main(){
  /*DeviceFactory acerFactory = AcerFactory();
  Laptop acerLaptop = acerFactory.createLaptop();
  Smartphone acerSmartphone = acerFactory.createSmartphone();
  acerLaptop.laptop();
  acerSmartphone.smartphone();

  DeviceFactory asusFactory = AsusFactory();
  Laptop asusLaptop = asusFactory.createLaptop();
  Smartphone asusSmartphone = asusFactory.createSmartphone();
  asusLaptop.laptop();
  asusSmartphone.smartphone();*/

  CompanyFactory companyFactory = CompanyFactory();
  DeviceFactory? acerFactory = companyFactory.getCompany('acer');

  Laptop acerLaptop = acerFactory!.createLaptop();
  Smartphone acerSmartphone = acerFactory.createSmartphone();
  acerLaptop.laptop();
  acerSmartphone.smartphone();
}