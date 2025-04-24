import 'package:flutter/material.dart';
import 'package:projet_8016586/home_screen.dart';
import 'package:projet_8016586/sidebar.dart';
import 'package:projet_8016586/theme_service.dart';
import 'package:provider/provider.dart';

class Ajoutepatient extends StatefulWidget {
  const Ajoutepatient({super.key});

  @override
  State<Ajoutepatient> createState() => _AjoutepatientState();
}

class _AjoutepatientState extends State<Ajoutepatient> {
  bool _isSidebarOpen = true;
  DateTime? selectedDate;

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose(); // Nettoyer après utilisation
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text =
            "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
      });
    }
  }

  String? selectedGenre;
  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            isOpen: _isSidebarOpen,
            onToggle: _toggleSidebar,
          ),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildAppBar(themeService),
                const SizedBox(height: 20),
                // La premiere ligne:
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      '1- Nom et Prenom :',
                      style: TextStyle(
                          fontSize: 16.5,
                          fontFamily: 'Poppins',
                          color: themeService.isDarkMode
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(width: 230),
                    Text(
                      '2- Date De Naissance :',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Poppins',
                          color: themeService.isDarkMode
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                //Les Inputs:
                Row(
                  children: [
                    const SizedBox(
                      width: 32,
                    ),
                    const SizedBox(
                        height: 45,
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        )),
                    const SizedBox(width: 80),
                    SizedBox(
                        height: 45,
                        width: 300,
                        child: TextField(
                          controller: dateController,
                          decoration: const InputDecoration(
                            hintText: 'jj/mm/aaaa',
                            hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w100),
                            border: OutlineInputBorder(),
                          ),
                          readOnly: true,
                          onTap: () => _selectDate(context),
                        )),
                  ],
                ),
                const SizedBox(height: 20),
                // La Deuxieme ligne:
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      '3- Sexe :',
                      style: TextStyle(
                          fontSize: 16.5,
                          fontFamily: 'Poppins',
                          color: themeService.isDarkMode
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(width: 315),
                    Text(
                      '4- Numéro Téléphone :',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Poppins',
                          color: themeService.isDarkMode
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                //les Inputs :
                Row(
                  children: [
                    const SizedBox(
                      width: 32,
                    ),
                    SizedBox(
                      height: 45,
                      width: 300,
                      child: DropdownButtonFormField<String>(
                        value: selectedGenre,
                        decoration: const InputDecoration(
                          labelText: "Genre",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10), // Ajuste l'espace interne
                        ),
                        items: ["Homme", "Femme"].map((String genre) {
                          return DropdownMenuItem<String>(
                            value: genre,
                            child: Text(genre),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGenre = newValue;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 80),
                    const SizedBox(
                        height: 45,
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '+213 ...',
                            hintStyle: TextStyle(fontWeight: FontWeight.w100),
                            border: OutlineInputBorder(),
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 20),
                //la Troisieme ligne:
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      '5- Traitement : ',
                      style: TextStyle(
                          fontSize: 16.5,
                          fontFamily: 'Poppins',
                          color: themeService.isDarkMode
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                //Traitement Button:
                const Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      height: 400,
                      width: 650,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: null, // Permet d'avoir plusieurs lignes
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                // Les button Enregistre et Annuler :
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    //Enregistre:
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: themeService.isDarkMode
                            ? Colors.white
                            : Colors.blue,
                      ),
                      width: 180,
                      height: 40,
                      child: SizedBox.expand(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            foregroundColor: themeService.isDarkMode
                                ? Colors.black
                                : Colors.white,
                          ),
                          child: const Text(
                            'Enregistré',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 200,
                    ),
                    //Annuler:
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: themeService.isDarkMode
                            ? const Color.fromARGB(255, 250, 88, 88)
                            : const Color.fromARGB(255, 179, 179, 179),
                      ),
                      width: 180,
                      height: 40,
                      child: SizedBox.expand(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Ajoutepatient(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            foregroundColor: themeService.isDarkMode
                                ? Colors.black
                                : Colors.white,
                          ),
                          child: Text(
                            'Annuler ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: themeService.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildAppBar(ThemeService themeService) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: themeService.isDarkMode
                ? const Color(0xFFFFFFFF).withOpacity(0.0)
                : const Color.fromARGB(255, 0, 48, 158).withOpacity(0.0),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            icon: const Icon(Icons.arrow_back),
          ),
          const SizedBox(
            width: 8,
          ),
          const Text(
            'Nouveau Patient',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
            ),
          ),
          const Spacer(),
          // Bouton thème
          IconButton(
            icon: Icon(
                themeService.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeService.toggleTheme(),
            tooltip: 'Changer de thème',
          ),
          // Bouton profil
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
            tooltip: 'Profil',
          ),
        ],
      ),
    );
  }
}
