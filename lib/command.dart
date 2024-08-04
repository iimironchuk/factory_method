abstract class Command{
  void execute();
}

class Light{
  void lightOn(){
    print('Light is ON!');
  }

  void lightOff(){
    print('Light is OFF!');
  }
}

class LightOnCommand implements Command{
  final Light light;

  LightOnCommand({required this.light});

  @override
  void execute() {
    light.lightOn();
  }
}

class LightOffCommand implements Command{
  final Light light;

  LightOffCommand({required this.light});

  @override
  void execute() {
    light.lightOff();
  }
}

class RemoteControll{
  Command turnOnCommand;
  Command turnOffCommand;

  RemoteControll(this.turnOnCommand, this.turnOffCommand);

  void turnOn(){
    turnOnCommand.execute();
  }

  void turnOff(){
    turnOffCommand.execute();
  }
}

void main(){
  Light light = Light();

  Command turnOnCommand = LightOnCommand(light: light);
  Command turnOffCommand = LightOffCommand(light: light);

  RemoteControll remote = RemoteControll(turnOnCommand, turnOffCommand);

  remote.turnOn();
  remote.turnOff();
}