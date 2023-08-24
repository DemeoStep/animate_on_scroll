import 'package:flutter/material.dart';

class VariantWidget extends StatelessWidget {
  final String prefix;
  final String variant;
  final String asset;

  const VariantWidget({
    required this.asset,
    required this.variant,
    required this.prefix,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          asset,
          height: 20,
        ),
        const SizedBox(width: 10),
        Text(
          '$prefix $variant',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
