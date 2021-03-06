
import 'package:fluttour/pages/collection_grid/p_collection_grid.dart';
import 'package:fluttour/pages/home/p_home.dart';
import 'package:flutter/material.dart';
import 'package:fluttour/pages/layout_state/p_layout_state.dart';
import 'package:fluttour/pages/tickets/p_tickets.dart';
import 'package:provider/provider.dart';

class AppRoute {
  static final AppRoute _shared = AppRoute._private();
  AppRoute._private();

  /// Singleton
  factory AppRoute() => _shared;

  static AppRoute get I => _shared;

  ///#region ROUTE NAMES
  /// -----------------
  static const String routeRoot = '/';
  static const String routeHome = '/home';
  static const String routeLogin = '/login';
  static const String routeCounter = '/counter';
  static const String routeLayoutState = '/layout_state';
  static const String routeCollectionGrid = '/collection_grid';
  static const String routeFetchData = '/fetch_data';

  ///#endregion

  /// App route observer
  final RouteObserver<Route<dynamic>> routeObserver = RouteObserver<Route<dynamic>>();

  /// App global navigator key
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Get app context
  BuildContext get appContext => navigatorKey.currentContext;

  /// Generate route for app here
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case routeLayoutState:
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (_) => PLayoutState()
        );
      case routeCollectionGrid:
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (_) => PCollectionGrid()
        );
      case routeFetchData:
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (_) => PTickets()
        );
      case routeRoot:
      case routeHome:
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (_) => const HomePage()
        );
      default:
        return null;
    }
  }
}

extension AppRouteExt on BuildContext {
  AppRoute route() {
    return Provider.of<AppRoute>(this, listen: false);
  }

  NavigatorState navigator() {
    return route().navigatorKey.currentState;
  }
}
