import 'package:flutter/material.dart';
import 'package:flutter_learn/repositories/crypto_coins/models/crypto_coin.dart';
//import 'package:flutter_svg/svg.dart';

class CryptoCoinTile extends StatelessWidget { 
  const CryptoCoinTile({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
        return ListTile(// обычный список в колонке
        leading: Image.network(coin.imageUrl), // загрузка из API или из статики SvgPicture.asset('assets/svg/btc_logo.svg', height: 30, width: 30),
        title: Text(
          coin.name,
          style: Theme.of(context).textTheme.bodyMedium, //тащим стиль из темы
        ),
        subtitle: Text(
          '${coin.priceInUSD}\$',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.of(context).pushNamed(
            '/coin',
            arguments: coin
          );
        },
    );
  }
}