import 'package:flutter/material.dart';
import '../utils/app_data.dart';
import '../models/product_model.dart';
import './product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = halloweenProducts;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        final product = products[index];
        return Card(
          child: ListTile(
            leading: Text(
              product.emoji,
              style: const TextStyle(fontSize: 28),
            ),
            title: Text(
              product.nome,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              )
            ),
            subtitle: Text(
              'R\$ ${product.preco.toStringAsFixed(2)}',
               style: TextStyle(
                color: Colors.greenAccent[400],
                fontWeight: FontWeight.w500,
                fontSize: 15
              )
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.orangeAccent[100],
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        );
      },
    );
  }
}