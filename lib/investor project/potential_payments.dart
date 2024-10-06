import 'package:flutter/material.dart';

class PotentialInvestmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Potential Investments'),
      ),
      body: ListView(
        children: [
          // Display Fact Sheets of deals here
          ListTile(
            title: Text('Deal 1 Fact Sheet'),
            // Implement actions when a deal is selected
            onTap: () {
              // Handle actions like displaying options or opening a dialog
              // Example: Show options for Discard, Request more information, LOI
              _showOptionsDialog(context);
            },
          ),
          // Add more ListTile widgets for each deal
        ],
      ),
    );
  }

  // Function to show options dialog when a deal is selected
  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deal Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Add buttons for Discard, Request more information, LOI
              ElevatedButton(
                onPressed: () {
                  // Handle Discard action
                  Navigator.of(context).pop();
                },
                child: Text('Discard'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle Request more information action
                  _showInformationRequestDialog(context);
                },
                child: Text('Request more information'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle LOI submission
                  _showLOITemplateDialog(context);
                },
                child: Text('LOI'),
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to show dialog for requesting more information
  void _showInformationRequestDialog(BuildContext context) {
    // Implement dialog UI to request more information
  }

  // Function to show LOI template dialog
  void _showLOITemplateDialog(BuildContext context) {
    // Implement dialog UI for LOI submission
  }
}
