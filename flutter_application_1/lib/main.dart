import 'package:flutter/material.dart';

class TopStatusSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.wifi, size: 24),
        Icon(Icons.battery_full, size: 24),
        Icon(Icons.notifications, size: 24),
      ],
    );
  }
}

class MainControlSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            backgroundColor: Colors.green[700],
          ),
          onPressed: () {},
          child: Column(
            children: [
              Icon(Icons.home, size: 40),
              Text("ARM STAY"),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            backgroundColor: Colors.blue[700],
          ),
          onPressed: () {},
          child: Column(
            children: [
              Icon(Icons.directions_walk, size: 40),
              Text("ARM AWAY"),
            ],
          ),
        ),
      ],
    );
  }
}

class DateTimeWeatherSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "1:15 PM",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text(
          "Wednesday, January 27",
          style: TextStyle(fontSize: 18, color: Colors.grey[300]),
        ),
        Text(
          "Carlsbad, CA",
          style: TextStyle(fontSize: 18, color: Colors.grey[300]),
        ),
      ],
    );
  }
}

class WeatherForecastSection extends StatelessWidget {
  final List<String> days = ["Tue", "Wed", "Thu", "Fri", "Sat"];
  final List<int> temps = [65, 68, 70, 72, 66]; // Dummy temperatures

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(days[index], style: TextStyle(color: Colors.white)),
                Icon(Icons.wb_sunny, color: Colors.yellow, size: 40),
                Text("${temps[index]}°F", style: TextStyle(color: Colors.white)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BottomNavigationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NavigationButton(label: "SMART HOME CONTROLS"),
        NavigationButton(label: "SYSTEM INFO AND USAGE"),
        NavigationButton(label: "SYSTEM SETTINGS"),
      ],
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String label;

  NavigationButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[900],
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      ),
      onPressed: () {},
      child: Text(label, style: TextStyle(fontSize: 12)),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData.dark(), // Dark theme to match your design.
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TopStatusSection(),
            SizedBox(height: 10),
            MainControlSection(),
            SizedBox(height: 20),
            DateTimeWeatherSection(),
            WeatherForecastSection(),
            Spacer(),
            BottomNavigationSection(),
          ],
        ),
      ),
    );
  }
}