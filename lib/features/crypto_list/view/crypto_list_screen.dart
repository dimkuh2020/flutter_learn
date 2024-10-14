import 'package:flutter/material.dart';

import 'package:flutter_learn/features/crypto_list/widgets/widgets.dart';
import 'package:flutter_learn/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter_learn/repositories/crypto_coins/models/crypto_coin.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, //копирует фон который задан в теме
        title: const Center(child: Text('Crypto Currencies List')),
      ),
      body: _cryptoCoinsList == null // если нема списка то пусто иначе список
        ? const Center(child: CircularProgressIndicator()) //виджет загузки
        : ListView.separated(
          padding: const EdgeInsets.only(top: 16),
          itemCount: _cryptoCoinsList!.length, //ограничитель до 15
          separatorBuilder: (context, index) => Divider(
                color: Theme.of(context).dividerColor,
              ),
          itemBuilder: (context, i) {
            final coin = _cryptoCoinsList![i];            
            return CryptoCoinTile(coin: coin);
          } 
      ),
      /*floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () async {
        await _loadCryptoCoins();
      }),*/
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}

