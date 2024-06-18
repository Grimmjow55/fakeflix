import 'package:fakeflix/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:fakeflix/movies_master_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MoviesMasterScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'detail',
          builder: (BuildContext context, GoRouterState state) {
            return const MovieDetailsScreen(movieId: 0);
          },
        ),
      ],
    ),
  ],
);

class FakeflixApp extends StatelessWidget {
  const FakeflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Fakeflix',
      theme: ThemeData.dark()
    );
  }
}