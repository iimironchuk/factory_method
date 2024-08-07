abstract class Device{
  void device();
}

class Laptop implements Device {
  @override
  void device() {
    print('This is a laptop!');
  }
}

class Smartphone implements Device{
  @override
  void device(){
    print('This is a Smartphone!');
  }
}

abstract class DeviceCreator {
  Device createDevice();

  void factoryDevice(){
    Device concreteDevice = createDevice();
    concreteDevice.device();
  }
}

class LaptopCreator extends DeviceCreator{
  @override
  Device createDevice() {
    return Laptop();
  }
}

class SmartphoneCreator extends DeviceCreator{
  @override
  Device createDevice() {
    return Smartphone();
  }
}

class DeviceFactory{
  DeviceCreator? selectFactory(String factoryType){
    if(factoryType == 'laptop'){
      return LaptopCreator();
    }
    if(factoryType == 'smartphone'){
      return SmartphoneCreator();
    }
    return null;
  }
}

void main(){
  /*DeviceCreator laptopCreator = LaptopCreator();
  laptopCreator.factoryDevice();

  DeviceCreator smartphoneCreator = SmartphoneCreator();
  smartphoneCreator.factoryDevice();*/

  DeviceFactory deviceFactory = DeviceFactory();
  DeviceCreator? deviceCreator = deviceFactory.selectFactory('laptop');

  deviceCreator?.factoryDevice();
}