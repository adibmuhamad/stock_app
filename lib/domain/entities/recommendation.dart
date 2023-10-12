class Recommendation {
  final String? symbol;
  final String? recommendation;
  final String? description;
  final double? price;
  final double? buyingPrice;
  final double? sellingPrice;
  final double? stopLoss;
  final double? targetPrice;
  final double? predictedPrice;
  final String? date;

  Recommendation(
      {this.symbol,
      this.recommendation,
      this.description,
      this.price,
      this.buyingPrice,
      this.sellingPrice,
      this.stopLoss,
      this.targetPrice,
      this.predictedPrice,
      this.date});
}
