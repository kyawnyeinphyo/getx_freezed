class Book {
  final String id;
  final String name;
  final String author;

  const Book({
    required this.id,
    required this.name,
    required this.author,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      name: json['name'] as String,
      author: json['author'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'author': author,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          author == other.author;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ author.hashCode;

  @override
  String toString() {
    return 'Book{id: $id, name: $name, author: $author}';
  }

  Book copyWith({
    String? id,
    String? name,
    String? author,
  }) {
    return Book(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
    );
  }
}
