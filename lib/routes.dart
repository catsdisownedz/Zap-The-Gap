import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/task_manager_screen.dart';
import 'screens/study_screen.dart';
import 'screens/reminders_screen.dart';
import 'screens/settings_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/schedule': (context) => const ScheduleScreen(),
  '/tasks': (context) => const TaskManagerScreen(),
  '/study': (context) => const StudyScreen(),
  '/reminders': (context) => const RemindersScreen(),
  '/settings': (context) => const SettingsScreen(),
};
