import 'package:doctorwhy/features/presentation/models/chat_message.dart';
import 'package:doctorwhy/features/presentation/symptomresultdetail/symptom_result_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/home/home_screen.dart';
import '../presentation/settings/settings_screen.dart';
import '../presentation/symptomInput/symptom_input_screen.dart';
import '../presentation/symptomResult/symptom_result_screen.dart';

// 네비게이션을 위한 글로벌 키 (ShellRoute에 필요)
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

// --- GoRouter 설정을 위한 클래스 ---
class AppRouter {
  // GoRouter 인스턴스를 private static final로 선언
  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: HomeScreen.routePath,
    // HomeScreen에 정의된 경로 사용
    debugLogDiagnostics: true,

    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MainAppShell(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: HomeScreen.routePath,
            name: HomeScreen.routeName,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen(); // HomeScreen 위젯 반환
            },
          ),
          GoRoute(
            path: SymptomInputScreen.routePath,
            name: SymptomInputScreen.routeName,
            builder: (BuildContext context, GoRouterState state) {
              final questionIndex =
                  int.tryParse(state.pathParameters['questionIndex'] ?? '0') ??
                  0;
              final previousMessages = state.extra as List<ChatMessage>? ?? [];
              return SymptomInputScreen(
                key: ValueKey('SymptomInputScreen_$questionIndex'),
                // 각 화면을 구별하기 위한 Key
                currentQuestionIndexFromRoute: questionIndex,
                initialMessages: previousMessages,
              );
            },
          ),
          GoRoute(
            path: SymptomResultScreen.routePath,
            name: SymptomResultScreen.routeName,
            builder: (BuildContext context, GoRouterState state) {
              return const SymptomResultScreen(); // HomeScreen 위젯 반환
            },
          ),
          GoRoute(
            path: SymptomResultDetailScreen.routePath,
            name: SymptomResultDetailScreen.routeName,
            builder: (BuildContext context, GoRouterState state) {
              return const SymptomResultDetailScreen();
            },
          ),
          GoRoute(
            path: SettingsScreen.routePath,
            name: SettingsScreen.routeName,
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsScreen();
            },
          ),

          // GoRoute(
          //   path: ProfileScreen.routePath, // ProfileScreen.dart에 정의된 경로
          //   name: ProfileScreen.routeName,   // ProfileScreen.dart에 정의된 이름
          //   builder: (context, state) => const ProfileScreen(),
          // ),
        ],
      ),
    ],

    errorBuilder:
        (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Page Not Found')),
          body: Center(
            child: Text(
              'Error: ${state.error?.message ?? 'No route defined for ${state.uri.path}'}',
            ),
          ),
        ),
  );

  // 생성된 GoRouter 인스턴스에 접근하기 위한 getter
  static GoRouter get router => _router;
}

class MainAppShell extends StatelessWidget {
  final Widget child;

  const MainAppShell({required this.child, super.key});

  static const List<String> _routesWithoutAppBar = [
    SymptomResultDetailScreen.routePath,
    // 다른 AppBar 없는 화면 경로 추가
  ];

  @override
  Widget build(BuildContext context) {
    // 현재 라우트 정보를 가져와서 AppBar 타이틀 등에 활용 가능
    // final String currentLocation = GoRouter.of(context).location;
    // String appBarTitle = _getTitleForRoute(currentLocation);

    final GoRouterState state = GoRouterState.of(context);
    final String? currentPath = state.matchedLocation;

    final bool shouldHideAppBar =
        currentPath != null && _routesWithoutAppBar.contains(currentPath);

    return child;
  }
}
