import 'package:flutter/material.dart';

class Agendascreen extends StatefulWidget {
  const Agendascreen({super.key});

  @override
  State<Agendascreen> createState() => _AgendascreenState();
}

class _AgendascreenState extends State<Agendascreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today,
              size: 80,
              color: Colors.orange[300],
            ),
            const SizedBox(height: 20),
            const Text(
              'Calendar Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}