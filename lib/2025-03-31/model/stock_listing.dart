class StockListing {
  String? symbol;
  String? name;
  String? exchange;
  String? assetType;
  String? ipoDate;
  String? delistingDate;
  String? status;

  StockListing({
    this.symbol,
    this.name,
    this.exchange,
    this.assetType,
    this.ipoDate,
    this.delistingDate,
    this.status,
  });

  factory StockListing.fromCsv(String? csvRow) {
    List<String> result = csvRow?.split(',') ?? [];

    if (result.length != 7) {
      throw Exception('Invalid CSV row: $csvRow');
    }

    if (result.isEmpty) {
      throw Exception('Invalid CSV row: $csvRow');
    }

    return StockListing(
      symbol: result[0],
      name: result[1],
      exchange: result[2],
      assetType: result[3],
      ipoDate: result[4],
      delistingDate: result[5],
      status: result[6],
    );
  }

  @override
  String toString() {
    return '{symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status}';
  }
}