abstract class Mediator{
  void notify(String message, Airplane airplane);
  void addAirplane(Airplane airplane);
}

abstract class Airplane{
  final String id;
  final Mediator mediator;

  Airplane({required this.id, required this.mediator});

  void send(String message);
  void recieve(String message);
}

class ConcreteAirplane extends Airplane{
  ConcreteAirplane({required super.id, required super.mediator});

  @override
  void recieve(String message) {
    print('$id Recieved message: $message');
  }

  @override
  void send(String message) {
    print('$id Sending message: $message');
    mediator.notify(message, this);
  }
}

class AirTrafficControll implements Mediator{
  List<Airplane> airplanes = [];

  @override
  void addAirplane(Airplane airplane) {
    airplanes.add(airplane);
  }

  @override
  void notify(String message, Airplane airplane) {
    for(var plane in airplanes){
      if(plane != airplane){
        plane.recieve(message);
      }
    }
  }
}

void main(){
  Mediator airTrafficControll = AirTrafficControll();

  Airplane airplaneA = ConcreteAirplane(id: '1', mediator: airTrafficControll);
  Airplane airplaneB = ConcreteAirplane(id: '2', mediator: airTrafficControll);
  Airplane airplaneC = ConcreteAirplane(id: '3', mediator: airTrafficControll);

  airTrafficControll.addAirplane(airplaneA);
  airTrafficControll.addAirplane(airplaneB);
  airTrafficControll.addAirplane(airplaneC);

  airplaneA.send('Requesting permission to land.');
  airplaneB.send('Cleared for takeoff.');
  airplaneC.send('Holding position on taxiway.');

}