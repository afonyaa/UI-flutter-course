class Joke {
  Joke({required this.id, required this.value});

  factory Joke.fromJson(Map<String, dynamic> json) =>
      Joke(id: json['id'], value: json['value']);

  final String id;
  final String value;

  Map<String, dynamic> toJson() => {'id': id, 'value': value};
}
