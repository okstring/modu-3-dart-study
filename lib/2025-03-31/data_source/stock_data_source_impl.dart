import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_source/stock_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/model/stock_listing.dart';

class StockDataSourceImpl implements StockDataSource {
  final File _stockFile = File(
    '/Users/junsuk/dev/FlutterProjects/modu-3-dart-study/lib/2025-03-31/listing_status.csv',
  );

  @override
  Future<List<StockListing>> getStockListings() async {
    final List<String> csvList = await _stockFile.readAsLines();
    csvList.removeAt(0);

    return csvList
        .map((e) => StockListing.fromCsv(e))
        .where((e) => e.name?.isNotEmpty ?? false)
        .toList();
  }
}
