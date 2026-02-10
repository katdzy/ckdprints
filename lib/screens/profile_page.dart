import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Figma design colors
  static const Color gradientStart = Color(0xFF4690FF);
  static const Color gradientEnd = Color(0xFF6433F6);
  static const Color accentPurple = Color(0xFF9810FA);
  static const Color headingColor = Color(0xFF1E2939);
  static const Color subtitleColor = Color(0xFF6A7282);
  static const Color textColor = Color(0xFF4A5565);
  static const Color bgGray = Color(0xFFF9FAFB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Gradient Header Section
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [gradientStart, gradientEnd],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My Profile',
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Profile Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          // Profile Image
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/juan.png',
                                  fit: BoxFit.cover, // ensures the image covers the circle
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                          // Profile Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Juan Dela Cruz',
                                  style: TextStyle(
                                    fontFamily: 'League Spartan',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: headingColor,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'jd.cruz@email.com',
                                  style: TextStyle(
                                    fontFamily: 'League Spartan',
                                    fontSize: 14,
                                    color: subtitleColor,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                        fontFamily: 'League Spartan',
                                        fontSize: 14,
                                        color: accentPurple,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12,
                                      color: accentPurple,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Stats Section
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem('23', 'Orders'),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey[200],
                          ),
                          _buildStatItem('12', 'Wishlist'),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey[200],
                          ),
                          _buildStatItem('3', 'Reviews'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Menu List Section
          Expanded(
            child: Container(
              color: bgGray,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildMenuItem(
                    Icons.shopping_bag_outlined,
                    'My Orders',
                    '3',
                  ),
                  const SizedBox(height: 12),
                  _buildMenuItem(
                    Icons.favorite_border,
                    'Wishlist',
                    '12',
                  ),
                  const SizedBox(height: 12),
                  _buildMenuItem(
                    Icons.location_on_outlined,
                    'Shipping Address',
                    '2',
                  ),
                  const SizedBox(height: 12),
                  _buildMenuItem(
                    Icons.credit_card_outlined,
                    'Payment Methods',
                    '1',
                  ),
                  const SizedBox(height: 12),
                  _buildMenuItem(
                    Icons.notifications_outlined,
                    'Notifications',
                    null,
                  ),
                  const SizedBox(height: 12),
                  _buildMenuItem(
                    Icons.settings_outlined,
                    'Settings',
                    null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: accentPurple,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 14,
            color: subtitleColor,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String? badge) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: accentPurple.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: accentPurple,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 16,
            color: headingColor,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: accentPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontSize: 14,
                    color: accentPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: subtitleColor,
            ),
          ],
        ),
        onTap: () {
          // Handle menu item tap
        },
      ),
    );
  }
}
