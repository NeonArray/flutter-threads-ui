class ThreadModel {
  final String id;
  final String username;
  final String avatarUrl;
  final String content;
  final String time;
  final int replies;
  final int likes;
  final bool isVerified;

  const ThreadModel({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.content,
    required this.time,
    required this.replies,
    required this.likes,
    required this.isVerified,
  });
}
