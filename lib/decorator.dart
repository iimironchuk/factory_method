abstract class Text{
  String getText();
}

class SimpleText implements Text{
  final String content;

  SimpleText(this.content);

  @override
  String getText(){
    return content;
  }
}

abstract class TextDecorator implements Text{
  final Text text;

  TextDecorator(this.text);

  @override
  String getText();
}

class ColorDecorator extends TextDecorator{
  final String color;

  ColorDecorator(super.text, this.color);

  @override
  String getText() {
    return '$color: ${text.getText()}';
  }
}

void main(){
  Text myText = SimpleText('Test text');
  print(myText.getText());

  Text colorText = ColorDecorator(myText, 'Green');
  print(colorText.getText());
}