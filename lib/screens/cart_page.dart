import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Figma design colors
  static const Color gradientStart = Color(0xFF498AFF);
  static const Color gradientEnd = Color(0xFF6433F6);
  static const Color accentPurple = Color(0xFF9810FA);
  static const Color headingColor = Color(0xFF1E2939);
  static const Color subtitleColor = Color(0xFF6A7282);
  static const Color textColor = Color(0xFF4A5565);
  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color bgGray = Color(0xFFF9FAFB);
  static const Color cardBg = Color(0xFFF3F4F6);

  // Cart data
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Knitted Teddy Bear',
      'size': '9',
      'color': 'Black',
      'price': 99.99,
      'quantity': 1,
      'icon': Icons.card_giftcard,
    },
    {
      'name': 'Flexi Octopus',
      'size': 'N/A',
      'color': 'White',
      'price': 89.99,
      'quantity': 2,
      'icon': Icons.pets,
    },
    {
      'name': 'Glasses Stand',
      'size': 'N/A',
      'color': 'Space Gray',
      'price': 129.99,
      'quantity': 1,
      'icon': Icons.visibility,
    },
  ];

  double get subtotal {
    return cartItems.fold(0.0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  double get shipping => 10.00;
  double get tax => 48.80;
  double get total => subtotal + shipping + tax;

  void updateQuantity(int index, int delta) {
    setState(() {
      final newQuantity = (cartItems[index]['quantity'] as int) + delta;
      if (newQuantity > 0) {
        cartItems[index]['quantity'] = newQuantity;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const Text(
                    'Shopping Cart',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: headingColor,
                    ),
                  ),
                  const SizedBox(width: 40), // Balance the header
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Cart Items
                    ...List.generate(cartItems.length, (index) {
                      final item = cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildCartItem(
                          item['name'],
                          item['size'],
                          item['color'],
                          item['price'],
                          item['quantity'],
                          item['icon'],
                          index,
                        ),
                      );
                    }),

                    const SizedBox(height: 8),

                    // Order Summary
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Order Summary',
                            style: TextStyle(
                              fontFamily: 'League Spartan',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: headingColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildSummaryRow('Subtotal', '₱${subtotal.toStringAsFixed(2)}'),
                          const SizedBox(height: 12),
                          _buildSummaryRow('Shipping', '₱${shipping.toStringAsFixed(2)}'),
                          const SizedBox(height: 12),
                          _buildSummaryRow('Tax (8%)', '₱${tax.toStringAsFixed(2)}'),
                          const SizedBox(height: 16),
                          Divider(color: borderColor, height: 1),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                  fontFamily: 'League Spartan',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: headingColor,
                                ),
                              ),
                              Text(
                                '₱${total.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontFamily: 'League Spartan',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: accentPurple,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Checkout Button
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [gradientStart, gradientEnd],
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // Handle checkout
                          },
                          borderRadius: BorderRadius.circular(14),
                          child: const Center(
                            child: Text(
                              'Proceed to Checkout',
                              style: TextStyle(
                                fontFamily: 'League Spartan',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(
    String name,
    String size,
    String color,
    double price,
    int quantity,
    IconData icon,
    int index,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 48,
                color: subtitleColor,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontFamily: 'League Spartan',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: headingColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Size: $size  •  $color',
                            style: const TextStyle(
                              fontFamily: 'League Spartan',
                              fontSize: 14,
                              color: subtitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Delete Button
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => removeItem(index),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Price and Quantity Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₱${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: accentPurple,
                      ),
                    ),

                    // Quantity Controls
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.remove, size: 16),
                            padding: EdgeInsets.zero,
                            onPressed: () => updateQuantity(index, -1),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontFamily: 'League Spartan',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: headingColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add, size: 16),
                            padding: EdgeInsets.zero,
                            onPressed: () => updateQuantity(index, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 16,
            color: textColor,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 16,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
