import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/reset_password_screen.dart';
import 'screens/sermons_screen.dart';
import 'screens/events_screen.dart';
import 'screens/prayer_requests_screen.dart';
import 'screens/leadership_screen.dart';
import 'screens/notes_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignupScreen(),
  '/reset-password': (context) => const ResetPasswordScreen(),
  '/sermons': (context) => const SermonsScreen(),
  '/events': (context) => const EventsScreen(),
  '/prayer-requests': (context) => const PrayerRequestsScreen(),
  '/leadership': (context) => const LeadershipScreen(),
  '/notes': (context) => const NotesScreen(),
};
