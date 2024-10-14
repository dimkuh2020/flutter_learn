import 'package:dio/dio.dart';
import 'package:flutter_learn/repositories/crypto_coins/models/crypto_coin.dart';
//import 'package:flutter/material.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB&tsyms=USD,EUR');
    /*debugPrint(response.toString());*/
    
    final data = response.data as Map<String, dynamic>; // получ мапу из данных
    final dataRaw = data['RAW'] as Map<String, dynamic>; // data по ключю RAW
    // приводить к CryptoCoin
    final cryptoCoinsList = dataRaw.entries //entries верн список частей словаря
          .map((e) {
             final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
             final price = usdData['PRICE'];
             final imageUrl = usdData['IMAGEURL'];
             return CryptoCoin(
              name: e.key,
              priceInUSD: price,
              imageUrl: 'https://www.cryptocompare.com/$imageUrl',
            );})
          .toList();    
    return cryptoCoinsList;                       
  }
}