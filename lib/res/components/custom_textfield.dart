// import 'package:flutter/material.dart';
//
// class CustomTextField extends StatefulWidget {
//   final String hint;
//   final TextEditingController? textController;
//   const CustomTextField({super.key,required this.hint,this.textController});
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         hintText: widget.hint,
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? textController;
  final IconData? icon;
  const CustomTextField({
    super.key,
    required this.hint,
    this.textController,
    this.icon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    // Use Theme.of(context) to access the current theme's color scheme
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: widget.textController,
      decoration: InputDecoration(
        filled: true, // Add fill color
        fillColor: colorScheme.surfaceVariant, // Use surface variant color for fill
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0), // Rounded corners
          borderSide: BorderSide.none, // No border side
        ),
        hintText: widget.hint,
        prefixIcon: widget.icon != null ? Icon(widget.icon, color: colorScheme.onSurfaceVariant) : null, // Optional icon
        hintStyle: TextStyle(color: colorScheme.onSurfaceVariant), // Hint text style
        // Elevation for depth effect
        isDense: true, // Reduces the default size of the input field
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), // Padding inside the field
      ),
      style: TextStyle(color: colorScheme.onSurface), // Text color
    );
  }
}
