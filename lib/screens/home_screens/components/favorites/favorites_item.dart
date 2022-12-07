import 'package:crypto_trading_app/models/currency.dart';
import 'package:crypto_trading_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../components/custom_icon.dart';
import '../../../currency_details_screen/currency_details_screen.dart';

class FavoritesItem extends StatelessWidget {
  final Currency currency;
  
  const FavoritesItem({
    required this.currency,
    super.key});

    Widget title() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            currency.code,
            style: const TextStyle(
              fontSize: 20
            ),
          ),
          Text(
            currency.name,
            style: const TextStyle(
              fontSize: 16,
              color: kSecondaryColor,
            ),
          ),
          const SizedBox(height: 4),
          // Row(
          //   children: [
          //     Icon(
          //       currency.priceChange >= 0
          //       ? FontAwesomeIcons.caretUp
          //       : FontAwesomeIcons.caretDown,
          //       size: 10,
          //       color: kSecondaryColor,
          //     )
          //   ],
          // )
        ],
      );
    }

    Widget price() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            currency.currentPriceString,
            style: const TextStyle(
              fontSize: 16
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                currency.priceChange >= 0
                ? FontAwesomeIcons.caretUp
                : FontAwesomeIcons.caretDown,
                size: 16,
                color: kSecondayTextColor,
              ),
            const SizedBox(width: 2),
            Text(
              currency.priceChangeString,
              style: const TextStyle(
                color: kSecondayTextColor
              ),
            )
            ],
          )
        ],
      );
    }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 84,
        color: kPrimaryColor,
        child: Stack(
          children: [
            Padding( 
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                CustomIcon(icon: currency.icon),
                const SizedBox(width: 16),
                title(),
                const Spacer(),
                price(),
                ]
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => 
                  CurrencyDetailsScreen(currency: currency)
                 ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}