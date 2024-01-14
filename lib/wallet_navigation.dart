import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
  double elevation = 0;

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
                  leading: state.isExpanded
                      ? MouseRegion(
                          onHover: (event) => setState(() {
                            elevation = 48;
                          }),
                          onExit: (event) => setState(() {
                            elevation = 0;
                          }),
                          child: Material(
                            elevation: elevation,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                            shadowColor: elevation == 48 ? ethereumColor : null,
                            color:
                                elevation == 48 ? ethereumColor.shade900 : null,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 64,
                              ),
                              child: Column(
                                children: [
                                  gapV,
                                  Text(
                                    'Wallet',
                                    style: widget.theme.textTheme.headlineLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  RandomAvatar(
                                    'd613c54a0d3c90e307',
                                    width: state.isExpanded ? 96 : 64,
                                    height: state.isExpanded ? 96 : 64,
                                  ),
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
                                  const SizedBox(
                                    height: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 16.0,
                          ),
                          child: RandomAvatar(
                            'd613c54a0d3c90e307',
                            width: state.isExpanded ? 96 : 64,
                            height: state.isExpanded ? 96 : 64,
                          ),
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
                  trailing: state.isExpanded
                      ? const TrailingWidgetExpanded()
                      : const TrailingWidgetCollapsed(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class TrailingWidgetCollapsed extends StatelessWidget {
  const TrailingWidgetCollapsed({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {
                context.read<WalletNavigationState>().toggle();
              },
              icon: const Icon(
                Icons.keyboard_arrow_right_rounded,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey.shade900),
                alignment: Alignment.center,
                elevation: const MaterialStatePropertyAll(8),
                padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TrailingWidgetExpanded extends StatelessWidget {
  const TrailingWidgetExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var deviceType = getDeviceType(MediaQuery.sizeOf(context));

    return Expanded(
      child: deviceType == DeviceScreenType.desktop ||
              deviceType == DeviceScreenType.tablet
          ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 28,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(26),
                      width: MediaQuery.of(context).size.width * 0.16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.history,
                                size: 54,
                              ),
                              hamburgerMenuIcon,
                            ],
                          ),
                          gapV,
                          Text(
                            'History available',
                            style: theme.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Check your weekly\ntransaction reports',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: Colors.white60,
                            ),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<WalletNavigationState>().toggle();
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left_rounded,
                      ),
                      style: const ButtonStyle(
                        alignment: Alignment.centerRight,
                        elevation: MaterialStatePropertyAll(8),
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.all(10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: const LinearGradient(
                  colors: [cardBgColor, Color(0xff1b2e33), ethereumColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.4, 0.8, 1],
                ),
              ),
              child: ListTile(
                dense: false,
                enableFeedback: true,
                enabled: true,
                leading: const Icon(
                  Icons.history,
                  size: 32,
                ),
                title: Text(
                  'History available',
                  style: theme.textTheme.titleSmall,
                ),
                subtitle: Text(
                  'Check your weekly\ntransaction reports',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: Colors.white60,
                  ),
                ),
                trailing: hamburgerMenuIcon,
              ),
            ),
    );
  }
}
