import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GaleriaScreen extends StatefulWidget {
  const GaleriaScreen({super.key});

  @override
  State<GaleriaScreen> createState() => _GaleriaScreenState();
}

class _GaleriaScreenState extends State<GaleriaScreen> {
  String selectedCategory = 'Todas';

  final List<Map<String, dynamic>> galleryItems = [
    {
      'image': 'assets/images/deportes1.jpg',
      'title': 'Partido de Fútbol Interprogramas',
      'category': 'Deportes',
      'date': '09 Jul 2026'
    },
    {
      'image': 'assets/images/danzas2.jpg',
      'title': 'Concurso de Danzas',
      'category': 'Danzas',
      'date': '09 Jul 2026'
    },
    {
      'image': 'assets/images/comparsa.jpg',
      'title': 'Comparsa Scorcina',
      'category': 'Comparsas',
      'date': '10 Jul 2026'
    },
    {
      'image': 'assets/images/capacitacion.jpg',
      'title': 'Curso de Actualización Tecnológica',
      'category': 'Capacitaciones',
      'date': '07 Jul 2026'
    },
    {
      'image': 'assets/images/institucion.jpg',
      'title': 'Instalaciones del IESTP',
      'category': 'Institución',
      'date': '2026'
    },
    {
      'image': 'assets/images/egresados.jpg',
      'title': 'Encuentro de Egresados',
      'category': 'Deportes',
      'date': '04 Jul 2026'
    },
  ];

  List<Map<String, dynamic>> get filteredItems {
    if (selectedCategory == 'Todas') {
      return galleryItems;
    }
    return galleryItems
        .where((item) => item['category'] == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería del Aniversario'),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Filtros por categoría
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                'Todas',
                'Deportes',
                'Danzas',
                'Comparsas',
                'Capacitaciones',
                'Institución'
              ]
                  .map((category) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FilterChip(
                          label: Text(category),
                          selected: selectedCategory == category,
                          onSelected: (selected) {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                          backgroundColor: Colors.white,
                          selectedColor: const Color(0xFF1976D2),
                          labelStyle: TextStyle(
                            color: selectedCategory == category
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),

          // Grid de fotos
          Expanded(
            child: filteredItems.isEmpty
                ? const Center(child: Text('No hay imágenes en esta categoría'))
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return GestureDetector(
                        onTap: () =>
                            _openFullScreen(context, filteredItems, index),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                item['image'],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.image_not_supported,
                                      size: 50, color: Colors.grey),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withValues(alpha: 0.85)
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        item['date'],
                                        style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _openFullScreen(BuildContext context, List<Map<String, dynamic>> items,
      int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenGallery(
          items: items,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

// Pantalla completa con zoom y swipe
class FullScreenGallery extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final int initialIndex;

  const FullScreenGallery({
    super.key,
    required this.items,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Galería'),
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(items[index]['image']),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 3.0,
            heroAttributes: PhotoViewHeroAttributes(tag: items[index]['image']),
          );
        },
        itemCount: items.length,
        loadingBuilder: (context, event) => const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
        pageController: PageController(initialPage: initialIndex),
        backgroundDecoration: const BoxDecoration(color: Colors.black),
      ),
    );
  }
}
