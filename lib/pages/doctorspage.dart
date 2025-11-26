import 'package:flutter/material.dart';
import '../theme/themecolors.dart';
import '../widgets/navbar.dart';
import '../widgets/responsive.dart';
import '../widgets/footer.dart';

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
          "Our Doctors",
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

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  final List<Map<String, String>> allDoctors = const [
    {
      'name': 'Dr. Maria Santos',
      'specialty': 'Cardiologist',
      'description': 'Expert in heart-related diseases and treatments.',
      'contact': '+63 912 345 6789',
      'availability': 'Mon-Fri 9AM-3PM',
    },
    {
      'name': 'Dr. John Reyes',
      'specialty': 'Pediatrician',
      'description': 'Specialist in child health and wellness.',
      'contact': '+63 913 234 5678',
      'availability': 'Tue-Sat 10AM-4PM',
    },
    {
      'name': 'Dr. Angela Cruz',
      'specialty': 'Dermatologist',
      'description': 'Focuses on skin, hair, and nail conditions.',
      'contact': '+63 914 456 7890',
      'availability': 'Mon-Fri 8AM-2PM',
    },
    {
      'name': 'Dr. Mark Villanueva',
      'specialty': 'Orthopedic Surgeon',
      'description': 'Treats bone, joint, and muscle injuries.',
      'contact': '+63 915 678 9012',
      'availability': 'Mon-Thu 9AM-5PM',
    },
    {
      'name': 'Dr. Liza Gomez',
      'specialty': 'Neurologist',
      'description': 'Specialist in brain and nervous system disorders.',
      'contact': '+63 916 789 0123',
      'availability': 'Wed-Sun 10AM-4PM',
    },
    {
      'name': 'Dr. Paolo Diaz',
      'specialty': 'Ophthalmologist',
      'description': 'Expert in eye diseases and vision correction.',
      'contact': '+63 917 890 1234',
      'availability': 'Mon-Fri 11AM-5PM',
    },
    {
      'name': 'Dr. Nina Morales',
      'specialty': 'Gynecologist',
      'description': 'Specialist in women\'s health.',
      'contact': '+63 918 901 2345',
      'availability': 'Mon-Fri 9AM-4PM',
    },
    {
      'name': 'Dr. Carlo Ramos',
      'specialty': 'General Surgeon',
      'description': 'Performs general surgical procedures.',
      'contact': '+63 919 012 3456',
      'availability': 'Tue-Sat 8AM-2PM',
    },
    {
      'name': 'Dr. Emma Torres',
      'specialty': 'Endocrinologist',
      'description': 'Treats hormonal and metabolic disorders.',
      'contact': '+63 920 123 4567',
      'availability': 'Mon-Fri 10AM-4PM',
    },
    {
      'name': 'Dr. Victor Lim',
      'specialty': 'ENT Specialist',
      'description': 'Treats ear, nose, and throat conditions.',
      'contact': '+63 921 234 5678',
      'availability': 'Wed-Sun 9AM-3PM',
    },
  ];

  List<Map<String, String>> displayedDoctors = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    displayedDoctors = allDoctors;
  }

  void updateSearch(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      displayedDoctors = allDoctors.where((doctor) {
        final name = doctor['name']!.toLowerCase();
        final specialty = doctor['specialty']!.toLowerCase();
        return name.contains(searchQuery) || specialty.contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),

            const HeroSection(),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Column(
                children: [
                  // Search bar
                  TextField(
                    onChanged: updateSearch,
                    decoration: InputDecoration(
                      hintText: 'Search by name or specialty',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: ThemeColors.secondaryDark,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: ThemeColors.secondary.withOpacity(0.1),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Doctor grid
                  Responsive(
                    desktop: _doctorGrid(desktop: true),
                    mobile: _doctorGrid(desktop: false),
                  ),
                ],
              ),
            ),

            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _doctorGrid({required bool desktop}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: desktop ? 5 : 1, // 5 columns desktop, 1 column mobile
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: desktop ? 1 : 2.2,
      ),
      itemCount: displayedDoctors.length,
      itemBuilder: (context, index) {
        final doctor = displayedDoctors[index];
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: ThemeColors.secondary.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, size: 40, color: ThemeColors.accent),
                const SizedBox(height: 8),
                Text(
                  doctor['name']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.textDark,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  doctor['specialty']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ThemeColors.secondaryDark,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Contact: ${doctor['contact']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ThemeColors.textDark,
                  ),
                ),
                Text(
                  'Available: ${doctor['availability']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ThemeColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
