class SalePrice {
  final double price;
  final String cvtDatetime;

  SalePrice(this.price, this.cvtDatetime);

  SalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDatetime = json['cvtDatetime'];
}

class ChartData {
  final String collectionName;
  final List<SalePrice> collectionSalePrice;

  ChartData(this.collectionName, this.collectionSalePrice);

  ChartData.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'],
      collectionSalePrice =
          (json['collectionSalePrice'] as List? ?? [])
              .map((e) => SalePrice.fromJson(e))
              .toList();
}

class ChartDataResponse {
  final List<ChartData> collectionChartDataList;

  ChartDataResponse(this.collectionChartDataList);

  ChartDataResponse.fromJson(Map<String, dynamic> json)
    : collectionChartDataList = (json['collectionChartDataList'] as List)
        .map((e) => ChartData.fromJson(e))
        .toList();
}
