class Memes {
  List<Meme> list;

  Memes({required this.list});

  Memes.fromJson(List<dynamic> json)
      : list = json.map((e) => Meme.fromJson(e)).toList();
}

class Meme {
  final String id;
  final String name;

  Meme(this.id, this.name);

  Meme.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
