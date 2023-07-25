class UserModel {
  final String id;
  final String username;
  final String avatarUrl;
  final bool isVerified;
  final bool isPrivate;
  final String tagline;
  final List<String> links;
  final List<String> followers;
  final List<String> following;

  UserModel({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.isVerified,
    required this.isPrivate,
    required this.tagline,
    required this.links,
    required this.followers,
    required this.following,
  });
}
