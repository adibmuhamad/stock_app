
class Quote {
  final int? id;
  final String? symbol;
  final String? name;
  final double? open;
  final double? close;
  final double? prevClose;
  final double? high;
  final double? low;
  final double? volume;
  final double? change;
  final double? changePercent;
  final String? lastUpdated;

  Quote({
    this.id, 
    this.symbol,
    this.name, 
    this.open,
    this.close,
    this.prevClose,
    this.high,
    this.low,
    this.volume,
    this.change,
    this.changePercent,
    this.lastUpdated,
  });
}
