abstract class MessageHandler {
  MessageHandler? nextHandler;

  void setNextHandler(MessageHandler nextHandler) {
    this.nextHandler = nextHandler;
  }

  void handleMessage({required String message, required String type}) {
    if (nextHandler != null) {
      nextHandler!.handleMessage(message: message, type: type);
    } else {
      print('Unknown type of message: $type');
    }
  }
}

class TextMessageHandler extends MessageHandler {
  @override
  void handleMessage({required String message, required String type}) {
    if (type == 'text') {
      print('Text message: $message');
    } else {
      super.handleMessage(message: message, type: type);
    }
  }
}

class ImageMessageHandler extends MessageHandler {
  @override
   void handleMessage({required String message, required String type}) {
    if (type == 'image') {
      print('Image message: $message');
    } else {
      super.handleMessage(message: message, type: type);
    }
  }
}

class VoiceMessageHandler extends MessageHandler {
  @override
   void handleMessage({required String message, required String type}) {
    if (type == 'voice') {
      print('Voice message: $message');
    } else {
      super.handleMessage(message: message, type: type);
    }
  }
}

void main(){
  MessageHandler textMessageHandler = TextMessageHandler();
  MessageHandler imageMessageHandler = ImageMessageHandler();
  MessageHandler voiceMessageHandler = VoiceMessageHandler();

  textMessageHandler.setNextHandler(imageMessageHandler);
  imageMessageHandler.setNextHandler(voiceMessageHandler);

  textMessageHandler.handleMessage(message: 'Some text', type: 'text');
  textMessageHandler.handleMessage(message: 'Some image', type: 'image');
  textMessageHandler.handleMessage(message: 'Some text', type: 'voice');
}
