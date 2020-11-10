import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
class StoryPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text('''Happy Quarantine,
Keep coding.
#QuarantineAndCode''', Colors.red),
      StoryItem.text('''Hello
This is a whatsapp clone made by me!
#QuarantineAndCode''', Colors.yellow),
    ];
    return Material(
      child: StoryView(
        storyItems,
        controller: controller,
        inline: false,
        repeat: true,
      ),
    );
  }
}