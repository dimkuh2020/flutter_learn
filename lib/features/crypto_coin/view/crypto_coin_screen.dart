import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  //!!!!метод для получения аргументов в роутах!!!!
  @override                                     
  void didChangeDependencies() {              
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
                //или
    /*if (args == null) {        //если не 0
      log('You must provide args');
      return;      
    }
    if (args is !String) {   // если не строка
      log('You must provide String args');
      return;
    }*/

    coinName = args as String;
    setState(() {});

    super.didChangeDependencies();
  }  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'), // аргумент в child
      ),
    );
  }
}