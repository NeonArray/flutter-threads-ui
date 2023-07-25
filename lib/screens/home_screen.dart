import 'package:flutter/material.dart';
import 'package:threads/models/thread.dart';
import 'package:threads/widgets/feed.dart';

var data = [
  const ThreadModel(
    id: "1",
    username: "liverpoolfc",
    avatarUrl: "https://i.pravatar.cc/150?img=3",
    content: "Everybody is sharing photos and videos from vacation.",
    time: "2023-07-24 15:20:10.297",
    replies: 5,
    likes: 22,
    isVerified: true,
  ),
  const ThreadModel(
    id: "2",
    username: "aaronarney",
    avatarUrl: "https://i.pravatar.cc/150",
    content: "Cool story.",
    time: "2023-07-24 13:20:10.297",
    replies: 0,
    likes: 2,
    isVerified: true,
  ),
  const ThreadModel(
    id: "3",
    username: "leapagency",
    avatarUrl: "https://i.pravatar.cc/150",
    content: "harvey and cursti join up with the group",
    time: "2021-07-24 15:20:10.297",
    replies: 2,
    likes: 22,
    isVerified: true,
  ),
  const ThreadModel(
    id: "4",
    username: "liverpoolfc",
    avatarUrl: "https://i.pravatar.cc/150?img=3",
    content:
        "International famous singer Tony Bennett has died. He was 96 years old.",
    time: "2023-03-24 15:20:10.297",
    replies: 2,
    likes: 22,
    isVerified: true,
  ),
  const ThreadModel(
    id: "5",
    username: "liverpoolfc",
    avatarUrl: "https://i.pravatar.cc/150?img=3",
    content: "John F. Kennedy has been assassinated in Dallas, TX.",
    time: "2023-07-22 15:20:10.297",
    replies: 1,
    likes: 22,
    isVerified: true,
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Feed(threads: data);
  }
}
