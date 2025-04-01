import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_source/stock_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/model/stock_listing.dart';

class StockDataSourceImpl implements StockDataSource {
  final FileOperator myFile = MockOperatorImpl();

  @override
  Future<List<StockListing>> getStockListings() async {
    final String text = await myFile.readAsLines();
    final List<String> csvList = text.split('\n');
    csvList.removeAt(0);

    return csvList
        .map((e) => StockListing.fromCsv(e))
        .where((e) => e.name?.isNotEmpty ?? false)
        .toList();
  }
}

abstract interface class FileOperator {
  Future<String> readAsLines();
}

class MockOperatorImpl implements FileOperator {
  @override
  Future<String> readAsLines() async {
    return """symbol,name,exchange,assetType,ipoDate,delistingDate,status
A,Agilent Technologies Inc,NYSE,Stock,1999-11-18,null,Active
AA,Alcoa Corp,NYSE,Stock,2016-10-18,null,Active""";
  }
}

class FileOperatorImpl implements FileOperator {
  final File _stockFile = File(
    '/Users/junsuk/dev/FlutterProjects/modu-3-dart-study/lib/2025-03-31/listing_status.csv',
  );

  @override
  Future<String> readAsLines() async {
    return await _stockFile.readAsString();
  }

}