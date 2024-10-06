import 'package:flutter/material.dart';

class Investment {
  final String dealName;
  int amount;
  final String status;

  Investment(this.dealName, this.amount, this.status);
}

class InvestmentDetailsScreen extends StatefulWidget {
  final Investment investment;

  InvestmentDetailsScreen({required this.investment});

  @override
  _InvestmentDetailsScreenState createState() => _InvestmentDetailsScreenState();
}

class _InvestmentDetailsScreenState extends State<InvestmentDetailsScreen> {
  // TextEditingController for the updated investment amount
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Deal Name: ${widget.investment.dealName}'),
            SizedBox(height: 10),
            Text('Amount: \$${widget.investment.amount.toString()}'),
            SizedBox(height: 10),
            Text('Status: ${widget.investment.status}'),
            SizedBox(height: 20),
            // Input field for updating the investment amount
            TextFormField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Update Investment Amount'),
            ),
            SizedBox(height: 20),
            // Button to save the updated investment amount
            ElevatedButton(
              onPressed: () {
                // Update the investment amount
                _updateInvestmentAmount();
              },
              child: Text('Update Amount'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to update the investment amount
  void _updateInvestmentAmount() {
    // Get the updated investment amount
    int updatedAmount = int.tryParse(_amountController.text) ?? widget.investment.amount;

    // Update the investment object (mock implementation)
    setState(() {
      widget.investment.amount = updatedAmount;
    });

    // Show a confirmation dialog (optional)
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Investment amount updated successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class MyInvestmentsScreen extends StatefulWidget {
  @override
  _MyInvestmentsScreenState createState() => _MyInvestmentsScreenState();
}

class _MyInvestmentsScreenState extends State<MyInvestmentsScreen> {
  // Mock user's investments data (replace with actual data)
  List<Investment> _investments = [
    Investment('Deal 1', 10000, 'Active'),
    Investment('Deal 2', 15000, 'Pending'),
    Investment('Deal 3', 20000, 'Active'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Investments'),
      ),
      body: ListView.builder(
        itemCount: _investments.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_investments[index].dealName),
            subtitle: Text('Amount: \$${_investments[index].amount.toString()} | Status: ${_investments[index].status}'),
            onTap: () {
              // Navigate to the investment details screen with the selected investment
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InvestmentDetailsScreen(investment: _investments[index])),
              );
            },
          );
        },
      ),
    );
  }
}
