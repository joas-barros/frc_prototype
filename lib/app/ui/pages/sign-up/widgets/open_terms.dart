import 'package:flutter/material.dart';

class OpenTerms extends StatelessWidget {

  final String title;
  const OpenTerms({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 16),
          ],
        ),
      ),
    );
  }
}