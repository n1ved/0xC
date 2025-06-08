class SavedURL {
  SavedURL({
    required this.url,
    required this.name,
    required this.expiry,
    required this.added,
    required this.size,
    required this.token,
  });

  final String url;
  final String name;
  final DateTime expiry;
  final DateTime added;
  final String token;
  final int size;
}
