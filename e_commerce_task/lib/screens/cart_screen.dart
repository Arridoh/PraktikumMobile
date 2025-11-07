import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final String brand;
  final String imageUrl; 
  double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.price,
    this.quantity = 1, 
  });
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(
      id: 'p1',
      name: 'Model Goku',
      brand: 'Anime',
      imageUrl: 'assets/images/ModelGokuv2.jpg',
      price: 40.0,
      quantity: 1,
    ),
    CartItem(
      id: 'p2',
      name: 'Airpods',
      brand: 'Apple',
      imageUrl: 'assets/images/apple-airpods-ai-generative-free-png.png',
      price: 333.0,
      quantity: 1,
    ),
    CartItem(
      id: 'p3',
      name: 'Hoodie',
      brand: 'Pismo',
      imageUrl: 'assets/images/hoodie-green-long-hand.png',
      price: 50.0,
      quantity: 1,
    ),
  ];

  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Item removed from cart")),
    );
  }

  double get _subtotal {
    return cartItems.fold(
        0.0, (sum, item) => sum + (item.price * item.quantity));
  }
  
  double get _discount => 4.0;
  double get _deliveryCharges => 2.0;
  double get _total {
    return _subtotal - _discount + _deliveryCharges;
  }
  
  int get _totalItems {
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Warna latar belakang abu-abu muda
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                // Panggil widget build item keranjang
                return _buildCartItemCard(cartItems[index], index);
              },
            ),
          ),

          _buildOrderSummary(),
          
          _buildCheckoutButton(),
        ],
      ),
    );
  }

  Widget _buildCartItemCard(CartItem item, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          // Gambar Produk
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset( 
              item.imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),

          // Info Produk (Nama, Brand, Harga)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(item.brand, style: TextStyle(color: Colors.grey[600])),
                SizedBox(height: 4),
                Text('\$${item.price.toStringAsFixed(0)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black)),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Tombol Hapus
              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red, size: 20),
                onPressed: () => _removeItem(index),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  _buildQuantityButton(
                    icon: Icons.remove,
                    onPressed: () => _decrementQuantity(index),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      item.quantity.toString().padLeft(2, '0'), // Format '02'
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildQuantityButton(
                    icon: Icons.add,
                    onPressed: () => _incrementQuantity(index),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildQuantityButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.blue.withAlpha(40),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: Colors.blue[700], size: 18),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _buildSummaryRow('Items', _totalItems.toString()),
          _buildSummaryRow('Subtotal', '\$${_subtotal.toStringAsFixed(0)}'),
          _buildSummaryRow('Discount', '-\$${_discount.toStringAsFixed(0)}'),
          _buildSummaryRow('Delivery Charges', '\$${_deliveryCharges.toStringAsFixed(0)}'),
          Divider(height: 24, thickness: 1),
          _buildSummaryRow('Total', '\$${_total.toStringAsFixed(0)}', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: isTotal ? 18 : 14,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                  color: isTotal ? Colors.black : Colors.grey[700])),
          Text(value,
              style: TextStyle(
                  fontSize: isTotal ? 18 : 14,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                  color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[700], // Warna tombol
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {
          // Aksi untuk Check Out
          final messenger = ScaffoldMessenger.of(context);
          setState(() {
            cartItems.clear();
          });
          Navigator.of(context).popUntil((route) => route.isFirst);
          messenger.showSnackBar(
            SnackBar(content: Text("Checkout Berhasil!")),
          );
        },
        child: Text(
          'Check Out',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}