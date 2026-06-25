import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información Institucional'),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner Institucional
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/institucion2.jpg'),
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
                      Colors.black.withValues(alpha: 0.7)
                    ],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'IESTP "Manuel Scorza Torre"',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Acobamba - Huancavelica',
                        style: TextStyle(fontSize: 18, color: Colors.white70),
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
                  // Historia
                  const Text(
                    'Nuestra Historia',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D47A1),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'El Instituto de Educación Superior Tecnológico Público "Manuel Scorza Torre" fue creado en 1989. '
                    'Durante estos 37 años se ha consolidado como una institución líder en la formación técnica profesional '
                    'en la provincia de Acobamba, Región Huancavelica.',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  const SizedBox(height: 30),

                  // Años de vida institucional
                  Card(
                    color: const Color(0xFF1976D2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: const Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Icon(Icons.cake_rounded,
                              size: 60, color: Colors.white),
                          SizedBox(height: 12),
                          Text(
                            '37 Años',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'de Excelencia Educativa',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white70),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '(1989 - 2026)',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Programas de Estudio
                  const Text(
                    'Programas de Estudios',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D47A1),
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildProgramCard(
                    title: 'Arquitectura de Plataformas y STI',
                    icon: Icons.architecture,
                    description:
                        'Formación en diseño y desarrollo de plataformas tecnológicas.',
                  ),
                  const SizedBox(height: 12),
                  _buildProgramCard(
                    title: 'Producción Agropecuaria',
                    icon: Icons.agriculture,
                    description:
                        'Técnicas modernas de cultivo, ganadería y gestión agrícola.',
                  ),
                  const SizedBox(height: 12),
                  _buildProgramCard(
                    title: 'Construcción Civil',
                    icon: Icons.engineering,
                    description:
                        'Formación técnica en edificaciones, obras civiles y seguridad.',
                  ),

                  const SizedBox(height: 40),

                  const Center(
                    child: Text(
                      '"Año de la Esperanza y el Fortalecimiento de la Democracia"',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
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

  Widget _buildProgramCard({
    required String title,
    required IconData icon,
    required String description,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: const Color(0xFF1976D2).withValues(alpha: 0.1),
          child: Icon(icon, size: 32, color: const Color(0xFF0D47A1)),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(description, style: const TextStyle(height: 1.5)),
        ),
      ),
    );
  }
}
