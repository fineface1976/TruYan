// TRUYAN USER APP (user_app.dart)  
     import 'package:flutter/material.dart';  
     import 'package:walletconnect_dart/walletconnect_dart.dart';  

     void main() => runApp(TruYanApp());  

     class TruYanApp extends StatelessWidget {  
       final WalletConnect connector = WalletConnect(  
         bridge: 'https://bridge.walletconnect.org',  
         clientMeta: const PeerMeta(  
           name: 'TruYan',  
           description: 'Decentralized Social Media',  
           url: 'https://truyan.com',  
           icons: ['https://truyan.com/logo.png'],  
         ),  
       );  

       @override  
       Widget build(BuildContext context) {  
         return MaterialApp(  
           home: Scaffold(  
             appBar: AppBar(  
               title: const Text('TruYan'),  
               actions: [  
                 IconButton(  
                   icon: const Icon(Icons.account_balance_wallet),  
                   onPressed: () async {  
                     if (!connector.connected) {  
                       await connector.createSession(  
                         chainId: 56, // BSC  
                         onDisplayUri: (uri) => print('Connect URI: $uri'),  
                       );  
                     }  
                   },  
                 ),  
               ],  
             ),  
             body: const Center(child: Text('Post, Stream, Earn TYAN!')),  
           ),  
         );  
       }  
     }  
