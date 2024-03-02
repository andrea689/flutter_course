import 'package:exercise_4/cubits/contacts_cubit/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:exercise_4/pages/contact_detail_page/contact_detail_page.dart';
import 'package:exercise_4/pages/contacts_page/contacts_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactsCubit(),
      child: MaterialApp.router(
        routerConfig: GoRouter(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const ContactsPage(),
              routes: [
                GoRoute(
                  path: 'details/:contactId',
                  builder: (context, state) => ContactDetailPage(
                    contactId: int.tryParse(
                      '${state.pathParameters['contactId']}',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
