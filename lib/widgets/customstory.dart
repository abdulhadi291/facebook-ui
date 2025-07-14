import 'package:flutter/material.dart';

class StoryCustomTile extends StatelessWidget {
  final String storyImage;
  final String profileImage;

  const StoryCustomTile({
    super.key,
    required this.profileImage,
    required this.storyImage,
  });

  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 115,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        image: DecorationImage(
          image: NetworkImage(storyImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 6, 105, 186),
                width: 3,
              ),
            ),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(profileImage),
            ),
          ),
        ],
      ),
    );
  }
}
