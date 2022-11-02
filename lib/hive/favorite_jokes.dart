import 'package:hive/hive.dart';

part 'favorite_jokes.g.dart';

@HiveType(typeId: 1)
class FavoriteJokes {
  @HiveField(0)
  final String value;
  @HiveField(1)
  final String id;

  FavoriteJokes({required this.value, required this.id});
}
