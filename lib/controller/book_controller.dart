import 'package:get/get.dart';
import 'package:getx_freezed/controller/book.dart';
import 'package:getx_freezed/controller/book_state.dart';

class BookController extends GetxController {
  final Rx<BookState> _state = const BookState.initial().obs;
  BookState get state => _state.value;

  Future<void> fetchBook() async {
    _state.value = const BookState.loading();

    try {
      await Future.delayed(3.seconds);

      _state.value = BookState.loaded(
        List.generate(20, (index) => index)
            .map((e) => Book(
                  id: '$e',
                  name: 'Book $e',
                  author: 'Author $e',
                ))
            .toList(),
      );
    } catch (e) {
      _state.value = const BookState.error('Loading Failed!');
    }
  }
}
