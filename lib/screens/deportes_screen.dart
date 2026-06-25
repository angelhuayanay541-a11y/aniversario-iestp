import 'package:flutter/material.dart';

class DeportesScreen extends StatelessWidget {
  const DeportesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades Deportivas'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSportCard('Fútbol', 'Campeonato Inter Programas', '09:00 am - 10 Julio', 'Estadio de Pillcosay', Icons.sports_soccer),
          _buildSportCard('Vóley', 'Inter-programas Damas y Varones', '03:00 pm - 08 Julio', 'Coliseo Jorge Lizana', Icons.sports_volleyball),
          _buildSportCard('Futsal', 'Inter-programas', '03:00 pm - 07 Julio', 'Coliseo Jorge Lizana', Icons.sports_basketball),
          _buildSportCard('Maratón Scorcina', 'Gran Maratón', '06:30 am - 03 Julio', 'Choclococha → Acobamba', Icons.directions_run),
        ],
      ),
    );
  }

  Widget _buildSportCard(String title, String subtitle, String time, String location, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, size: 50, color: const Color(0xFF1976D2)),
        title: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle),
            Text(time, style: const TextStyle(color: Colors.green)),
            Text(location),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
