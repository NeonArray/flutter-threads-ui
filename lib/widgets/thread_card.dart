import 'package:flutter/material.dart';
import 'package:threads/models/thread.dart';

class ThreadCard extends StatelessWidget {
  const ThreadCard({super.key, required this.thread});

  final ThreadModel thread;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            AvatarsColumn(
              avatarUrl: thread.avatarUrl,
              replyCount: thread.replies,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Username(
                          username: thread.username,
                          isVerified: thread.isVerified),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _TimeAgo(
                            timestamp: thread.time,
                          ),
                          const SizedBox(width: 8),
                          const _ContextMenu(),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: [
                      Text(
                        thread.content,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const _Actions(),
                  const SizedBox(height: 20),
                  ReplyMeta(thread: thread),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarsColumn extends StatelessWidget {
  const AvatarsColumn(
      {super.key, required this.avatarUrl, required this.replyCount});

  final String avatarUrl;
  final int replyCount;

  @override
  Widget build(BuildContext context) {
    Widget bubs = const SizedBox();
    if (replyCount > 1 && replyCount < 3) {
      bubs = const TwoReplyAvatar(avatarUrls: [
        "https://i.pravatar.cc/300",
        "https://i.pravatar.cc/300"
      ]);
    } else if (replyCount >= 3) {
      bubs = const _MultiReplyAvatar();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(height: 10),
          replyCount > 0
              ? Expanded(
                  child: VerticalDivider(
                    color: Theme.of(context).colorScheme.onTertiary,
                    thickness: 1,
                    width: 1,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          bubs,
        ],
      ),
    );
  }
}

class _TimeAgo extends StatelessWidget {
  const _TimeAgo({required this.timestamp});

  final String timestamp;

  String _calculateTimeAgo() {
    var now = DateTime.now();
    var difference = now.difference(DateTime.parse(timestamp));
    if (difference.inDays > 365) {
      return "${(difference.inDays / 365).floor()}y";
    } else if (difference.inDays > 30) {
      return "${(difference.inDays / 30).floor()}m";
    } else if (difference.inDays > 7) {
      return "${(difference.inDays / 7).floor()}w";
    } else if (difference.inDays > 0) {
      return "${difference.inDays}d";
    } else if (difference.inHours > 0) {
      return "${difference.inHours}h";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes}m";
    } else {
      return "now";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _calculateTimeAgo(),
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}

class ReplyMeta extends StatelessWidget {
  final ThreadModel thread;

  const ReplyMeta({super.key, required this.thread});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Row(
        children: [
          thread.replies > 0
              ? Text(
                  "${thread.replies} replies",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              : const SizedBox(),
          thread.replies > 0
              ? Text(
                  "-",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              : const SizedBox(),
          Text(
            "View likes",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class Username extends StatelessWidget {
  const Username({super.key, required this.username, required this.isVerified});

  final String username;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          username,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(width: 5),
        isVerified
            ? const Icon(
                Icons.verified,
                color: Colors.blue,
                size: 15,
              )
            : const SizedBox(),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.favorite_border),
        SizedBox(width: 20),
        Icon(Icons.chat_bubble_outline),
        SizedBox(width: 20),
        Icon(Icons.screen_rotation_alt_sharp),
        SizedBox(width: 20),
        Icon(Icons.send),
      ],
    );
  }
}

class TwoReplyAvatar extends StatelessWidget {
  const TwoReplyAvatar({super.key, required this.avatarUrls});

  final List<String> avatarUrls;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        for (var i = 0; i < 2; i++)
          Transform.translate(
            offset: Offset((i == 0 ? -5 : 5), 0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF616161),
                  width: 1,
                ),
              ),
              child: CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(
                  avatarUrls[i],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// TODO: This widget isnt dynamic
class _MultiReplyAvatar extends StatelessWidget {
  const _MultiReplyAvatar();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.translate(
          offset: const Offset(-10, -2),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF616161),
                width: 1,
              ),
            ),
            child: const CircleAvatar(
              radius: 8,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(11, -9),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF616161),
                width: 1,
              ),
            ),
            child: const CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(5, 10),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF616161),
                width: 1,
              ),
            ),
            child: const CircleAvatar(
              radius: 5,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContextMenu extends StatelessWidget {
  const _ContextMenu();

  Future<Widget?> _displayMenu(context) {
    var groupStyle = BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
    );
    var btnStyle = OutlinedButton.styleFrom(
      alignment: Alignment.centerLeft,
      shape: const ContinuousRectangleBorder(),
      side: const BorderSide(width: 0),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      textStyle: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
    );

    return showModalBottomSheet<Widget>(
      backgroundColor: Theme.of(context).colorScheme.surface,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(
            top: 15,
            left: 25,
            right: 25,
            bottom: 65,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 10,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFF555555),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: groupStyle,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton(
                      style: btnStyle.merge(
                        OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Unfollow"),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.onTertiary,
                      height: 1,
                      thickness: 1,
                    ),
                    OutlinedButton(
                      style: btnStyle.merge(
                        OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Mute"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                decoration: groupStyle,
                clipBehavior: Clip.hardEdge,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton(
                      style: btnStyle.merge(
                        OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Hide"),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.onTertiary,
                      height: 1,
                      thickness: 1,
                    ),
                    OutlinedButton(
                      style: btnStyle.merge(
                        OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Report"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.topCenter,
      constraints: const BoxConstraints(),
      iconSize: 20,
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.more_horiz),
      onPressed: () {
        _displayMenu(context);
      },
    );
  }
}
