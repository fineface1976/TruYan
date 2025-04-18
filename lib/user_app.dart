 // Inside TruYanApp build method
ElevatedButton(
  onPressed: () => _showReferralDialog(context),
  child: const Text('Enter Referral Code'),
),

// Add this function
void _showReferralDialog(BuildContext context) {
  TextEditingController codeController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Enter Referral Code'),
      content: TextField(controller: codeController),
      actions: [
        TextButton(
          onPressed: () {
            if (codeController.text.isNotEmpty) {
              // Call smart contract to set referrer
              Provider.of<TYANService>(context, listen: false)
                  .setReferrer(codeController.text);
            }
            Navigator.pop(context);
          },
          child: const Text('Submit'),
        ),
      ],
    ),
  );
}
