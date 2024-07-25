abstract class Image{
  void getImage();
}

class PngImage{
  void getPngImage(){
    print('You took a png image');
  }
}

class PngImageAdapter implements Image{
  final PngImage _pngImage;

  PngImageAdapter(this._pngImage);

  @override
  void getImage() {
    _pngImage.getPngImage();
  }
}

void main(){
  PngImage pngImage = PngImage();
  Image image = PngImageAdapter(pngImage);
  image.getImage();
}