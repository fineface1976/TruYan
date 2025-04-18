import 'package:walletconnect_dart/walletconnect_dart.dart';  
     import 'package:url_launcher/url_launcher.dart';  

     class WalletService {  
       WalletConnect connector = WalletConnect(  
         bridge: 'https://bridge.walletconnect.org',  
         clientMeta: const PeerMeta(  
           name: 'TruYan',  
           description: 'Social Media on Blockchain',  
           url: 'https://truyan.com',  
           icons: ['https://truyan.com/logo.png'],  
         ),  
       );  

       Future<void> connect() async {  
         if (!connector.connected) {  
           await connector.createSession(  
             chainId: 56, // BSC  
             onDisplayUri: (uri) => launchUrl(Uri.parse(uri)),  
           );  
         }  
       }  
     }  
