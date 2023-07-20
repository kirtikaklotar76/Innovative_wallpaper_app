class Posts {
  final String title;
  final String body;
  final int id;
  final int userId;

  Posts({
    required this.body,
    required this.title,
    required this.id,
    required this.userId,
  });

  factory Posts.fromMap({required Map data}) {
    return Posts(
        body: data['body'],
        title: data['title'],
        id: data['id'],
        userId: data['userId']);
  }
}
