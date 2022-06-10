import 'dart:convert';

class Delivery{
  late int id;
  late String customerName;
  late String order;
  late String price;
  late String quantity;
  late String total;

  Delivery({required this.id, required this.customerName, required this.order, required this.price, required this.quantity, required this.total});
  factory Delivery.fromJson(Map<String, dynamic> json){
    return Delivery(
      id: json["id"],
      customerName: json["customerName"],
      order: json["order"],
      price: json["price"],
      quantity: json["quantity"],
      total: json["total"]
    );
  }
  Map<String, dynamic> toJson(){
    return{
      "id": id,
      "customerName": customerName,
      "order": order,
      "price": price,
      "quantity": quantity,
      "total": total
    };
  }

  @override
  String toString() {
    return 'Delivery{id: $id, customerName: $customerName, order: $order, price: $price, quantity: $quantity, total: $total}';
  }
}

List<Delivery> deliveryFromJson(String strJson){
  final str = json.decode(strJson);
  return List<Delivery>.from(str.map((item){
    return Delivery.fromJson(item);
  }));
}
String deliveryToJson(Delivery data){
  final dyn = data.toJson();
  return json.encode(dyn);
}