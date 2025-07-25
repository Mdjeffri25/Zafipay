import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD1C3C3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: const Text(
                    'J',
                    style: TextStyle(fontSize: 36, color: Colors.black),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.edit, size: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _ProfileTile(
              icon: Icons.phone_android,
              title: 'Mobile number',
              subtitle: '+91 9512345678',
              trailing: Text('Edit', style: TextStyle(color: Colors.black)),
            ),
            _ProfileTile(
              icon: Icons.email,
              title: 'Email',
              subtitle: 'justcheck@gmail.com',
            ),
            _ProfileTile(
              icon: Icons.notifications_none,
              title: 'Notification and emails',
            ),
            _ProfileTile(icon: Icons.assignment, title: 'Raise Issue'),
            _ProfileTile(icon: Icons.security, title: 'Privacy and security'),
            _ProfileTile(
              icon: Icons.language,
              title: 'Language',
              subtitle: 'English',
              trailing: Text('Change', style: TextStyle(color: Colors.black)),
            ),
            _ProfileTile(icon: Icons.help_outline, title: 'Help & feedback'),
            _ProfileTile(icon: Icons.logout, title: 'Log out'),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  const _ProfileTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: trailing,
        onTap: () {},
      ),
    );
  }
}
