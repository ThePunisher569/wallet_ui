import 'package:flutter/material.dart';

import 'models.dart';

const gapH = SizedBox(width: 16);

const gapV = SizedBox(height: 16);

const bgColor = Color(0xff0C0B10);

///32
const borderRadius = 32.0;

const headerBgColor = Color(0xFF080808);

const bitcoinColor = Color(0xffE6B75A);
const ethereumColor = Colors.green;
const nexoColor = Colors.red;

const cardBgColor = Color(0xff16161E);

final bitcoinCardGradientColors = [
  bitcoinColor,
  cardBgColor,
];

final ethereumCardGradientColors = [
  ethereumColor,
  cardBgColor,
];

final nCoinCardGradientColors = [
  nexoColor,
  cardBgColor,
];

const hamburgerMenuIcon = Icon(
  Icons.more_vert_outlined,
);

final List<Coin> coinListWeekly = [
  Coin(89.02, 0.15, '768,08'),
  Coin(94.02, 0.18, '126,12'),
  Coin(92.06, 0.22, '252,56'),
  Coin(95.20, 0.26, '176,32'),
  Coin(95.30, 0.31, '226,64'),
  Coin(92.01, 0.35, '2326,56'),
  Coin(97.34, 0.53, '2245,00'),
];

final weeklyChartData = <ChartSampleData>[
  ChartSampleData(x: 'Mon', y: 240),
  ChartSampleData(x: 'Tue', y: 560),
  ChartSampleData(x: 'Wed', y: 640),
  ChartSampleData(x: 'Thu', y: 280),
  ChartSampleData(x: 'Fri', y: 380),
  ChartSampleData(x: 'Sat', y: 460),
  ChartSampleData(x: 'Sun', y: 720),
];

final monthlyCharData = [
  ChartSampleData(x: '1', y: 240),
  ChartSampleData(x: '2', y: 560),
  ChartSampleData(x: '3', y: 640),
  ChartSampleData(x: '4', y: 280),
  ChartSampleData(x: '5', y: 380),
  ChartSampleData(x: '6', y: 460),
  ChartSampleData(x: '7', y: 720),
  ChartSampleData(x: '8', y: 740),
  ChartSampleData(x: '9', y: 660),
  ChartSampleData(x: '10', y: 640),
  ChartSampleData(x: '11', y: 220),
  ChartSampleData(x: '12', y: 750),
  ChartSampleData(x: '13', y: 456),
  ChartSampleData(x: '14', y: 720),
  ChartSampleData(x: '15', y: 230),
  ChartSampleData(x: '16', y: 760),
  ChartSampleData(x: '17', y: 240),
  ChartSampleData(x: '18', y: 280),
  ChartSampleData(x: '19', y: 310),
  ChartSampleData(x: '20', y: 460),
  ChartSampleData(x: '21', y: 320),
  ChartSampleData(x: '22', y: 340),
  ChartSampleData(x: '23', y: 360),
  ChartSampleData(x: '24', y: 520),
  ChartSampleData(x: '25', y: 430),
  ChartSampleData(x: '26', y: 340),
  ChartSampleData(x: '27', y: 460),
  ChartSampleData(x: '28', y: 720),
  ChartSampleData(x: '29', y: 380),
  ChartSampleData(x: '30', y: 670),
  ChartSampleData(x: '31', y: 720),
];

final yearlyChartData = [
  ChartSampleData(x: 'Jan', y: 240),
  ChartSampleData(x: 'Feb', y: 560),
  ChartSampleData(x: 'Mar', y: 640),
  ChartSampleData(x: 'Apr', y: 280),
  ChartSampleData(x: 'May', y: 384),
  ChartSampleData(x: 'Jun', y: 454),
  ChartSampleData(x: 'Jul', y: 643),
  ChartSampleData(x: 'Aug', y: 267),
  ChartSampleData(x: 'Sep', y: 546),
  ChartSampleData(x: 'Oct', y: 644),
  ChartSampleData(x: 'Nov', y: 286),
  ChartSampleData(x: 'Dec', y: 860),
];

final chartDataList = [
  weeklyChartData,
  monthlyCharData,
  yearlyChartData,
];

final List<OutlinedButton> appBarActionsListMobile = [
  OutlinedButton.icon(
    onPressed: () {},
    icon: const Icon(Icons.notifications_outlined),
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade900),
      alignment: Alignment.center,
      elevation: const MaterialStatePropertyAll(8),
      padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
      foregroundColor: const MaterialStatePropertyAll(ethereumColor),
      iconColor: const MaterialStatePropertyAll(ethereumColor),
    ),
    label: const Text('Notifications'),
  ),
  OutlinedButton.icon(
    onPressed: () {},
    icon: const Icon(Icons.message_outlined),
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade900),
      alignment: Alignment.center,
      elevation: const MaterialStatePropertyAll(8),
      padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
    ),
    label: const Text('Messages'),
  ),
  OutlinedButton.icon(
    onPressed: () {},
    icon: const Icon(Icons.card_giftcard_outlined),
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade900),
      alignment: Alignment.center,
      elevation: const MaterialStatePropertyAll(8),
      padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
    ),
    label: const Text('Gifts'),
  ),
  OutlinedButton.icon(
    onPressed: () {},
    icon: const Icon(Icons.settings_outlined),
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade900),
      alignment: Alignment.center,
      elevation: const MaterialStatePropertyAll(8),
      padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
    ),
    label: const Text('Settings'),
  ),
];

final List<Widget> appBarActionsListDesktop = [
  IconButton(
    onPressed: () {},
    icon: const Icon(Icons.notifications_outlined),
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade900),
      alignment: Alignment.center,
      elevation: const MaterialStatePropertyAll(8),
      padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
    ),
  ),
  gapH,
  IconButton(
    onPressed: () {},
    icon: const Icon(Icons.message_outlined),
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade900),
      alignment: Alignment.center,
      elevation: const MaterialStatePropertyAll(8),
      padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
    ),
  ),
  gapH,
  IconButton(
    onPressed: () {},
    icon: const Icon(Icons.card_giftcard_outlined),
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade900),
      alignment: Alignment.center,
      elevation: const MaterialStatePropertyAll(8),
      padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
    ),
  ),
  gapH,
  IconButton(
    onPressed: () {},
    icon: const Icon(Icons.settings_outlined),
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade900),
      alignment: Alignment.center,
      elevation: const MaterialStatePropertyAll(8),
      padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
    ),
  ),
  gapH,
];
