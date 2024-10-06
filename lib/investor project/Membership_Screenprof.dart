import 'package:flutter/material.dart';

class MemberProfileScreen extends StatefulWidget {
  @override
  _MemberProfileScreenState createState() => _MemberProfileScreenState();
}

class _MemberProfileScreenState extends State<MemberProfileScreen> {
  // Mock user data (replace with actual data)
  String _name = 'John Doe';
  String _email = 'john@example.com';
  String _phone = '123-456-7890';
  String _investmentPreference = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display user's details
            Text(
              'User Details:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Name: $_name'),
            Text('Email: $_email'),
            Text('Phone: $_phone'),
            SizedBox(height: 20),
            // Display user's investment preference
            Text(
              'Investment Preference:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('$_investmentPreference'),
            SizedBox(height: 20),
            // Button to edit profile details
            ElevatedButton(
              onPressed: () {
                // Navigate to the profile edit screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileEditScreen()),
                );
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 20),
            // Section for confirming investment commitment
            Text(
              'Confirm Investment Commitment:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Please confirm your investment commitment here.'),
            // Add your confirmation UI elements here
          ],
        ),
      ),
    );
  }
}

class ProfileEditScreen extends StatefulWidget {
  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  // TextEditingController for the input fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String _investmentPreference = 'Option 1';
  
  set _phone(String _phone) {}
  
  set _email(String _email) {}
  
  set _name(String _name) {} // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input field for name
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            // Input field for email
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            // Input field for phone number
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 10),
            // Dropdown button for investment preferences
            DropdownButtonFormField(
              value: _investmentPreference,
              items: ['Option 1', 'Option 2', 'Option 3']
                  .map((preference) {
                return DropdownMenuItem(
                  value: preference,
                  child: Text(preference),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _investmentPreference = value.toString();
                });
              },
              decoration: InputDecoration(labelText: 'Investment Preference'),
            ),
            SizedBox(height: 20),
            // Button to save changes
            ElevatedButton(
              onPressed: () {
                // Save the changes
                _saveChanges();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to save changes
  void _saveChanges() {
    // Get the updated values from the input fields
    String name = _nameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String investmentPreference = _investmentPreference;

    // Update the user's details and preferences (mock implementation)
    setState(() {
      _name = name;
      _email = email;
      _phone = phone;
      _investmentPreference = investmentPreference;
    });

    // Navigate back to the profile screen
    Navigator.pop(context);
  }
}
