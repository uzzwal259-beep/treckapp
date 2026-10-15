import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(25),
      children: const [
        SizedBox(height: 35),
        CircleAvatar(radius: 48, backgroundColor: Color(0xFFE1F5EF),
          child: Icon(Icons.person, size: 55, color: AppColors.green)),
        SizedBox(height: 15),
        Text('Pramod', textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.navy)),
        SizedBox(height: 5),
        Text('TrekNepal Explorer', textAlign: TextAlign.center, style: TextStyle(color: AppColors.muted)),
        SizedBox(height: 35),
        ListTile(leading: Icon(Icons.person_outline), title: Text('Personal Information'), trailing: Icon(Icons.chevron_right)),
        Divider(),
        ListTile(leading: Icon(Icons.notifications_outlined), title: Text('Notifications'), trailing: Icon(Icons.chevron_right)),
        Divider(),
        ListTile(leading: Icon(Icons.settings_outlined), title: Text('Settings'), trailing: Icon(Icons.chevron_right)),
        Divider(),
        ListTile(leading: Icon(Icons.help_outline), title: Text('Help and Support'), trailing: Icon(Icons.chevron_right)),
      ],
    );
  }
}
