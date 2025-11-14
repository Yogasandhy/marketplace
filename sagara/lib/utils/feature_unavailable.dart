import 'package:flutter/material.dart';

const _featureUnavailableMessage = 'Maaf, fitur ini belum tersedia';

void showFeatureUnavailableMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(_featureUnavailableMessage),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

