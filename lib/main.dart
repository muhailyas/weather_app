import 'package:flutter/material.dart';
import 'package:weather_app/config/theme/app_theme.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/features/weather_info/presentation/bloc/location/location_bloc.dart';
import 'package:weather_app/features/weather_info/presentation/bloc/weather/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_info/presentation/pages/home/home_page.dart';
import 'package:weather_app/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDepedencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    sizeInitializing(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<LocationBloc>(
          create: (context) => sl(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather app',
        theme: theme(),
        home: const HomePage(),
      ),
    );
  }
}
