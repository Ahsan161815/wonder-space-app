import 'package:go_router/go_router.dart';
import 'package:wonderspace/screens/apod/apod.dart';
import 'package:wonderspace/screens/home/home.dart';
import 'package:wonderspace/screens/mars_rover/rover.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => HomeScreen(),
        routes: [
          GoRoute(
            path: 'apod',
            name: 'apod',
            builder: (context, state) => ApodScreen(
              title: 'Hello',
            ),
          ),
          GoRoute(
            path: 'rover',
            name: 'rover',
            builder: (context, state) => MarsRoverScreen(
              title: 'Title',
            ),
          ),
        ]),
  ],
);
