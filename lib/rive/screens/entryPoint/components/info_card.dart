import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final String bio;
  final TextStyle textStyle;

  const InfoCard({
    Key? key,
    required this.name,
    required this.bio,
    this.textStyle = const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name.toUpperCase(),
            style: textStyle,
          ),
          const SizedBox(height: 8.0),
          Text(
            bio,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
