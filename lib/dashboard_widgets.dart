import 'dart:ui';

import 'package:cryptofont/cryptofont.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (getDeviceType(MediaQuery.sizeOf(context)) ==
            DeviceScreenType.mobile)
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined),
            color: Colors.white,
          ),
        if (getDeviceType(MediaQuery.sizeOf(context)) !=
            DeviceScreenType.mobile)
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

class DashboardCurrencyListDesktop extends StatelessWidget {
  const DashboardCurrencyListDesktop({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CurrencyCard(
            lgColors: bitcoinCardGradientColors,
            icon: CryptoFontIcons.btc,
            percent: '45',
            price: '675,83',
            theme: theme,
            iconBgColor: bitcoinColor,
            shadowColor: Color.alphaBlend(bitcoinColor, nexoColor),
            bgColorTransformed: Colors.cyan.shade900,
          ),
          const SizedBox(width: 40),
          CurrencyCard(
            lgColors: ethereumCardGradientColors,
            icon: CryptoFontIcons.eth,
            percent: '35',
            price: '203,40',
            theme: theme,
            iconBgColor: ethereumColor,
            showChart: false,
            shadowColor: Color.alphaBlend(ethereumColor, bitcoinColor),
            bgColorTransformed: Colors.blue.shade900,
          ),
          const SizedBox(width: 40),
          CurrencyCard(
            lgColors: nCoinCardGradientColors,
            icon: CryptoFontIcons.nexo,
            percent: '57',
            price: '592,13',
            theme: theme,
            iconBgColor: nexoColor,
            shadowColor: Color.alphaBlend(nexoColor, ethereumColor),
            bgColorTransformed: Colors.deepPurple.shade900,
          ),
        ],
      ),
    );
  }
}

class DashboardCurrencyListMobile extends StatelessWidget {
  const DashboardCurrencyListMobile({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CurrencyCard(
          lgColors: bitcoinCardGradientColors,
          icon: CryptoFontIcons.btc,
          percent: '45',
          price: '1200',
          theme: theme,
          iconBgColor: bitcoinColor,
          shadowColor: Color.alphaBlend(bitcoinColor, nexoColor),
          bgColorTransformed: Colors.cyan,
        ),
        const SizedBox(height: 24),
        CurrencyCard(
          lgColors: ethereumCardGradientColors,
          icon: CryptoFontIcons.eth,
          percent: '35',
          price: '232,40',
          theme: theme,
          iconBgColor: ethereumColor,
          showChart: false,
          shadowColor: Color.alphaBlend(ethereumColor, bitcoinColor),
          bgColorTransformed: Colors.blue.shade900,
        ),
        const SizedBox(height: 24),
        CurrencyCard(
          lgColors: nCoinCardGradientColors,
          icon: CryptoFontIcons.nexo,
          percent: '35',
          price: '232,40',
          theme: theme,
          iconBgColor: nexoColor,
          shadowColor: Color.alphaBlend(nexoColor, ethereumColor),
          bgColorTransformed: Colors.deepPurple.shade900,
        ),
      ],
    );
  }
}

class CurrencyCard extends StatefulWidget {
  final Color iconBgColor, shadowColor, bgColorTransformed;

  const CurrencyCard({
    super.key,
    required this.lgColors,
    required this.iconBgColor,
    required this.icon,
    required this.percent,
    required this.price,
    required this.theme,
    required this.shadowColor,
    required this.bgColorTransformed,
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
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        angle = 0.1;
        elevation = 48;
      });
    });
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        elevation = 16;
        angle = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile =
        getDeviceType(MediaQuery.sizeOf(context)) == DeviceScreenType.mobile;

    bool isTablet =
        getDeviceType(MediaQuery.sizeOf(context)) == DeviceScreenType.tablet;

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
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        alignment: Alignment.center,
        curve: Curves.easeInToLinear,
        child: Card(
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          shadowColor: widget.shadowColor,
          color: widget.bgColorTransformed,
          child: Transform(
            transform: Matrix4.rotationZ(angle),
            filterQuality: FilterQuality.high,
            alignment: Alignment.bottomLeft,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: SweepGradient(
                  colors: widget.lgColors,
                  center: Alignment.topRight,
                  stops: const [0.2, 0.3],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// blur effect on top of card wherever mouse goes
                  if (elevation == 48)
                    Positioned(
                      left: position.dx,
                      top: position.dy,
                      child: kIsWeb
                          ? BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10,
                                sigmaY: 10,
                              ),
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
                            )
                          : Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: widget.iconBgColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                    ),

                  /// Card rest of the contents
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: widget.iconBgColor,
                              ),
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.center,
                              child: Icon(
                                widget.icon,
                                size: 54,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 40),
                            RichText(
                              text: TextSpan(
                                text: '\$${widget.price}\n',
                                style: widget.theme.textTheme.displaySmall
                                    ?.copyWith(
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
                          ],
                        ),
                        SizedBox(width: isMobile ? 48 : 96),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Align(
                                alignment: Alignment.topRight,
                                child: hamburgerMenuIcon),
                            const SizedBox(height: 40),
                            widget.showChart
                                ? Icon(
                                    Icons.show_chart_outlined,
                                    size: 54,
                                    color: widget.iconBgColor,
                                  )
                                : SizedBox(
                                    width: isTablet ? 48 : 54,
                                    height: isTablet ? 48 : 54,
                                  )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
