import 'package:flutter/material.dart';
import 'package:projet_8016586/Rendez_vous.dart';
import 'package:projet_8016586/ajoutepatient.dart';
import 'package:projet_8016586/home_screen.dart';
import 'package:projet_8016586/theme_service.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onToggle;

  const Sidebar({
    super.key,
    required this.isOpen,
    required this.onToggle,
  });
  @override
  Widget build(BuildContext context) {
    final themeService = context.watch<ThemeService>();
    //final screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: themeService.isDarkMode
            ? const Color.fromARGB(
                255, 0, 10, 27) // Dark blue background for dark mode
            : const Color(0xFFFAFDFD), // White background for light mode
      ),
      duration: const Duration(milliseconds: 300),
      width: isOpen ? 250 : 90,
      child: Column(
        children: [
          // Bouton toggle sidebar
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: onToggle,
              tooltip: 'Toggle Sidebar',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          if (isOpen)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'PATIENTS',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                      color: themeService.isDarkMode
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 5),
          // Boutons de navigation
          _buildSidebarButton(context, Icons.people, 'Gestion des Patients',
              themeService, HomeScreen(themeService: themeService)),
          _buildSidebarButton(context, Icons.person_add, 'Ajouter Patient',
              themeService, const Ajoutepatient()),
          _buildSidebarButton(context, Icons.calendar_month, 'Rendez-vous',
              themeService, Rendyvous(themeService: themeService)),
        ],
      ),
    );
  }

  Widget _buildSidebarButton(BuildContext context, IconData icon, String label,
      dynamic themeService, Widget direction) {
    return Container(
      decoration: BoxDecoration(
        color: themeService.isDarkMode
            ? const Color.fromARGB(255, 0, 10, 27)
            : const Color(0xFFFAFDFD),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8.0),
        ),
      ),
      width: double.infinity,
      //padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => direction),
          );
        },
        style: TextButton.styleFrom(
          foregroundColor: themeService.isDarkMode
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 0, 0, 0),
          textStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              fontSize: 14.5),
          fixedSize: const Size(double.infinity, 55),
          alignment: isOpen ? Alignment.centerLeft : Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(16),
        ),
        child: Row(
          mainAxisAlignment:
              isOpen ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Icon(icon),
            if (isOpen)
              const SizedBox(width: 16), // Spacing between icon and text
            if (isOpen)
              Expanded(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
