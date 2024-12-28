import 'package:clinex/features/clinex/auth/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipOval(
                    child: Image.asset('assets/images/doctor5.jpg',height: 150,),
                  ),
                ),
                SizedBox(height: 12,),
                Center(child: Text('Mike Ross',style: TextStyle(fontSize: size.width * 0.060,fontWeight: FontWeight.bold))),
                SizedBox(height: 12,),
                Divider(),
                SizedBox(height: 24,),
                Text('Account Settings',style: TextStyle(fontSize: size.width * 0.050,fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SettingTile(
                      icon: Iconsax.profile_circle,
                      title: 'Edit Profile',
                      subtitle: 'Update your profile information',
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    SettingTile(
                      icon: Iconsax.lock,
                      title: 'Privacy Settings',
                      subtitle: 'Manage who can see your activity',
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    SettingTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subtitle: 'Control app notifications',
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    SettingTile(
                      icon: Iconsax.security,
                      title: 'Account Security',
                      subtitle: 'Change password or enable 2FA',
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    SettingTile(
                      icon: Iconsax.logout,
                      title: 'Log Out',
                      subtitle: 'Sign out of your account',
                      onTap: ()  {
                        Get.offAll(() => const LoginScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: size.width * 0.07,
          backgroundColor: Colors.blueAccent.withOpacity(0.2),
          child: Icon(icon, color: Colors.blueAccent),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: size.width * 0.035, color: Colors.grey),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}


