// lib/pages/doctor_dashboard.dart
import 'package:flutter/material.dart';
import '../theme/themecolors.dart';
import '../widgets/doctornavbar.dart';
import '../utils/auth.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  // Sample appointments data
  final List<Map<String, String>> appointments = [
    {
      "patient": "Juan Dela Cruz",
      "time": "2025-11-28 09:00",
      "condition": "Flu",
      "notes": "Patient has mild fever",
      "status": "Pending",
    },
    {
      "patient": "Maria Santos",
      "time": "2025-11-28 10:30",
      "condition": "Check-up",
      "notes": "Routine annual check-up",
      "status": "Pending",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Restrict access to doctors only
    if (!Auth.isLoggedIn || Auth.userType != "doctor") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.popUntil(context, (route) => route.isFirst);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Only doctors can access this page")),
        );
      });
    }

    return Scaffold(
      backgroundColor: ThemeColors.secondary.withOpacity(0.05),
      body: Column(
        children: [
          const DoctorNavBar(), // simple logout navbar
          const SizedBox(height: 20),
          const HeroSection(),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _appointmentsTab(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appointmentsTab() {
    if (appointments.isEmpty) {
      return const Center(child: Text("No appointments available"));
    }

    return Column(
      children: appointments.map((app) {
        final patient = app["patient"] ?? "Unknown";
        final time = app["time"] ?? "Not set";
        final condition = app["condition"] ?? "No condition";
        final notes = app["notes"] ?? "No notes";
        final status = app["status"] ?? "Pending";

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.calendar_today_outlined,
                    color: ThemeColors.accent,
                  ),
                  title: Text(patient),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text("Appointment: $time"),
                      Text("Condition: $condition"),
                      Text("Notes: $notes"),
                      Text("Status: $status"),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          app["status"] = "Approved";
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("$patient appointment approved"),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                      ),
                      child: const Text(
                        "Approve",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          app["status"] = "Declined";
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("$patient appointment declined"),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                      ),
                      child: const Text(
                        "Decline",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Hero section
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
      decoration: BoxDecoration(
        color: ThemeColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          "Doctor Dashboard",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: ThemeColors.textDark,
          ),
        ),
      ),
    );
  }
}
