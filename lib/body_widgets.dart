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
    return Card(
      color: headerBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      elevation: 16,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Dashboard title and filter button
            DashboardHeader(theme: theme),
            gapV,

            /// Cards of currency
            DashboardCurrencyList(theme: theme),
            const SizedBox(height: 40),

            /// market overview and sell order
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Market overview title and chart
                Expanded(flex: 9, child: MarketChart(theme: theme)),

                const SizedBox(width: 64),
                // Sell order list view
                Expanded(
                  flex: 5,
                  child: SellOrder(theme: theme),
                ),
              ],
            ),
            gapV,

            /// Recent Activities widget
            Text(
              'Recent Activities',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 32),

            RecentActivity(
              theme: theme,
              icon: Icons.arrow_upward_outlined,
            ),
            const SizedBox(height: 16),
            RecentActivity(
              theme: theme,
              icon: Icons.arrow_downward_outlined,
            )
          ],
        ),
      ),
    );
  }
}

class RecentActivity extends StatelessWidget {
  const RecentActivity({
    super.key,
    required this.theme,
    required this.icon,
  });

  final ThemeData theme;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(icon),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xff161421)),
              alignment: Alignment.center,
              elevation: MaterialStatePropertyAll(8),
              padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
            ),
          ),
          Text(
            'Bitcoin',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            (DateFormat('dd:MM:yyyy')..add_jm()).format(DateTime.now()),
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w200,
              color: Colors.white54,
            ),
          ),
          Text(
            '+1545.00',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w200,
              color: Colors.white54,
            ),
          ),
          Text(
            'Completed',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w200,
              color: Colors.white54,
            ),
          ),
        ],
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
