class SavedURL {
  SavedURL({
    required this.url,
    required this.name,
    required this.expiry,
    required this.added,
    required this.size,
    required this.token,
  }) {
    format = name.split('.').last;
    sizeString =
        size < 2e10
            ? "${size}B"
            : size < 2e20
            ? "${size / 2e10}KB"
            : size < 2e30
            ? "${size / 2e20}MB"
            : "${size / 2e30}GB";
  }

  final String url;
  final String name;
  final DateTime expiry;
  final DateTime added;
  final String token;
  final int size;
  late final String format;
  late final String sizeString;
  late final String addedString;
}
