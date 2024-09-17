class Play {
  final String name;
  final int score;
  final int counter;

  Play({this.name = 'Maro', this.score = 20, this.counter = 0});

  String get myName => name;
  int get myScore => score;

  Play copyWith({String? name, int? score, int? counter}) => Play(
      name: name ?? this.name,
      score: score ?? this.score,
      counter: counter ?? this.counter);

  Play.empty() : this(name: '', score: 0, counter: 0);

  factory Play.fromJson(Map<String, dynamic> json) => Play(
      name: json['name'] ?? '',
      score: json['score'] ?? 0,
      counter: json['counter'] ?? 0);
}
