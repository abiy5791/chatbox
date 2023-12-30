// ignore_for_file: non_constant_identifier_names, unused_local_variable, unrelated_type_equality_checks, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:chatbox/main.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key, required this.chatRoom});
  final ChatRoom chatRoom;
  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    final CurrentParticipant =
        widget.chatRoom.participants.firstWhere((user) => user.id == userId1);

    final OtherParticipant = widget.chatRoom.participants
        .firstWhere((user) => user.id != CurrentParticipant.id);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Avatar(ImageUrl: OtherParticipant.avatarUrl, radius: 18),
            Text(
              OtherParticipant.username,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.ImageUrl,
    required this.radius,
  });

  final String ImageUrl;
  final int radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: radius.toDouble() + 2,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: CircleAvatar(
          radius: radius.toDouble(),
          backgroundImage: NetworkImage(ImageUrl),
        ));
  }
}
