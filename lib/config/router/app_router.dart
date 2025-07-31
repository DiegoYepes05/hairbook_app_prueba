import 'package:go_router/go_router.dart';
import 'package:hairbook_app/features/home/presentation/screens/home_detail_screen.dart';
import 'package:hairbook_app/features/home/presentation/screens/home_screen.dart';

final approuter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'home_detail/:id',
          builder: (context, state) {
            final salonId = state.pathParameters['id'] ?? 'no-id';
            return HomeDetailScreen(salonId: salonId);
          },
        ),
      ],
    ),
  ],
);
