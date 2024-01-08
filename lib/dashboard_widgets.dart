import 'dart:ui';

import 'package:cryptofont/cryptofont.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Dashboard',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined),
            label: const Text(
              'Filters',
              textAlign: TextAlign.left,
            ),
            style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(theme.textTheme.labelLarge),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(8),
                ),
              ),
              foregroundColor: const MaterialStatePropertyAll(
                Colors.white,
              ),
              backgroundColor: const MaterialStatePropertyAll(
                Colors.black12,
              ),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.all(16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CurrencyCard extends StatefulWidget {
  final Color iconBgColor, shadowColor;

  const CurrencyCard({
    super.key,
    required this.lgColors,
    required this.iconBgColor,
    required this.icon,
    required this.percent,
    required this.price,
    required this.theme,
    required this.shadowColor,
    this.showChart = true,
  });

  final List<Color> lgColors;
  final IconData icon;

  final String price, percent;
  final ThemeData theme;

  final bool showChart;

  @override
  State<CurrencyCard> createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  double elevation = 16;
  var angle = 0.0;

  var position = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() {
        elevation = 48;
        angle = 0.1;
        position = event.localPosition.translate(-54, -54);
      }),
      onExit: (event) => setState(() {
        elevation = 16;
        angle = 0;
      }),
      child: Transform(
        transform: Matrix4.rotationZ(angle),
        filterQuality: FilterQuality.high,
        alignment: Alignment.bottomLeft,
        child: Card(
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          shadowColor: widget.shadowColor,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  gradient: SweepGradient(
                    colors: widget.lgColors,
                    center: Alignment.topRight,
                    stops: const [0.2, 0.3],
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: widget.iconBgColor,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            widget.icon,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                        hamburgerMenuIcon
                      ],
                    ),
                    gapV,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '\$${widget.price}\n',
                            style:
                                widget.theme.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: '${widget.percent}% This week',
                                style: widget.theme.textTheme.bodyLarge
                                    ?.copyWith(color: Colors.white38),
                              )
                            ],
                          ),
                        ),
                        if (widget.showChart)
                          Padding(
                            padding: const EdgeInsets.only(right: 32.0),
                            child: Icon(
                              Icons.show_chart_outlined,
                              size: 54,
                              color: widget.iconBgColor,
                            ),
                          )
                      ],
                    ),
                  ],
                ),
              ),

              /// blur effect on top of card wherever mouse goes
              if (elevation == 48)
                Positioned(
                  left: position.dx,
                  top: position.dy,
                  child: ImageFiltered(

                    imageFilter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.iconBgColor,
                        shape: BoxShape.circle,
                      ),
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCurrencyList extends StatelessWidget {
  const DashboardCurrencyList({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CurrencyCard(
            lgColors: bitcoinCardGradientColors,
            icon: CryptoFontIcons.btc,
            percent: '45',
            price: '1200',
            theme: theme,
            iconBgColor: bitcoinColor,
            shadowColor: Color.alphaBlend(bitcoinColor, nexoColor),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: CurrencyCard(
            lgColors: ethereumCardGradientColors,
            icon: CryptoFontIcons.eth,
            percent: '35',
            price: '232,40',
            theme: theme,
            iconBgColor: ethereumColor,
            showChart: false,
            shadowColor: Color.alphaBlend(ethereumColor, bitcoinColor),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: CurrencyCard(
            lgColors: nCoinCardGradientColors,
            icon: CryptoFontIcons.nexo,
            percent: '35',
            price: '232,40',
            theme: theme,
            iconBgColor: nexoColor,
            shadowColor: Color.alphaBlend(nexoColor, ethereumColor),
          ),
        ),
      ],
    );
  }
}
