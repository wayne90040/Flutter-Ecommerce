

class Discount {
  final String httpStatus;
  final List<DiscountItem> discounts;

  Discount(this.httpStatus, this.discounts);

  factory Discount.fromJson(Map<String, dynamic> json) {
    var discountsJson = json["discounts"] as List;
    List<DiscountItem> _discounts = discountsJson.map((item) => DiscountItem.fromJson(item)).toList();

    return Discount(json["httpStatus"], _discounts);
  }
}


class DiscountItem {
  final int id;
  final String zoneId;
  final String title;
  final String value;
  final String clickThrough;

  DiscountItem(this.id, this.zoneId, this.title, this.value, this.clickThrough);

  factory DiscountItem.fromJson(dynamic json) {
    return DiscountItem(
        json["id"] ?? 0,
        json["zoneId"] ?? "",
        json["title"] ?? "",
        json["value"] ?? "",
        json["clickThrough"] ?? "");
  }
}