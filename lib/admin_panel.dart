// TRUYAN ADMIN PANEL (admin_panel.dart)  
     import 'package:flutter/material.dart';  

     class AdminPanel extends StatelessWidget {  
       @override  
       Widget build(BuildContext context) {  
         return Scaffold(  
           appBar: AppBar(title: const Text('Admin Panel')),  
           body: ListView(  
             children: [  
               ListTile(title: const Text('Manage Users'),  
               ListTile(title: const Text('View Transactions')),  
               ListTile(title: const Text('Moderate Content')),  
             ],  
           ),  
         );  
       }  
     }  
