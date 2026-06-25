import 'package:flutter/material.dart';

class AutoridadesScreen extends StatelessWidget {
  const AutoridadesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final autoridades = [
      {
        'nombre': 'Mg. José Quilca Sullca',
        'cargo': 'Director General',
        'foto': 'assets/images/autoridades/director.jpg',
      },
      {
        'nombre': 'Ing. Iván Arana Escobar',
        'cargo': 'Jefe de Unidad Académica',
        'foto': 'assets/images/autoridades/academico.jpg',
      },
      {
        'nombre': 'Lic. Demetrio Ñahuero Zambrano',
        'cargo': 'Jefe de Unidad Administrativa',
        'foto': 'assets/images/autoridades/administrativo.jpg',
      },
      {
        'nombre': 'Ing. Daniel Torres Landeo',
        'cargo': 'Secretario Académico',
        'foto': 'assets/images/autoridades/secretario.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Autoridades Institucionales'),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: autoridades.length,
        itemBuilder: (context, index) {
          final aut = autoridades[index];
          return Card(
            elevation: 8,
            margin: const EdgeInsets.only(bottom: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    aut['foto']!,
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 240,
                      color: const Color(0xFF1976D2),
                      child: const Icon(Icons.person,
                          size: 120, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        aut['nombre']!,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        aut['cargo']!,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Color(0xFF1976D2),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
