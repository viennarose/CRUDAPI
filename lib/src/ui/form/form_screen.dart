import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  int id;
  String customerName;
  String order;
  String quantity;
  String price;
  String total;
  bool _isApiProcess = false;

  FormScreen({ required this.id, required this.customerName, required this.order, required this.price, required this.quantity, required this.total,});

  @override
  _FormScreenState createState() => _FormScreenState();
}
class _FormScreenState extends State<FormScreen> {
  final TextEditingController _controllerCustomerName = TextEditingController();
  final TextEditingController _controllerOrder = TextEditingController();
  final TextEditingController _controllerQuantity = TextEditingController();
  final TextEditingController _controllerPrice = TextEditingController();
  final TextEditingController _controllerTotal = TextEditingController();

  @override
  void initState(){
    _controllerCustomerName.text = widget.customerName;
    _controllerOrder.text = widget.order;
    _controllerQuantity.text = widget.quantity;
    _controllerPrice.text = widget.price;
    _controllerTotal.text = widget.total;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: SafeArea(
          child: Column(
            children: <Widget> [
              TextField(
                decoration: InputDecoration(hintText: "Customer Name"),
                controller: _controllerCustomerName
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
                TextField(
                  decoration: InputDecoration(hintText: "Order"),
                    controller: _controllerOrder
                ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Quantity"),
                keyboardType: TextInputType.number,
                  controller: _controllerQuantity
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Price"),
                keyboardType: TextInputType.number,
                  controller: _controllerPrice
              ),
              widget.id == null ?
              RaisedButton(child: Text('Add'), onPressed: (){}) : Center(),

            ],
          ),
        ),
      );
  }

  void showSnackBarMessage(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
