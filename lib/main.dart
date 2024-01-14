import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wallet_ui/providers.dart';
import 'package:wallet_ui/wallet_navigation.dart';

import 'body_widgets.dart';
import 'constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final defaultTextStyle = GoogleFonts.sourceCodePro(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      preferDesktop: true,
      builder: (p0) => MaterialApp(
        title: 'Wallet',
        locale: DevicePreview.locale(context),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: bgColor,
            background: bgColor,
            brightness: Brightness.dark,
          ),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStatePropertyAll(nexoColor.shade100),
          ),
          textTheme: GoogleFonts.aclonicaTextTheme().copyWith(
            headlineLarge: defaultTextStyle,
            headlineMedium: defaultTextStyle,
            headlineSmall: defaultTextStyle,
            displayLarge: defaultTextStyle,
            displayMedium: defaultTextStyle,
            displaySmall: defaultTextStyle,
            titleLarge: defaultTextStyle,
            titleMedium: defaultTextStyle,
            titleSmall: defaultTextStyle,
            bodyLarge: defaultTextStyle,
            bodyMedium: defaultTextStyle,
            bodySmall: defaultTextStyle,
            labelLarge: defaultTextStyle,
            labelMedium: defaultTextStyle,
            labelSmall: defaultTextStyle,
          ),
        ),
        home: ChangeNotifierProvider(
          create: (_) => WalletNavigationState(),
          child: const SafeArea(
            child: MyHomePage(),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    print('width ${MediaQuery.sizeOf(context).width}');
    print('height ${MediaQuery.sizeOf(context).height}');

    final deviceType = getDeviceType(MediaQuery.sizeOf(context));

    print('the device type is ${deviceType.name}');

    return Scaffold(
      drawer: deviceType == DeviceScreenType.mobile ||
              deviceType == DeviceScreenType.tablet
          ? Drawer(
              elevation: 16,
              shadowColor: ethereumColor,
              child: WalletNavigationRail(theme: theme),
            )
          : null,
      body: Row(
        children: [
          // Navigation Rail
          if (deviceType == DeviceScreenType.desktop)
            WalletNavigationRail(theme: theme),

          // Body with appbar and cards
          Expanded(
            flex: 5,
            child: BodyWidget(theme: theme),
          )
        ],
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Column(
        children: [
          const Flexible(flex: 1, child: WalletAppBar()),
          const SizedBox(height: 32),
          Expanded(flex: 16, child: DashboardCard(theme: theme))
        ],
      ),
    );
  }
}
