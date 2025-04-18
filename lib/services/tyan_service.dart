import 'package:web3dart/web3dart.dart';  
     import 'package:walletconnect_dart/walletconnect_dart.dart';  

     class TYANService {  
       final String bscNode = 'https://bsc-dataseed.binance.org/';  
       final String contractAddress = '0x...'; // Replace later  

       Future<String> sendTYAN(WalletConnect connector, String recipient, String amount) async {  
         final client = Web3Client(bscNode, Client());  
         final credentials = EthPrivateKey.fromHex(connector.session.privateKey);  
         final txHash = await client.sendTransaction(  
           credentials,  
           Transaction(  
             to: EthereumAddress.fromHex(contractAddress),  
             value: EtherAmount.fromUnitAndValue(EtherUnit.wei, amount),  
           ),  
         );  
         return txHash;  
       }  
     }  
