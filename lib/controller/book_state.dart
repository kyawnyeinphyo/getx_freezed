import 'package:freezed_annotation/freezed_annotation.dart';
import 'book.dart';

part 'book_state.freezed.dart';

@freezed
class BookState with _$BookState {
  const factory BookState.initial() = _Initial;
  const factory BookState.loading() = _Loading;
  const factory BookState.loaded(List<Book> book) = _Loaded;
  const factory BookState.error(String message) = _Error;
}
