

List<Map<String, dynamic>> cartItems = [];
List<int> cart = [];

void addToCart({required Map<String, dynamic> data}) {
  // cartItems = [];
  bool isFound = false;
  if (cartItems.isNotEmpty) {
    for (int index = 0; index < cartItems.length; index++) {
      if (cartItems[index]['id'] == data['id']) {
        if (data['qty'] != 0) {
          cartItems[index] = data;
        } else {
          data['qty'] = 1;
          cartItems.removeAt(
              cartItems.indexWhere((element) => element['id'] == data['id']));
        }
        isFound = true;
      }
    }
    if (!isFound) {
      cartItems.add(data);
    }
  } else {
    cartItems.add(data);
  }
  // print(cartItems);
}
