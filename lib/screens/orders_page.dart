import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // Figma design colors
  static const Color gradientStart = Color(0xFF4690FF);
  static const Color gradientEnd = Color(0xFF6433F6);
  static const Color accentPurple = Color(0xFF9810FA);
  static const Color headingColor = Color(0xFF1E2939);
  static const Color subtitleColor = Color(0xFF6A7282);
  static const Color textColor = Color(0xFF4A5565);
  static const Color bgGray = Color(0xFFF9FAFB);
  static const Color deliveredGreen = Color(0xFF10B981);
  static const Color shippedPurple = Color(0xFF9810FA);

  String selectedFilter = 'All Orders';
  final List<String> filters = ['All Orders', 'Pending', 'Processing', 'Shipped'];

  // Sample orders data
  final List<Map<String, dynamic>> orders = [
    {
      'orderId': 'ORD-2024-001',
      'date': 'Feb 2, 2024',
      'status': 'Delivered',
      'statusColor': deliveredGreen,
      'progress': 3,
      'products': [
        {'name': 'Knitted Teddy Bear', 'quantity': 1, 'price': 99.99, 'icon': Icons.card_giftcard},
        {'name': 'Flexi Octopus', 'quantity': 1, 'price': 89.99, 'icon': Icons.pets},
      ],
      'total': 188.98,
    },
    {
      'orderId': 'ORD-2024-002',
      'date': 'Feb 3, 2024',
      'status': 'Shipped',
      'statusColor': shippedPurple,
      'progress': 2,
      'products': [
        {'name': 'Glasses Stand', 'quantity': 1, 'price': 129.99, 'icon': Icons.visibility},
      ],
      'total': 129.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: headingColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Orders',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: headingColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Filter Tabs
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filters.map((filter) {
                  final isSelected = selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? const LinearGradient(
                                  colors: [gradientStart, gradientEnd],
                                )
                              : null,
                          color: isSelected ? null : Colors.white,
                          border: isSelected ? null : Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            fontSize: 14,
                            color: isSelected ? Colors.white : textColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Orders List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildOrderCard(order),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order['orderId'],
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: headingColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    order['date'],
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 14,
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: order['statusColor'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 16,
                      color: order['statusColor'],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      order['status'],
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 12,
                        color: order['statusColor'],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Progress Tracker
          _buildProgressTracker(order['progress']),
          const SizedBox(height: 20),

          // Products
          ...List.generate(order['products'].length, (index) {
            final product = order['products'][index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: bgGray,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      product['icon'],
                      color: subtitleColor,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: const TextStyle(
                            fontFamily: 'League Spartan',
                            fontSize: 16,
                            color: headingColor,
                          ),
                        ),
                        Text(
                          'Quantity: ${product['quantity']}',
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            fontSize: 14,
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '₱${product['price'].toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: accentPurple,
                    ),
                  ),
                ],
              ),
            );
          }),

          const Divider(height: 24),

          // Total Amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontSize: 16,
                  color: textColor,
                ),
              ),
              Text(
                '₱${order['total'].toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: accentPurple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Handle track order
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey[300]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    'Track Order',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [gradientStart, gradientEnd],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // Handle view details
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'View Details',
                              style: TextStyle(
                                fontFamily: 'League Spartan',
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressTracker(int progress) {
    return Row(
      children: List.generate(3, (index) {
        final isComplete = index < progress;
        return Expanded(
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isComplete ? accentPurple : Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isComplete ? Icons.check : Icons.circle,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              if (index < 2)
                Expanded(
                  child: Container(
                    height: 2,
                    color: index < progress - 1 ? accentPurple : Colors.grey[300],
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
