import 'package:crudapi/src/service/api.dart';
import 'package:crudapi/src/ui/form/form_screen.dart';
import 'package:flutter/material.dart';

import '../../domain/delivery.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter CRUD"),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return FormScreen(quantity: '', order: '', customerName: '', price: '', total: '', id:0 );

              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(Icons.add),
            ),
          )

      ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getDeliveries(),
          builder: (context, snapshot){
            if (snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString())
              );
            }else if(snapshot.connectionState == ConnectionState.done){
              var response = snapshot.data as List<Delivery>;
              return ListView.builder(
                itemCount: response.length,
                itemBuilder: (context, position){
                  var deliveryItem = response[position];
                  return Padding(
                    padding: const EdgeInsets.all(14.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget> [
                            Text(
                              deliveryItem.customerName,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              deliveryItem.order,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              deliveryItem.quantity,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              deliveryItem.price,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              deliveryItem.total,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }else {
              return Center(
                child: CircularProgressIndicator()
              );
            }
          },
        ),
      ),
    );
  }
}
