class CryptoModel {
  String name;

  String symbol;

  String currency;

  String logoUrl;

  String marketCap;

  String price;

  String rank;
  String id;
String circulatingSupply;
String maxSupply;
String marketDominance;
  // 6
  CryptoModel({
    this.name,
    this.id,
    this.symbol,
    this.currency,
    this.logoUrl,
    this.marketCap,
    this.price,
    this.rank,
    this.circulatingSupply,this.marketDominance,this.maxSupply
  });

  factory CryptoModel.fromJson(final json) {
    return CryptoModel(
      name: json["name"],
      id: json["id"],
      symbol: json["symbol"],
      currency: json["currency"],
      logoUrl: json["logo_url"],
      marketCap: json["market_cap"],
      price: json["price"],
      rank: json["rank"],
      circulatingSupply: json["circulating_supply"],
      marketDominance: json["market_cap_dominance"],
      maxSupply: json["max_supply"],
    );
  }
}

