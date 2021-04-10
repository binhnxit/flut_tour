import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttour/generated/l10n.dart';
import 'package:fluttour/pages/collection_grid/collection_grid_provider.dart';
import 'package:fluttour/pages/home/home_provider.dart';
import 'package:fluttour/pages/layout_state/layout_state_provider.dart';
import 'package:fluttour/pages/tickets/tickets_provider.dart';
import 'package:fluttour/services/api/request/ticket_request.dart';
import 'package:fluttour/services/app/app_dialog.dart';
import 'package:fluttour/services/app/locale_provider.dart';
import 'package:fluttour/utils/app_credential.dart';
import 'package:fluttour/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<void> myMain() async {
  /// Start services later
  WidgetsFlutterBinding.ensureInitialized();

  /// Force portrait mode
  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        Provider<AppRoute>(create: (_) => AppRoute()),
        Provider<AppDialogProvider>(create: (_) => AppDialogProvider()),
        Provider<TicketRequest>(create: (_) => TicketRequest()),
        ChangeNotifierProvider<HomeProvider>(
            create: (_) => HomeProvider()
        ),
        ChangeNotifierProvider<LayoutStateProvider>(
            create: (_) => LayoutStateProvider()
        ),
        ChangeNotifierProvider<CollectionGridProvider>(
            create: (_) => CollectionGridProvider()
        ),
        ChangeNotifierProvider<TicketsProvider>(
            create: (BuildContext context) => TicketsProvider(
              context.read<TicketRequest>()
            )),
        ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider()),
      ],
      child: const MyApp())
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppRoute appRoute = context.watch<AppRoute>();
    final LocaleProvider localeProvider = context.watch<LocaleProvider>();

    return MaterialApp(
      navigatorKey: appRoute.navigatorKey,
      locale: localeProvider.locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.routeRoot,
      onGenerateRoute: appRoute.generateRoute,
      theme: ThemeData(),
      navigatorObservers: <NavigatorObserver>[appRoute.routeObserver],
    );
  }
}
