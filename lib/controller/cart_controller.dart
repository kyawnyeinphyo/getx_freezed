import 'package:get/get.dart';
import 'package:getx_freezed/controller/book.dart';
import 'package:getx_freezed/controller/cart_state.dart';

class CartController extends GetxController {
  final Rx<CartState> _state = const CartState(
    books: [],
    totalItems: 0,
  ).obs;
  CartState get state => _state.value;

  void addToCart(Book book) {
    _state.value = state.addBook(book);
  }

  void removeFromCart(Book book) {
    _state.value = state.removeBook(book);
  }

  void clearCart() {
    _state.value = state.clearCart();
  }
}
