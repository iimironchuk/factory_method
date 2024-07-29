abstract class FileSystemEntity{
  void description();
}

class File implements FileSystemEntity{
  final String name;

  File(this.name);

  @override
  void description() {
    print('File: $name');
  }
}

class Directory implements FileSystemEntity{
  final String name;
  final List<FileSystemEntity> _components = [];

  Directory(this.name);

  void add(FileSystemEntity component){
    _components.add(component);
  }

  void remove(FileSystemEntity component){
    _components.remove(component);
  }

  @override
  void description(){
    print('Directory: $name');
    for(FileSystemEntity component in _components){
      component.description();
    }
  }
}

class Client {
  final Directory root;

  Client(this.root);

  void printStructure() {
    root.description();
  }

  void addEntity(FileSystemEntity parent, FileSystemEntity entity) {
    if (parent is Directory) {
      parent.add(entity);
    } else {
      print('Cannot add entity to a file.');
    }
  }

  void removeEntity(FileSystemEntity parent, FileSystemEntity entity) {
    if (parent is Directory) {
      parent.remove(entity);
    } else {
      print('Cannot remove entity from a file.');
    }
  }
}


void main() {
  FileSystemEntity file1 = File('file1');
  FileSystemEntity file2 = File('file2');
  FileSystemEntity file3 = File('file3');

  Directory directory1 = Directory('directory1');
  Directory directory2 = Directory('directory2');
  Directory directory3 = Directory('directory3');

  Client client = Client(directory3);

  client.addEntity(directory1, file1);
  client.addEntity(directory1, file2);
  client.addEntity(directory2, file3);
  client.addEntity(directory3, directory1);
  client.addEntity(directory3, directory2);

  client.printStructure();
}
