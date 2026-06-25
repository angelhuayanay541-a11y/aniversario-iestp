import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'programa_screen.dart';
import 'deportes_screen.dart';
import 'danzas_screen.dart';
import 'galeria_screen.dart';
import 'autoridades_screen.dart';
import 'info_screen.dart';
import 'contacto_screen.dart';
import '../widgets/countdown_timer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('IESTP Manuel Scorza Torre'),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0D47A1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school, size: 80, color: Colors.white),
                  Text(
                    'XXXVII Aniversario',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
                context, Icons.home, 'Inicio', () => Navigator.pop(context)),
            _buildDrawerItem(context, Icons.event, 'Programa General', () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProgramaScreen()));
            }),
            _buildDrawerItem(context, Icons.sports, 'Actividades Deportivas',
                () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DeportesScreen()));
            }),
            _buildDrawerItem(context, Icons.music_note, 'Concurso de Danzas',
                () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DanzasScreen()));
            }),
            _buildDrawerItem(context, Icons.photo_library, 'Galería', () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const GaleriaScreen()));
            }),
            _buildDrawerItem(context, Icons.people, 'Autoridades', () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AutoridadesScreen()));
            }),
            _buildDrawerItem(context, Icons.info, 'Información Institucional',
                () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const InfoScreen()));
            }),
            _buildDrawerItem(context, Icons.contact_mail, 'Contacto', () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ContactoScreen()));
            }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==================== BANNER MEJORADO ====================
            Stack(
              children: [
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.75),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'XXXVII ANIVERSARIO',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 4,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'IESTP "Manuel Scorza Torre"',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                color: Colors.black87),
                          ],
                        ),
                      ),
                      const Text(
                        'Acobamba - Huancavelica',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // ==================== BIENVENIDOS MEJORADO ====================
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '¡Bienvenidos!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D47A1),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1976D2).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color:
                              const Color(0xFF1976D2).withValues(alpha: 0.3)),
                    ),
                    child: const Text(
                      'Celebremos juntos 37 años de excelencia educativa en Acobamba - Huancavelica.\n\n'
                      'Del 22 de junio al 10 de julio 2026 te esperamos con actividades deportivas, culturales, académicas y mucha alegría scorcina.',
                      style: TextStyle(
                        fontSize: 17,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bienvenidos',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Celebremos juntos 37 años de excelencia educativa en Acobamba - Huancavelica',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  // Countdown
                  _buildCountdown(context),
                  const SizedBox(height: 20),
                  // Quick access cards
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildQuickCard(context, 'Programa', Icons.calendar_today,
                          Colors.blue, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ProgramaScreen()));
                      }),
                      _buildQuickCard(context, 'Deportes', Icons.sports_soccer,
                          Colors.green, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DeportesScreen()));
                      }),
                      _buildQuickCard(
                          context, 'Danzas', Icons.music_note, Colors.purple,
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DanzasScreen()));
                      }),
                      _buildQuickCard(context, 'Galería', Icons.photo_library,
                          Colors.orange, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const GaleriaScreen()));
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF0D47A1)),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildQuickCard(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountdown(BuildContext context) {
    return const CountdownTimer();
  }
}
