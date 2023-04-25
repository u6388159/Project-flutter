import 'package:flutter/material.dart';

class InputOutlineButton extends StatelessWidget {
  final String title; // The text displayed on the button
  final Function onClick; // A function to be called when the button is pressed
  const InputOutlineButton({
    Key? key,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // Define the appearance of the button using TextButton.styleFrom
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context)
            .primaryColor, // Set the text color to the primary color of the current theme
        backgroundColor: Colors.white, // Set the background color to white
        minimumSize: const Size(double.maxFinite,
            45), // Set the minimum size of the button to be as wide as possible and 45 pixels tall
        padding: const EdgeInsets.symmetric(
            horizontal: 18.0), // Set the horizontal padding to 18 pixels
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
              Radius.circular(6.0)), // Set the border radius to 6 pixels
          side: BorderSide(
            color: Theme.of(context)
                .primaryColor, // Set the border color to the primary color of the current theme
          ),
        ),
      ),
      onPressed: () {
        FocusScope.of(context).requestFocus(
            FocusNode()); // Remove the focus from any currently focused text field
        onClick(); // Call the provided function when the button is pressed
      },
      child: Text(
        title, // The text displayed on the button
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight
                .w600), // Set the font size to 14 and the font weight to 600 (bold)
      ),
    );
  }
}
