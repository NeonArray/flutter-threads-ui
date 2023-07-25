import 'package:flutter/material.dart';
import 'package:threads/models/user.dart';
import 'package:threads/widgets/thread_card.dart';

var users = [
  UserModel(
    id: "1",
    username: "neonarray",
    avatarUrl: "https://i.pravatar.cc/300",
    isVerified: true,
    isPrivate: false,
    tagline: "some tagline that is clever",
    links: ["https://aaronarney.dev", "https://github.com/neonarray"],
    followers: ["2", "3"],
    following: ["3"],
  ),
  UserModel(
    id: "2",
    username: "npr",
    avatarUrl: "https://i.pravatar.cc/300",
    isVerified: true,
    isPrivate: false,
    tagline: "some tagline that is clever",
    links: ["https://aaronarney.dev", "https://github.com/neonarray"],
    followers: [],
    following: ["2"],
  ),
  UserModel(
    id: "3",
    username: "cnn",
    avatarUrl: "https://i.pravatar.cc/300",
    isVerified: true,
    isPrivate: false,
    tagline: "some tagline that is clever",
    links: ["https://aaronarney.dev", "https://github.com/neonarray"],
    followers: ["1"],
    following: ["1"],
  ),
];

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Search",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: const Color(0xFF262626),
              hintStyle: const TextStyle(
                color: Color(0xFF616161),
              ),
              constraints: const BoxConstraints(
                maxHeight: 50,
              ),
              hintText: "Search",
              prefixIcon: const Icon(Icons.search, color: Color(0xFF616161)),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FollowFeed(users: users),
        ],
      ),
    );
  }
}

class FollowFeed extends StatelessWidget {
  final List<UserModel> users;

  const FollowFeed({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return _User(user: users[index]);
        },
      ),
    );
  }
}

class _User extends StatelessWidget {
  const _User({required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Username(
                        username: user.username,
                        isVerified: user.isVerified,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: [
                      Text(
                        user.tagline,
                        style: const TextStyle(
                          color: Color(0xFF616161),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TwoReplyAvatar(avatarUrls: [
                        "https://i.pravatar.cc/300",
                        "https://i.pravatar.cc/300"
                      ]),
                      const SizedBox(width: 15),
                      Text(
                        "${user.followers.length} followers",
                        style: const TextStyle(
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                ],
              ),
            ),
            SizedBox(
              height: 30,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Follow",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
