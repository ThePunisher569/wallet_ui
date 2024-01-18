import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wallet_ui/sell_order.dart';

import 'constants.dart';
import 'dashboard_widgets.dart';
import 'market_chart.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final isMobile =
        getDeviceType(MediaQuery.sizeOf(context)) == DeviceScreenType.mobile;
    bool isTablet =
        getDeviceType(MediaQuery.sizeOf(context)) == DeviceScreenType.tablet;
    bool isDesktop =
        getDeviceType(MediaQuery.sizeOf(context)) == DeviceScreenType.desktop;

    return Card(
      color: headerBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      elevation: 16,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 16 : 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Dashboard title and filter button
            DashboardHeader(theme: theme),

            const SizedBox(height: 32),

            /// Cards of currency
            ScreenTypeLayout.builder(
              desktop: (p0) => DashboardCurrencyListDesktop(theme: theme),
              mobile: (p0) => DashboardCurrencyListMobile(theme: theme),
              tablet: (p0) => DashboardCurrencyListDesktop(theme: theme),
            ),
            const SizedBox(height: 40),

            /// market overview and sell order
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Market overview title and chart
                  SizedBox(
                    width: isDesktop
                        ? MediaQuery.sizeOf(context).width * 0.42
                        : MediaQuery.sizeOf(context).width * 0.84,
                    child: MarketChart(theme: theme),
                  ),

                  if (isDesktop) const SizedBox(width: 64),
                  // Sell order list view
                  if (isDesktop) SellOrder(theme: theme),
                ],
              ),
            ),
            const SizedBox(height: 40),

            if (isMobile || isTablet) SellOrder(theme: theme),

            const SizedBox(height: 40),

            Text(
              'Recent Activities',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            /// Recent Activities widget
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecentActivity(
                    theme: theme,
                    icon: Icons.arrow_upward_outlined,
                  ),
                  RecentActivity(
                    theme: theme,
                    icon: Icons.arrow_downward_outlined,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentActivity extends StatefulWidget {
  const RecentActivity({
    super.key,
    required this.theme,
    required this.icon,
  });

  final ThemeData theme;
  final IconData icon;

  @override
  State<RecentActivity> createState() => _RecentActivityState();
}

class _RecentActivityState extends State<RecentActivity> {
  bool showColor=false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() {
        showColor = true;
      }),
      onExit: (event) => setState(() {
        showColor = false;
      }),
      child: Container(
        decoration: BoxDecoration(
          gradient: showColor
              ? LinearGradient(colors: ethereumCardGradientColors)
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(widget.icon),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xff161421)),
                alignment: Alignment.center,
                elevation: MaterialStatePropertyAll(8),
                padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Text(
              'Bitcoin',
              style: widget.theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Text(
              (DateFormat('dd:MM:yyyy')..add_jm()).format(DateTime.now()),
              style: widget.theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w200,
                color: Colors.white54,
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Text(
              '+1545.00',
              style: widget.theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w200,
                color: Colors.white54,
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Text(
              'Completed',
              style: widget.theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w200,
                color: Colors.white54,
              ),
            ),
            const SizedBox(
              width: 32,
            ),
          ],
        ),
      ),
    );
  }
}

class WalletAppBar extends StatelessWidget {
  const WalletAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      forceMaterialTransparency: true,
      actionsIconTheme: const IconThemeData(weight: 50),
      title: SearchBar(
        backgroundColor: const MaterialStatePropertyAll(headerBgColor),
        elevation: const MaterialStatePropertyAll(8),
        hintText: 'Search',
        hintStyle: MaterialStatePropertyAll(theme.textTheme.bodyLarge),
        leading: const Icon(Icons.search_outlined),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16),
        ),
        constraints: const BoxConstraints(
          minWidth: 120,
          maxWidth: 400,
          minHeight: 48,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      actions: [
        ScreenTypeLayout.builder(
          desktop: (p0) => Row(
            children: appBarActionsListDesktop,
          ),
          mobile: (p0) => PopupMenuButton<OutlinedButton>(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context) => List<PopupMenuItem<OutlinedButton>>.from(
              appBarActionsListMobile.map(
                (e) => PopupMenuItem<OutlinedButton>(
                  value: e,
                  padding: const EdgeInsets.all(8),
                  child: e,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            position: PopupMenuPosition.under,
            enableFeedback: true,
            initialValue: appBarActionsListMobile[0],
            child: const Icon(Icons.more_vert_rounded),
          ),
        ),
      ],
    );
  }
}
