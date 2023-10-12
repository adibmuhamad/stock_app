class StockModel {
  final String symbol;
  final double price;
  final String companyName;

  StockModel({required this.symbol, required this.price, required this.companyName});

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      symbol: json['symbol'],
      price: json['price'].toDouble(),
      companyName: json['companyName'],
    );
  }
}
