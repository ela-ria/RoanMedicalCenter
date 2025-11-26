// lib/widgets/portalnavbar.dart
import 'package:flutter/material.dart';
import '../theme/themecolors.dart';
import '../widgets/responsive.dart';
import '../pages/appointmentpage.dart';

class PortalNavBar extends StatelessWidget {
  const PortalNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: _DesktopPortalNavBar(),
      mobile: _MobilePortalNavBar(),
    );
  }
}

// Desktop Links
class _DesktopPortalNavLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppointmentPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColors.accent,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "Book an Appointment",
            style: TextStyle(color: ThemeColors.textLight, fontSize: 16),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColors.accentDark,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "Logout",
            style: TextStyle(color: ThemeColors.textLight, fontSize: 16),
          ),
        ),
      ],
    );
  }
}

// Desktop Layout
class _DesktopPortalNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/logos/logo.png', height: 50),
              const SizedBox(width: 10),
              const Text(
                "Roan Medical Center | Patient Portal",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.secondary,
                ),
              ),
            ],
          ),
          _DesktopPortalNavLinks(),
        ],
      ),
    );
  }
}

// Mobile Layout
class _MobilePortalNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/logos/logo.png', height: 40),
              const SizedBox(width: 8),
              const Text(
                "Roan Medical Center",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.secondary,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: ThemeColors.textLight),
            iconSize: 30,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Container(
                    color: ThemeColors.secondary,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.calendar_today_outlined,
                            color: ThemeColors.textLight,
                          ),
                          title: const Text(
                            "Book Appointment",
                            style: TextStyle(color: ThemeColors.textLight),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AppointmentPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.logout,
                            color: ThemeColors.textLight,
                          ),
                          title: const Text(
                            "Logout",
                            style: TextStyle(color: ThemeColors.textLight),
                          ),
                          onTap: () {
                            Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
