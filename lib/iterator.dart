class Book{
  final String id;
  final String title;
  final String genre;
  final int year;

  Book({required this.id, required this.title, required this.genre, required this.year});
}

abstract class BookIterator{
  bool hasNext();
  Book next();
}

abstract class BookCollection{
  BookIterator getAllBooks();
  BookIterator createGenreIterator(String genre);
  BookIterator createYearIterator(int year);
}

class BookLibrary implements BookCollection{
  final List<Book> books;

  BookLibrary(this.books);

  @override
  BookIterator createGenreIterator(String genre) {
    return GenreIterator(library: this, genre: genre);
  }

  @override
  BookIterator createYearIterator(int year) {
    return YearIterator(library: this, year: year);
  }

  @override
  BookIterator getAllBooks() {
    return AllBooksIterator(library: this);
  }
}

class AllBooksIterator implements BookIterator{
  final BookLibrary library;
  int currentPosition = 0;

  AllBooksIterator({required this.library});

  @override
  bool hasNext() {
    if(currentPosition < library.books.length){
      return true;
    }
    return false;
  }

  @override
  Book next() {
    if(hasNext()){
      return library.books[currentPosition++];
    }
    throw Exception('No more books');
  }
}

class GenreIterator implements BookIterator{
  final BookLibrary library;
  final String genre;
  int currentPosition = 0;
  List<Book>? genreBooks;

  GenreIterator({required this.library, required this.genre}){
    genreBooks = library.books.where((book) => book.genre == genre).toList();
  }

  @override
  bool hasNext() {
    if(currentPosition < genreBooks!.length){
      return true;
    }
    return false;
  }

  @override
  Book next() {
    if(hasNext()){
      return genreBooks![currentPosition++];
    }
    throw Exception('No more books');
  }
}

class YearIterator implements BookIterator{
  final BookLibrary library;
  final int year;
  int currentPosition = 0;
  List<Book>? yearBooks;

  YearIterator({required this.library, required this.year}){
    yearBooks = library.books.where((book) => book.year == year).toList();
  }

  @override
  bool hasNext() {
    if(currentPosition < yearBooks!.length){
      return true;
    }
    return false;
  }

  @override
  Book next() {
    if(hasNext()){
      return yearBooks![currentPosition++];
    }
    throw Exception('No more books');
  }
}

void main(){
  List<Book> books = [
    Book(id: '1', title: 'Book 1', genre: 'Horror', year: 2002),
    Book(id: '2', title: 'Book 2', genre: 'Horror', year: 2006),
    Book(id: '3', title: 'Book 3', genre: 'Fantasy', year: 2020),
    Book(id: '4', title: 'Book 4', genre: 'Drama', year: 2002),
    Book(id: '5', title: 'Book 5', genre: 'Detective', year: 2007),
    Book(id: '6', title: 'Book 6', genre: 'Drama', year: 2006),
  ];

  BookLibrary library = BookLibrary(books);

  BookIterator allBooks = library.getAllBooks();
  while(allBooks.hasNext()){
    Book book = allBooks.next();
    print('${book.title}: ${book.genre}, ${book.year}');
  }

  print('///////////////////////////////');

  BookIterator genreBooks = library.createGenreIterator('Drama');
  while(genreBooks.hasNext()){
    Book book = genreBooks.next();
    print('${book.title}: ${book.genre}, ${book.year}');
  }

  print('///////////////////////////////');

  BookIterator yearBooks = library.createYearIterator(2002);
  while(yearBooks.hasNext()){
    Book book = yearBooks.next();
    print('${book.title}: ${book.genre}, ${book.year}');
  }
}