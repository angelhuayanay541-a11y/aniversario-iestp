import 'package:flutter/material.dart';

class ProgramaScreen extends StatelessWidget {
  const ProgramaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programa General'),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDayHeader('22 al 26 de Junio 2026'),
          _buildActivity('Arquitectura de Plataformas y STI', 'Todo el día',
              Icons.architecture),
          _buildDayHeader('29 de Junio al 03 de Julio 2026'),
          _buildActivity(
              'Producción Agropecuaria', 'Todo el día', Icons.agriculture),
          _buildActivity(
              'Construcción Civil', 'Todo el día', Icons.engineering),
          _buildDayHeader('02 de Julio 2026'),
          _buildActivity(
              'Desfile deportivo con dirección al Estadio de Pillcosay',
              '08:00 am',
              Icons.directions_run),
          _buildActivity(
              'Inicio del campeonato inter Programas de Estudios (Fútbol)',
              '09:00 am',
              Icons.sports_soccer),
          _buildDayHeader('03 de Julio 2026'),
          _buildActivity(
              'Gran Maratón Scorcino', '06:30 am', Icons.directions_run),
          _buildActivity('Faena de la Comunidad Educativa (Limpieza y Pintado)',
              '09:00 am', Icons.cleaning_services),
          _buildDayHeader('04 de Julio 2026'),
          _buildActivity('Gran Encuentro Deportivo de Egresados', '09:00 am',
              Icons.sports_soccer),
          _buildDayHeader('06 de Julio 2026'),
          _buildActivity('Misa de Salud', '07:00 am', Icons.church),
          _buildActivity('Izamiento del Pabellón Nacional y Desfile Cívico',
              '08:00 am', Icons.flag),
          _buildActivity('Elecciones Estudiantiles 2026-2027', '11:00 am',
              Icons.how_to_vote),
          _buildDayHeader('07 de Julio 2026'),
          _buildActivity('Inauguración del Ciclo de Actualización y Talleres',
              '08:30 am', Icons.school),
          _buildActivity('Curso de Actualización e Innovación Tecnológica',
              '09:00 am', Icons.school),
          _buildActivity('Encuentro Deportivo Futsal (Damas y Varones)',
              '03:00 pm', Icons.sports_soccer),
          _buildDayHeader('08 de Julio 2026'),
          _buildActivity('Arreglo y Ambientación del Local Institucional',
              '06:00 am', Icons.cleaning_services),
          _buildActivity('Continuación del Curso de Actualización', '08:30 am',
              Icons.school),
          _buildActivity('Encuentro Deportivo Vóley (Damas y Varones)',
              '03:00 pm', Icons.sports_volleyball),
          _buildDayHeader('09 de Julio 2026'),
          _buildActivity('Gran Final del Encuentro Deportivo Inter-programas',
              '08:00 am', Icons.sports_soccer),
          _buildActivity('Encuentro Deportivo de Docentes (MST vs PAUCARÁ)',
              '11:00 am', Icons.sports_soccer),
          _buildActivity('Desfile de Comparsas', '04:00 pm', Icons.music_note),
          _buildActivity('Inicio del Gran Concurso de Danzas', '07:00 pm',
              Icons.music_note),
          _buildDayHeader('10 de Julio 2026'),
          _buildActivity(
              'Alva de 21 Camaretazos', '05:30 am', Icons.celebration),
          _buildActivity(
              'Gran Mondongada Scorcina', '07:00 am', Icons.restaurant),
          _buildActivity('Concentración y Gran Comparsa Scorcina', '09:00 am',
              Icons.people),
          _buildActivity('Discurso Alusivo', '01:00 pm', Icons.mic),
          _buildActivity('Brindis de Honor', '01:15 pm', Icons.wine_bar),
          _buildActivity(
              'Almuerzo de Confraternidad', '01:30 pm', Icons.restaurant),
          _buildActivity('Baile del Cortamonte', '02:00 pm', Icons.music_note),
          _buildActivity(
              'Baile General con Artistas', '06:00 pm', Icons.music_note),
        ],
      ),
    );
  }

  Widget _buildDayHeader(String day) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        day,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0D47A1),
        ),
      ),
    );
  }

  Widget _buildActivity(String title, String time, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1976D2), size: 36),
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        subtitle: Text(time, style: const TextStyle(color: Colors.grey)),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      ),
    );
  }
}
