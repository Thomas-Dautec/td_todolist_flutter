class Task {
  //Les attributs

  int id;
  String content;
  bool completed;
  DateTime? createdAt;

  //Constructor
/*
  Task(int id, String content, bool completed, DateTime createdAt) {
    this.id = id;
    this.content = content;
    this.completed = completed;
    this.createdAt = createdAt;
  }*/

  Task(this.id, this.content, this.completed, this.createdAt);

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(json['id'], json['title'], json['completed'], DateTime.now());
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': content,
        'completed': completed,
      };
}
