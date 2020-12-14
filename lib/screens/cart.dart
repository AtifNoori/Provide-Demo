import 'package:flutter/material.dart';
import 'package:provide_demo/modals/CartModal.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.remove_circle,
                color: Colors.white,
              ),
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).removeAll();
              },
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Cart Items',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Consumer<CartModel>(
              builder: (context, cart, child){
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text(cart.selectedProducts[index]),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: cart.selectedProducts.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
