part of flutter_data;

/// A [Relationship] that models a to-many ownership.
///
/// Example: An author who has many books
/// ```
/// class Author with DataModel<Author> {
///  @override
///  final int id;
///  final String name;
///  final HasMany<Book> books;
///
///  Todo({this.id, this.name, this.books});
/// }
///```
class HasMany<E extends DataModel<E>> extends Relationship<E, Set<E>> {
  /// Creates a [HasMany] relationship, with an optional initial [Set<E>].
  ///
  /// Example:
  /// ```
  /// final book = Book(title: 'Harry Potter');
  /// final author = Author(id: 1, name: 'JK Rowling', books: HasMany({book}));
  /// ```
  ///
  /// See also: [IterableRelationshipExtension<E>.asHasMany]
  HasMany([Set<E>? models]) : super(models);

  HasMany._(Set<String>? keys) : super._(keys);

  HasMany.remove() : super._remove();

  /// For internal use with `json_serializable`.
  factory HasMany.fromJson(final Map<String, dynamic> map) {
    if (map['_'] == null) return HasMany._(null);
    return HasMany._({...map['_']});
  }

  /// Returns keys in this relationship.
  Set<String> get keys => _keys;

  /// Returns IDs in this relationship.
  Set<Object> get ids => _ids;

  // iterable utils

  Set<E> toSet() => _iterable.toSet();

  List<E> toList() => _iterable.toList();

  int get length => _iterable.length;

  E get first => _iterable.first;

  bool get isEmpty => _iterable.isEmpty;

  bool get isNotEmpty => _iterable.isNotEmpty;

  Iterable<E> where(bool Function(E) test) => _iterable.where(test);

  Iterable<T> map<T>(T Function(E) f) => _iterable.map(f);

  //

  /// Returns a [StateNotifier] which emits the latest [Set<E>] representing
  /// this [HasMany] relationship.
  @override
  DelayedStateNotifier<Set<E>> watch() {
    return _relationshipEventNotifier.map((e) => toSet());
  }

  @override
  String toString() => 'HasMany<$E>(${super.toString()})';
}

extension IterableRelationshipExtension<T extends DataModel<T>> on Set<T> {
  /// Converts a [Set<T>] into a [HasMany<T>].
  ///
  /// Equivalent to using the constructor as `HasMany(set)`.
  HasMany<T> get asHasMany => HasMany<T>(this);
}
