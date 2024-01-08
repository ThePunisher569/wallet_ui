import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:wallet_ui/providers.dart';

import 'constants.dart';

class WalletNavigationRail extends StatefulWidget {
  const WalletNavigationRail({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  State<WalletNavigationRail> createState() => _WalletNavigationRailState();
}

class _WalletNavigationRailState extends State<WalletNavigationRail> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: IntrinsicHeight(
          child: Consumer<WalletNavigationState>(
            builder: (BuildContext context, WalletNavigationState state,
                Widget? child) {
              return TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 1.0),
                curve: Curves.linear,
                duration: const Duration(milliseconds: 500),
                builder: (BuildContext context, Object? value, Widget? child) =>
                    child!,
                child: NavigationRail(
                  selectedIndex: 0,
                  extended: state.isExpanded,
                  elevation: 8,
                  backgroundColor: cardBgColor,
                  useIndicator: true,
                  indicatorColor: Colors.transparent,
                  labelType: NavigationRailLabelType.none,
                  indicatorShape: const Border(
                    left: BorderSide(
                      width: 4,
                      color: Color(0xff01C2A9),
                    ),
                  ),
                  unselectedIconTheme: const IconThemeData(
                    color: Colors.white,
                    weight: 300,
                    size: 32,
                  ),
                  unselectedLabelTextStyle:
                      widget.theme.textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                  ),
                  selectedLabelTextStyle:
                      widget.theme.textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                  ),
                  selectedIconTheme: const IconThemeData(
                    color: Colors.white,
                    weight: 300,
                    size: 32,
                  ),
                  leading: Column(
                    children: [
                      gapV,
                      if (state.isExpanded) ...[
                        Text(
                          'Wallet',
                          style: widget.theme.textTheme.headlineLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                      RandomAvatar(
                        'd613c54a0d3c90e307',
                        width: state.isExpanded ? 96 : 64,
                        height: state.isExpanded ? 96 : 64,
                      ),
                      if (state.isExpanded) ...[
                        gapV,
                        Text(
                          'Aatif',
                          style: widget.theme.textTheme.titleLarge,
                        ),
                        Text(
                          'Flutter Developer',
                          style: widget.theme.textTheme.labelLarge
                              ?.copyWith(color: Colors.white38),
                        ),
                      ],
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.speed_outlined,
                        weight: 300,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 4),
                      label: Text('Dashboard'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.wallet_outlined,
                        weight: 300,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 4),
                      label: Text('My Wallet'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.payments_outlined,
                        weight: 300,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 4),
                      label: Text('Transactions'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.paid_outlined,
                        weight: 300,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 4),
                      label: Text('Crypto'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.swap_horizontal_circle_outlined,
                        weight: 300,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 4),
                      label: Text('Exchange'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.settings_outlined,
                        weight: 300,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 4),
                      label: Text('Settings'),
                    ),
                  ],
                  trailing: !state.isExpanded
                      ? Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 48.0),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Icon(
                                    Icons.history,
                                    size: 48,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<WalletNavigationState>()
                                        .toggle();
                                  },
                                  icon: context
                                          .read<WalletNavigationState>()
                                          .isExpanded
                                      ? const Icon(
                                          Icons.keyboard_arrow_left_rounded,
                                        )
                                      : const Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                        ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.grey.shade900),
                                    alignment: Alignment.center,
                                    elevation:
                                        const MaterialStatePropertyAll(8),
                                    padding: const MaterialStatePropertyAll(
                                        EdgeInsets.all(10)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 28,
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(26),
                                    width: MediaQuery.of(context).size.width *
                                        0.16,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(borderRadius),
                                      gradient: const LinearGradient(
                                        colors: [
                                          cardBgColor,
                                          Color(0xff1b2e33),
                                          ethereumColor
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.4, 0.8, 1],
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.history,
                                              size: 54,
                                            ),
                                            hamburgerMenuIcon,
                                          ],
                                        ),
                                        Text(
                                          'History available',
                                          style: widget
                                              .theme.textTheme.titleMedium,
                                        ),
                                        gapV,
                                        Text(
                                          'Check your weekly\ntransaction reports',
                                          style: widget
                                              .theme.textTheme.labelMedium
                                              ?.copyWith(
                                            color: Colors.white60,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      onPressed: () {
                                        context
                                            .read<WalletNavigationState>()
                                            .toggle();
                                      },
                                      icon: context
                                              .read<WalletNavigationState>()
                                              .isExpanded
                                          ? const Icon(
                                              Icons.keyboard_arrow_left_rounded,
                                            )
                                          : const Icon(
                                              Icons
                                                  .keyboard_arrow_right_rounded,
                                            ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                          Colors.grey.shade900,
                                        ),
                                        alignment: Alignment.center,
                                        elevation:
                                            const MaterialStatePropertyAll(8),
                                        padding: const MaterialStatePropertyAll(
                                          EdgeInsets.all(10),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
