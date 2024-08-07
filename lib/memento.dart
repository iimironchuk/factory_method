abstract class Memento{
  String getState();
}

class FileMemento implements Memento{
  final String state;

  FileMemento({required this.state});

  @override
  String getState() {
    return state;
  }
}

abstract class Originator{
  Memento createMemento();
  void restore(Memento memnto);
}

class File implements Originator{
  String content;

  File(this.content);

  @override
  Memento createMemento() {
    return FileMemento(state: content);
  }

  @override
  void restore(Memento memento) {
    content = memento.getState();
  }
}

class FileHistory{
  List<Memento> fileHistory = [];

  void saveState(Originator originator){
    fileHistory.add(originator.createMemento());
  }

  /*void restoreState(Originator originator){
    originator.restore(fileHistory[fileHistory.length - 2]);
  }*/

  void restoreState(Originator originator, int index){
    if(index >= 0 && index < fileHistory.length){
      originator.restore(fileHistory[index]);
    }
  }
}

void main(){
  File file = File('Version 1');
  print('Creating file: ${file.content}');

  FileHistory history = FileHistory();

  history.saveState(file);

  file.content = 'Version 2';
  print('Updating file to ${file.content}');

  history.saveState(file);

  file.content = 'Version 3';
  print('Updating file to ${file.content}');

  history.saveState(file);

  history.restoreState(file, 0);
  print('Restore previous version of file: ${file.content}');
}