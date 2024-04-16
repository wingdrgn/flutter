import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:flutter_learn/basic.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_learn/common/theme.dart';
import 'package:flutter_learn/models/cart.dart';
import 'package:flutter_learn/models/catelog.dart';
import 'package:flutter_learn/screens/login.dart';
import 'package:flutter_learn/screens/cart.dart';
import 'package:flutter_learn/screens/catelog.dart';
import 'package:window_size/window_size.dart';

const double windowWidth = 400;
const double windowHeight = 800;

void main() {
  setupWindow();
  runApp(const MyApp());
}

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Provider Demo');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

GoRouter router() {
  return GoRouter(initialLocation: '/login', routes: [
    GoRoute(path: '/login', builder: (context, state) => const MyLogin()),
    GoRoute(path: '/catelog', builder: (context, state) => const MyCatelog(),routes: [GoRoute(path: 'cart', builder: (context, state) => const MyCart())]
    )
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatelogModel()),
        ChangeNotifierProxyProvider<CatelogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catelog, cart) {
              if (cart == null) throw ArgumentError.notNull('cart');
              cart.catelog = catelog;
              return cart;
            })
      ],
      child: MaterialApp.router(
        title: 'Provider Demo',
        theme: appTheme,
        routerConfig: router(),
      ),
    );
  }
}
