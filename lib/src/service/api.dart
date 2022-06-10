import '../domain/delivery.dart';
import 'package:http/http.dart' as http;

String baseUrl ="http://192.168.254.107:8000";

Future<List<Delivery>> getDeliveries() async{
  final response = await http.get("$baseUrl/api/deliveries");
  return deliveryFromJson(response.body);
}

Future<http.Response> createDelivery(Delivery delivery) async{
  final response = await http.post("$baseUrl/api/deliveries",
  body: deliveryToJson(delivery));
  return response;
}