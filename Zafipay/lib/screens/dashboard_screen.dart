import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with profile and notification icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                  ),
                  Icon(Icons.notifications_none, size: 28),
                ],
              ),
            ),
            // Available Balance
            const SizedBox(height: 8),
            const Text(
              'Available Balance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              '₹10,000.00',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Top up, Send, Receive, History buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _DashboardAction(
                      icon: Icons.account_balance_wallet,
                      label: 'Top up',
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/sendmoney');
                      },
                      child: _DashboardAction(icon: Icons.send, label: 'Send'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/receivemoney');
                      },
                      child: _DashboardAction(
                        icon: Icons.call_received,
                        label: 'Receive',
                      ),
                    ),
                    _DashboardAction(icon: Icons.history, label: 'History'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Payment List
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment List',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Payment icons grid
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 0.9,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          children: const [
                            _PaymentItem(
                              icon: Icons.phone_android,
                              label: 'Mobile Recharge',
                            ),
                            _PaymentItem(
                              icon: Icons.flash_on,
                              label: 'Electricity Bill',
                            ),
                            _PaymentItem(
                              icon: Icons.play_circle_outline,
                              label: 'UPI Payment',
                            ),
                            _PaymentItem(
                              icon: Icons.credit_card,
                              label: 'Credit Card',
                            ),
                            _PaymentItem(
                              icon: Icons.account_balance,
                              label: 'Bank Transfer',
                            ),
                            _PaymentItem(
                              icon: Icons.receipt_long,
                              label: 'Bill Payments',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom navigation bar
            Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavIcon(icon: Icons.home, label: 'Home'),
                  _NavIcon(icon: Icons.swap_horiz, label: 'Transaction'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      Icons.qr_code_scanner,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  _NavIcon(icon: Icons.pie_chart, label: 'Budget'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: _NavIcon(icon: Icons.person, label: 'Profile'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardAction extends StatelessWidget {
  final IconData icon;
  final String label;
  const _DashboardAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.black),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _PaymentItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _PaymentItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 32, color: Colors.black),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _NavIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.black),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}
