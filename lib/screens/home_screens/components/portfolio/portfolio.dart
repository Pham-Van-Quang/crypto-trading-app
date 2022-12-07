import 'package:crypto_trading_app/mocks/mock_portfolio.dart';
import 'package:flutter/material.dart';

import 'portfolio_item.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text('My Portfolio',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 160,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => SizedBox(width: 24),
            itemCount: MockPortfolio.data.length,
            itemBuilder: (_, index) => PortfolioItem(
              currency: MockPortfolio.data[index],
            ),
          ),
        )
      ],
    );
  }
}