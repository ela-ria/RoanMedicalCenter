import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../theme/themecolors.dart';
import '../widgets/responsive.dart';
import '../widgets/footer.dart';

const List<Map<String, dynamic>> _services = [
  {
    'title': 'General Medicine',
    'description':
        'Comprehensive primary care and medical consultations for adults.',
    'icon': Icons.local_hospital_outlined,
    'color': ThemeColors.accentDark,
  },
  {
    'title': 'Pediatrics',
    'description':
        'Healthcare services tailored for infants, children, and teenagers.',
    'icon': Icons.child_care_outlined,
    'color': ThemeColors.accentDark,
  },
  {
    'title': 'Cardiology',
    'description':
        'Diagnosis and treatment of heart-related conditions and diseases.',
    'icon': Icons.favorite_outline,
    'color': ThemeColors.accentDark,
  },
  {
    'title': 'Emergency Care',
    'description':
        'Immediate treatment for urgent medical conditions and injuries.',
    'icon': Icons.warning_amber_outlined,
    'color': ThemeColors.accentDark,
  },
  {
    'title': 'Laboratory',
    'description':
        'Accurate and fast diagnostic laboratory testing for all ages.',
    'icon': Icons.science_outlined,
    'color': ThemeColors.accentDark,
  },
  {
    'title': 'Dermatology',
    'description': 'Specialized care for skin, hair, and nail conditions.',
    'icon': Icons.healing_outlined,
    'color': ThemeColors.accentDark,
  },
  {
    'title': 'Orthopedics',
    'description':
        'Treatment for bone, joint, and muscle problems and injuries.',
    'icon': Icons.accessibility_new_outlined,
    'color': ThemeColors.accentDark,
  },
  {
    'title': 'Radiology',
    'description':
        'Imaging services such as X-rays and scans for accurate diagnosis.',
    'icon': Icons.radio_outlined,
    'color': ThemeColors.accentDark,
  },
];

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      color: ThemeColors.secondary,
      child: const Center(
        child: Text(
          "Our Services",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: ThemeColors.textLight,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 1,
                color: ThemeColors.secondaryDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            const HeroSection(),
            _ServicesContent(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _ServicesContent extends StatelessWidget {
  Widget _serviceCard(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return ServiceCard(
      title: title,
      description: description,
      icon: icon,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Responsive(
        desktop: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 1.1,
          ),
          itemCount: _services.length,
          itemBuilder: (context, index) {
            final service = _services[index];
            return _serviceCard(
              service['title'],
              service['description'],
              service['icon'],
              service['color'],
            );
          },
        ),
        mobile: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.1,
          ),
          itemCount: _services.length,
          itemBuilder: (context, index) {
            final service = _services[index];
            return _serviceCard(
              service['title'],
              service['description'],
              service['icon'],
              service['color'],
            );
          },
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,

      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: ThemeColors.accent),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ThemeColors.textDark,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ThemeColors.textDark.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
