import 'package:flutter/material.dart';

class ContactoScreen extends StatelessWidget {
  const ContactoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacto'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Card(
              child: ListTile(
                leading: Icon(Icons.location_on, color: Color(0xFF0D47A1)),
                title: Text('Dirección'),
                subtitle: Text('Acobamba, Huancavelica'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.email, color: Color(0xFF0D47A1)),
                title: Text('Correo'),
                subtitle: Text('iestp.mst.acobamba@gmail.com'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.phone, color: Color(0xFF0D47A1)),
                title: Text('Teléfono'),
                subtitle: Text('+51 123 456 789'),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Síguenos en redes sociales',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
