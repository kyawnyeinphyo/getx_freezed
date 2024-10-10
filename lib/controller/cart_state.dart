import 'package:freezed_annotation/freezed_annotation.dart';

import 'book.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<Book> books,
    @Default(0) int totalItems,
  }) = _CartState;

  const CartState._();

  CartState addBook(Book book) {
    return copyWith(
      books: [...books, book],
      totalItems: totalItems + 1,
    );
  }

  CartState removeBook(Book book) {
    return copyWith(
      books: books.where((b) => b != book).toList(),
      totalItems: totalItems - 1,
    );
  }

  CartState clearCart() {
    return copyWith(
      books: [],
      totalItems: 0,
    );
  }
}
