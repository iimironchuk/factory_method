import 'dart:math';

class ButtonType{
  final String buttonName;

  ButtonType({required this.buttonName});

  void draw(int x, int y,){
    print('Render $buttonName at ($x, $y)');
  }
}

class Button{
  final int x;
  final int y;
  final ButtonType type;

  Button(this.x, this.y, this.type,);

  void draw(){
    type.draw(x, y);
  }
}

class ButtonFactory{
  static final Map<String, ButtonType> _buttons = {};

  ButtonType getButtonByName(String name){
    if(!_buttons.containsKey(name)){
      _buttons[name] = ButtonType(buttonName: name);
      print('Creating new ButtonType with image: $name');
    }
    return _buttons[name]!;
  }
}

void main(){
  List<ButtonType> buttons = [];

  final factory = ButtonFactory();

  buttons.add(factory.getButtonByName('TextButton'));
  buttons.add(factory.getButtonByName('ElevatedButton'));
  buttons.add(factory.getButtonByName('IconButton'));

  Random random = Random();

  for(var button in buttons){
    button.draw(random.nextInt(100), random.nextInt(100));
  }
}
