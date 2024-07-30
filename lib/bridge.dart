abstract class Notifier{
  void sendMessage(String message);
}

class EmailNotifier implements Notifier{
  @override
  void sendMessage(String message) {
    print("Sending Email with message: $message");
  }
}

class SmsNotifier implements Notifier{
  @override
  void sendMessage(String message) {
    print("Sending SMS with message: $message");
  }
}

abstract class Notification{
  final Notifier notifier;

  Notification(this.notifier);

  void notify(String message);
}

class InfoNotification extends Notification{
  InfoNotification(super.notifier);

  @override
  void notify(String message) {
    print('Some info message:');
    notifier.sendMessage(message);
  }
}

class ErrorNotification extends Notification{
  ErrorNotification(super.notifier);

  @override
  void notify(String message) {
    print('Some error message:');
    notifier.sendMessage(message);
  }
}

void main(){
  Notifier emailNotifier = EmailNotifier();

  Notification errorNotification = ErrorNotification(emailNotifier);
  errorNotification.notify('This is an error message');
}