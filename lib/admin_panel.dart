class AdminPanel extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('referrals').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              return ListTile(
                title: Text('User: ${doc['user']}'),
                subtitle: Text('Total Rewards: ${doc['rewards']} TYAN'),
                trailing: Text('Level: ${doc['level']}'),
              );
            },
          );
        },
      ),
    );
  }
}
