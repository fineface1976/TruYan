 import 'package:flutter/material.dart';  
   import 'package:provider/provider.dart';  
   import 'services/wallet_service.dart';  
   import 'services/tyan_service.dart';  

   void main() => runApp(  
     MultiProvider(  
       providers: [  
         ChangeNotifierProvider(create: (_) => WalletService()),  
         ChangeNotifierProvider(create: (_) => TYANService()),  
       ],  
       child: const TruYanApp(),  
     ),  
   );  

   class TruYanApp extends StatelessWidget {  
     const TruYanApp({super.key});  

     @override  
     Widget build(BuildContext context) {  
       return MaterialApp(  
         home: Scaffold(  
           appBar: AppBar(  
             title: const Text('TruYan'),  
             actions: [  
               IconButton(  
                 icon: const Icon(Icons.wallet),  
                 onPressed: () => Provider.of<WalletService>(context, listen: false).connect(),  
               ),  
             ],  
           ),  
           body: Column(  
             children: [  
               const Text('Post videos, earn TYAN!'),  
               ElevatedButton(  
                 onPressed: () => Provider.of<TYANService>(context, listen: false)  
                     .sendTYAN('0xRecipient', '1000000000000000000'), // 1 TYAN  
                 child: const Text('Send TYAN'),  
               ),  
             ],  
           ),  
         ),  
       );  
     }  
   }  
