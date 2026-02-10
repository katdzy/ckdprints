import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Figma design colors
  static const Color gradientStart = Color(0xFF498AFF);
  static const Color gradientEnd = Color(0xFF6433F6);
  static const Color accentPurple = Color(0xFF9810FA);
  static const Color headingColor = Color(0xFF1E2939);
  static const Color subtitleColor = Color(0xFF6A7282);
  static const Color textColor = Color(0xFF4A5565);
  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color bgGray = Color(0xFFF9FAFB);
  static const Color lightGray = Color(0xFF99A1AF);
  static const Color cardBg = Color(0xFFF3F4F6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Welcome and Cart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back,',
                            style: TextStyle(
                              fontFamily: 'League Spartan',
                              fontSize: 14,
                              color: subtitleColor,
                            ),
                          ),
                          const Text(
                            'Juan Dela Cruz',
                            style: TextStyle(
                              fontFamily: 'League Spartan',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: headingColor,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAF5FF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                              color: accentPurple,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: -4,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF6339A),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    fontFamily: 'League Spartan',
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Search Bar
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: bgGray,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search products...',
                        hintStyle: TextStyle(
                          fontFamily: 'League Spartan',
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        prefixIcon: const Icon(Icons.search, size: 20),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category Filters
                    SizedBox(
                      height: 43,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildCategoryChip('All', true),
                          const SizedBox(width: 8),
                          _buildCategoryChip('Toys', false),
                          const SizedBox(width: 8),
                          _buildCategoryChip('Fidgets', false),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Promotional Banner
                    Container(
                      height: 184,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [gradientStart, gradientEnd],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Special Offer',
                            style: TextStyle(
                              fontFamily: 'League Spartan',
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Up to 50% Off',
                            style: TextStyle(
                              fontFamily: 'League Spartan',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'On selected items this week',
                            style: TextStyle(
                              fontFamily: 'League Spartan',
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 30,
                            width: 114,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Shop Now',
                                style: TextStyle(
                                  fontFamily: 'League Spartan',
                                  fontSize: 14,
                                  color: accentPurple,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Popular Products Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Popular Products',
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: headingColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              fontFamily: 'League Spartan',
                              fontSize: 14,
                              color: accentPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Product Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.7,
                      children: [
                        _buildProductCard(
                          'Desk Trash Bins',
                          '₱129.99',
                          4.5,
                          234,
                          'Functional',
                          'assets/images/trash.png',
                        ),
                        _buildProductCard(
                          'Flexi Octopus',
                          '₱89.99',
                          4.8,
                          567,
                          'Toys',
                          'assets/images/octopus.png',
                        ),
                        _buildProductCard(
                          'Knitted Teddy Bear',
                          '₱99.99',
                          4.6,
                          189,
                          'Gifts',
                          'assets/images/bear.png',
                        ),
                        _buildProductCard(
                          'Glasses Stand',
                          '₱129.99',
                          4.3,
                          345,
                          'Accessories',
                          'assets/images/glasses.png',
                        ),
                      ],
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

  Widget _buildCategoryChip(String label, bool isActive) {
    return Container(
      height: 43,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        gradient: isActive
            ? const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [gradientStart, gradientEnd],
              )
            : null,
        color: isActive ? null : Colors.white,
        border: isActive ? null : Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 16,
            color: isActive ? Colors.white : const Color(0xFF364153),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(
    String name,
    String price,
    double rating,
    int reviews,
    String category,
    String imagePath,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Area
          Stack(
            children: [
              Container(
                height: 163,
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Make image take up ~60% of the card width
                    final imageSize = constraints.maxWidth * 0.6;

                    return Center(
                      child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.asset(
                        imagePath,
                        width: double.infinity,    // fill width
                        height: double.infinity,   // fill height
                        fit: BoxFit.cover,         // fills the gray area
                      ),
                    ),
                    );
                  },
                )),
              // Category Badge
              Positioned(
                left: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: accentPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Favorite Button
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: accentPurple,
                  ),
                ),
              ),
            ],
          ),
          // Product Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontSize: 14,
                    color: headingColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 12,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '($reviews)',
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 12,
                        color: lightGray,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: accentPurple,
                  ),
                ),
              ],
            ),)
          ),
        ],
      ),
    );
  }
}
