import 'package:flutter/material.dart';
import 'package:provide_demo/modals/CartModal.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {

  final products = List<String>.generate(20, (index) {
    return "Product No $index";
  });


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index){
        return ListTile(
          title: Text(products[index]),
          onTap: (){
            Provider.of<CartModel>(context, listen: false).add(products[index]);
            SnackBar s = SnackBar(content: Text('Product No $index is added'));
            Scaffold.of(context).showSnackBar(s);
          },
        );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: products.length,
    );
  }
}
