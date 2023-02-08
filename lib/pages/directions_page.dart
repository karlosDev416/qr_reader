import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/scan_tiles.dart';

class DirectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'http');
  }
}
