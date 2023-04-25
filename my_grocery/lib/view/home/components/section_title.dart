import 'package:flutter/material.dart';

// A reusable widget for section titles in the home screen.
class SectionTitle extends StatelessWidget {
  final String title; // The title of the section.

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(10, 10, 10, 5), // Padding around the title.
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Aligns children to the left and right edges of the row.
        children: [
          Text(
            title, // The section title to display.
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const Text(
            "See more", // A text button to see more items in the section.
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
