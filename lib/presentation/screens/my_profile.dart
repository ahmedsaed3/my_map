import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/phone_auth_cubit.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/wallpaperflare.com_wallpaper.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Ahmed SA',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Senior Flutter Developer',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 16),
            Divider(thickness: 1.0),
            SizedBox(height: 16),
            InfoSection(
              icon: Icons.email,
              text: 'ahmedsaeedrashad.com',
            ),
            InfoSection(
              icon: Icons.phone,
              text: '+20 11 51 48 32 98',
            ),
            InfoSection(
              icon: Icons.location_city,
              text: 'Cairo',
            ),
            SizedBox(height: 16),
            Divider(thickness: 1.0),
            SizedBox(height: 16),
            SectionTitle(title: 'About Me'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Experienced developer with a demonstrated history of working in the mobile app development industry. Skilled in Flutter, Dart, and cross-platform solutions.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Skills'),
            SkillChip(skill: 'Flutter'),
            SkillChip(skill: 'Dart'),
            SkillChip(skill: 'JavaScript'),
            SkillChip(skill: 'Firebase'),
            SkillChip(skill: 'Git'),
          ],
        ),
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoSection({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.blue, size: 28),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;

  const SkillChip({
    Key? key,
    required this.skill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Chip(
        label: Text(skill),
        backgroundColor: Colors.blue.shade100,
      ),
    );
  }
}
