import 'package:flutter/material.dart';
import 'package:store_demo_app/navigation/routes_key.dart';
import 'package:store_demo_app/screens/profile/user_data.dart';
import 'package:store_demo_app/utils/prefrences/prefrences.dart';

class ProfileScreen extends StatelessWidget {
  final UserDetails userDetails;

  const ProfileScreen({
    super.key,
    required this.userDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(context, Routes.editProfile,
                  arguments: userDetails);
              // Handle profile edit action
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage:
                    NetworkImage(userDetails.profileImageUrl ?? ""),
                radius: 60,
              ),
              const SizedBox(height: 16),
              Text(
                userDetails.username ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              Text(
                userDetails.email ?? "",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        AppPreference().clearSharedPreferences();
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                      child: const Text('Logout'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  final UserDetails userDetails;

  const EditProfileScreen({
    super.key,
    required this.userDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(userDetails.profileImageUrl ?? ""),
              radius: 60,
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: userDetails.username,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: userDetails.email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Save Changes'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
