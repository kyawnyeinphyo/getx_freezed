import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_freezed/controller/book_controller.dart';
import 'package:getx_freezed/controller/cart_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => BookController());
        Get.lazyPut(() => CartController());
      }),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookController = Get.find<BookController>();
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const CartPage()),
        child: const Icon(Icons.shopping_cart),
      ),
      body: Center(
        child: Obx(
          () => bookController.state.when(
            initial: () => ElevatedButton(
              onPressed: () => bookController.fetchBook(),
              child: const Text('Fetch Book'),
            ),
            loading: () => const CircularProgressIndicator(),
            loaded: (book) => ListView.builder(
              itemCount: book.length,
              itemBuilder: (context, index) {
                final b = book[index];
                return ListTile(
                  onTap: () => cartController.addToCart(b),
                  title: Text(b.name),
                  subtitle: Text(b.author),
                );
              },
            ),
            error: (error) => Text(error),
          ),
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          int count = cartController.state.totalItems;
          return Text('Cart Page $count');
        }),
        actions: [
          IconButton(
            onPressed: () => cartController.clearCart(),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Obx(
        () {
          final book = cartController.state.books;

          return ListView.builder(
            itemCount: book.length,
            itemBuilder: (context, index) {
              final b = book[index];
              return ListTile(
                onTap: () => cartController.removeFromCart(b),
                title: Text(b.name),
                subtitle: Text(b.author),
              );
            },
          );
        },
      ),
    );
  }
}
