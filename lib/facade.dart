class ProductCatalog{
  void viewCatalog(){
    print('View the product catalog.');
  }

  bool isProductAvaliable(String product){
    print('Checking if $product is avaliable...');
    return true;
  }
}

class ProductCart{
  void addProductToTheCart(String product){
    print('$product added to the cart.');
  }
}

class PaymentService{
  void pay(){
    print('Payment was made succesfully.');
  }
}

class NotificationService{
  void notify(String product){
    print('Your order is $product. Wait for delivery!');
  }
}

class OrderManager{
  final ProductCatalog _productCatalog = ProductCatalog();
  final ProductCart _productCart = ProductCart();
  final PaymentService _payment = PaymentService();
  final NotificationService _notification = NotificationService();

  void makeAnOrder(String product){
    _productCatalog.viewCatalog();
    if(_productCatalog.isProductAvaliable(product)){
      _productCart.addProductToTheCart(product);
      _payment.pay();
      _notification.notify(product);
    }
    else{
      print('Sorry, we do not have $product in stock');
    }
  }
}

void main(){
  OrderManager order = OrderManager();

  order.makeAnOrder('laptop');
}


