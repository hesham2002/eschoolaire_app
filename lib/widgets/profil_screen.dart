
import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/screens/login_page.dart';
import 'package:flutter/material.dart';



class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: kPrimaryColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileCard(
              title: 'Personal Information',
              items: [
                ProfileItem(label: 'Name', value: 'John Doe'),
                ProfileItem(label: 'Email', value: 'john.doe@example.com'),
              ],
            ),
            SizedBox(height: 20),
            LanguageCard(),
            SizedBox(height: 20),
            LogoutCard(),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String title;
  final List<ProfileItem> items;

  const ProfileCard({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSecondaryColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: items,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String label;
  final String value;

  const ProfileItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: kSecondaryColor,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Language',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            LanguageDropdown(),
          ],
        ),
      ),
    );
  }
}

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedLanguage,
      onChanged: (String? newValue) {
        setState(() {
          _selectedLanguage = newValue!;
        });
      },
      items: <String>['English', 'العربية']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class LogoutCard extends StatelessWidget {
  const LogoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
            
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                     
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

