import 'package:flutter/material.dart';

class DanzasScreen extends StatelessWidget {
  const DanzasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gran Concurso de Danzas'),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner superior
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/danzas.jpg'), // ← Aquí va tu imagen
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.65),
                    ],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GRAN CONCURSO DE DANZAS',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 4,
                                color: Colors.black)
                          ],
                        ),
                      ),
                      Text(
                        'Categoría Libre',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Información del evento
                  _buildInfoCard(
                    icon: Icons.calendar_today,
                    title: 'Fecha',
                    content: 'Jueves 09 de Julio 2026',
                  ),
                  const SizedBox(height: 12),
                  _buildInfoCard(
                    icon: Icons.access_time,
                    title: 'Horario',
                    content: '04:00 pm - Inscripción y Desfile de Comparsas\n'
                        '07:00 pm - Inicio del Concurso',
                  ),
                  const SizedBox(height: 12),
                  _buildInfoCard(
                    icon: Icons.location_on,
                    title: 'Lugar',
                    content:
                        'Coliseo "San Francisco de Asís"\nAcobamba - Huancavelica',
                  ),

                  const SizedBox(height: 30),

                  // Descripción
                  const Text(
                    '¡Demuestra tu talento y pasión por la cultura!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D47A1),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'El Gran Concurso de Danzas es uno de los eventos más esperados del XXXVII Aniversario. '
                    'Participan grupos de estudiantes, egresados y la comunidad en general en categoría libre.',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),

                  const SizedBox(height: 30),

                  // Requisitos
                  const Text(
                    'Requisitos para Participar',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _buildRequirement(
                      '• Categoría Libre (sin restricción de edad)'),
                  _buildRequirement(
                      '• Duración máxima por presentación: 8 minutos'),
                  _buildRequirement('• Inscripción gratuita'),
                  _buildRequirement('• Traje típico o coreografía libre'),

                  const SizedBox(height: 40),

                  // Botón de inscripción
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                '¡Inscripciones abiertas! Contacta a la organización.'),
                            backgroundColor: Color(0xFF1976D2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.how_to_reg, size: 28),
                      label: const Text(
                        'INSCRIBIRME AL CONCURSO',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1976D2),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      {required IconData icon,
      required String title,
      required String content}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: const Color(0xFF0D47A1)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    content,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequirement(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
