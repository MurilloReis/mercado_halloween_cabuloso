// lib/screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Usar Consumer para reconstruir apenas o necessário quando o carrinho mudar
    return Consumer<CartProvider>(
      builder: (ctx, cart, child) { // 'child' é para otimizações, não usado aqui
        final cartItems = cart.items;

        return Column(
          children: <Widget>[
            Card(
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Total:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(), // Empurra para a direita
                    Chip(
                      label: Text(
                        'R\$ ${cart.totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).primaryTextTheme.titleLarge?.color ?? Colors.white,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: cartItems.isEmpty
                  ? const Center(child: Text('Seu carrinho está vazio! 🛒💨'))
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (ctx, i) => CartItemWidget(product: cartItems[i]),
                    ),
            ),
            if (cartItems.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Theme.of(context).hintColor, // Usando o accentColor do tema
                     foregroundColor: Colors.white,
                     minimumSize: const Size(double.infinity, 50) // Botão largo
                  ),
                  onPressed: () {
                    // Lógica para finalizar compra
                    cart.clearCart();
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Compra realizada com sucesso! 🎉'),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: const Text('FINALIZAR COMPRA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
          ],
        );
      },
    );
  }
}

// Widget para cada item no carrinho (para melhor organização)
class CartItemWidget extends StatelessWidget {
  final Product product;

  const CartItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: Text(product.emoji, style: const TextStyle(fontSize: 24)),
          title: Text(product.nome),
          subtitle: Text('Preço: R\$ ${product.preco.toStringAsFixed(2)}'),
          trailing: IconButton(
            icon: Icon(Icons.remove_shopping_cart, color: Theme.of(context).colorScheme.error),
            onPressed: () {
              // Para um protótipo, remover a primeira ocorrência é suficiente.
              // Numa app real, você precisaria de IDs únicos para itens no carrinho ou agrupar.
              cart.removeItem(product);
               ScaffoldMessenger.of(context).hideCurrentSnackBar();
               ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.nome} removido do carrinho!'),
                    duration: const Duration(seconds: 1),
                  ),
                );
            },
          ),
        ),
      ),
    );
  }
}