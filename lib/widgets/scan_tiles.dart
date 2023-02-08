import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/utils/utils.dart';

import '../providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({super.key, required this.tipo});
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, int i) => Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red),
        onDismissed: (direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarScansById(scans[i].id ?? 0);
        },
        child: ListTile(
          leading: Icon(
              tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
              color: Theme.of(context).primaryColor),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => launchURL(context, scans[i]),
        ),
      ),
    );
  }
}
