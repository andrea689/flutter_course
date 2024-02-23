import 'package:flutter/material.dart';
import 'package:exercise_3/pages/contact_detail_page/contact_detail_page.dart';
import 'package:exercise_3/pages/contacts_page/contacts_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const ContactsPage(),
            routes: [
              GoRoute(
                path: 'details',
                builder: (context, state) => const ContactDetailPage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
