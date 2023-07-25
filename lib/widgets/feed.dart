import 'package:flutter/material.dart';
import 'package:threads/models/thread.dart';
import 'package:threads/widgets/thread_card.dart';

class Feed extends StatelessWidget {
  const Feed({super.key, required this.threads});

  final List<ThreadModel> threads;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: threads.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ThreadCard(thread: threads[index]),
            const Divider(),
          ],
        );
      },
    );
  }
}
