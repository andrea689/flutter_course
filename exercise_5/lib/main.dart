import 'package:exercise_5/pages/contact_detail_page/contact_cubit/contact_cubit.dart';
import 'package:exercise_5/pages/contacts_page/contacts_cubit/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:exercise_5/pages/contact_detail_page/contact_detail_page.dart';
import 'package:exercise_5/pages/contacts_page/contacts_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            builder: (context, state) => BlocProvider(
              create: (context) => ContactsCubit()..getContacts(),
              child: const ContactsPage(),
            ),
            routes: [
              GoRoute(
                path: 'details/:contactId',
                builder: (context, state) {
                  final contactId = int.tryParse(
                    '${state.pathParameters['contactId']}',
                  );

                  if (contactId == null) {
                    return const Scaffold(
                      body: Center(
                        child: Text('ContactId non valido'),
                      ),
                    );
                  }

                  return BlocProvider(
                    create: (context) => ContactCubit()..getContact(contactId),
                    child: const ContactDetailPage(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
