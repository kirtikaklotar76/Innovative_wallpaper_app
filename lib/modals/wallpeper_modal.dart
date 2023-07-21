class Wallpepers {
  final String largeImageURL;

  Wallpepers({
    required this.largeImageURL,
  });

  factory Wallpepers.fromMap({required Map data}) {
    return Wallpepers(
      largeImageURL: data['largeImageURL'],
    );
  }
}
