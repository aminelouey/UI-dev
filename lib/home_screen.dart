import 'package:flutter/material.dart';
import 'package:projet_8016586/ajoutepatient.dart';
import 'patient.dart';
import 'theme_service.dart';
import 'sidebar.dart';
import 'patient_table.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSidebarOpen = true;
  final TextEditingController _searchController = TextEditingController();
  List<Patient> _filteredPatients = [];
  List<Patient> _searchResults = [];

  // Données d'exemple pour les patients
  final List<Patient> _patients = [
    Patient(
        id: 1,
        name: 'Jean Dupont',
        age: 45,
        gender: 'M',
        condition: 'Hypertension',
        lastVisit: '15/03/2024'),
    Patient(
        id: 2,
        name: 'Marie Laurent',
        age: 32,
        gender: 'F',
        condition: 'Diabète',
        lastVisit: '22/03/2024'),
    Patient(
        id: 3,
        name: 'Pierre Martin',
        age: 58,
        gender: 'M',
        condition: 'Arthrite',
        lastVisit: '10/03/2024'),
    Patient(
        id: 4,
        name: 'Sophie Petit',
        age: 27,
        gender: 'F',
        condition: 'Migraine',
        lastVisit: '28/03/2024'),
    Patient(
        id: 5,
        name: 'Thomas Bernard',
        age: 41,
        gender: 'M',
        condition: 'Asthme',
        lastVisit: '05/04/2024'),
    Patient(
        id: 6,
        name: 'Jean Dupont',
        age: 45,
        gender: 'M',
        condition: 'Hypertension',
        lastVisit: '15/03/2024'),
    Patient(
        id: 7,
        name: 'Marie Laurent',
        age: 32,
        gender: 'F',
        condition: 'Diabète',
        lastVisit: '22/03/2024'),
    Patient(
        id: 8,
        name: 'Pierre Martin',
        age: 58,
        gender: 'M',
        condition: 'Arthrite',
        lastVisit: '10/03/2024'),
    Patient(
        id: 9,
        name: 'Sophie Petit',
        age: 27,
        gender: 'F',
        condition: 'Migraine',
        lastVisit: '28/03/2024'),
    Patient(
        id: 10,
        name: 'Thomas Bernard',
        age: 41,
        gender: 'M',
        condition: 'Asthme',
        lastVisit: '05/04/2024'),
    Patient(
        id: 11,
        name: 'Jean Dupont',
        age: 45,
        gender: 'M',
        condition: 'Hypertension',
        lastVisit: '15/03/2024'),
    Patient(
        id: 12,
        name: 'Marie Laurent',
        age: 32,
        gender: 'F',
        condition: 'Diabète',
        lastVisit: '22/03/2024'),
    Patient(
        id: 13,
        name: 'Pierre Martin',
        age: 58,
        gender: 'M',
        condition: 'Arthrite',
        lastVisit: '10/03/2024'),
    Patient(
        id: 14,
        name: 'Sophie Petit',
        age: 27,
        gender: 'F',
        condition: 'Migraine',
        lastVisit: '28/03/2024'),
    Patient(
        id: 15,
        name: 'Thomas Bernard',
        age: 41,
        gender: 'M',
        condition: 'Asthme',
        lastVisit: '05/04/2024'),
  ];

  @override
  void initState() {
    super.initState();
    _filteredPatients = _patients;
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final double screen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: themeService.backgroundColor,
      body: Stack(
        children: [
          Row(
            children: [
              Sidebar(
                isOpen: _isSidebarOpen,
                onToggle: _toggleSidebar,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildAppBar(themeService),
                      const SizedBox(height: 40),
                      const Row(
                        children: [
                          SizedBox(width: 100),
                          Text(
                            'Patients',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        children: [
                          SizedBox(width: 100),
                          Text(
                            'Gérez vos patients ici',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: Container(
                            alignment: Alignment.topLeft,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 7),
                                    _buildSearchBar(),
                                    buildSizedBox2(screen),
                                    Container(
                                      width: 220,
                                      height: 43,
                                      decoration: BoxDecoration(
                                        color: themeService.buttonColor,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Ajoutepatient()),
                                          );
                                        },
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              size: 22,
                                            ),
                                            SizedBox(width: 13),
                                            Text(
                                              'Nouveau Patient',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    buildSizedBox3(screen),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Container(
                                    width: 900,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 0,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 214, 214, 214),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: DataTable(
                                      columnSpacing: 20,
                                      horizontalMargin: 12,
                                      headingRowColor:
                                          MaterialStateProperty.all(
                                        themeService.isDarkMode
                                            ? const Color.fromARGB(
                                                255, 45, 45, 45)
                                            : const Color.fromARGB(
                                                255, 209, 227, 255),
                                      ),
                                      columns: const [
                                        DataColumn(
                                            label:
                                                Expanded(child: Text('Nom'))),
                                        DataColumn(
                                            label:
                                                Expanded(child: Text('Âge'))),
                                        DataColumn(
                                            label:
                                                Expanded(child: Text('Genre'))),
                                        DataColumn(
                                            label: Expanded(
                                                child: Text('Condition'))),
                                        DataColumn(
                                            label: Expanded(
                                                child:
                                                    Text('Dernière visite'))),
                                        DataColumn(
                                            label: Expanded(
                                                child: Text('Actions'))),
                                      ],
                                      rows: _filteredPatients.map((patient) {
                                        return DataRow(
                                          cells: [
                                            DataCell(Text(patient.name)),
                                            DataCell(
                                                Text(patient.age.toString())),
                                            DataCell(Text(patient.gender)),
                                            DataCell(Text(patient.condition)),
                                            DataCell(Text(patient.lastVisit)),
                                            DataCell(
                                              Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: const Text('Éditer'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {},
                                                    style: TextButton.styleFrom(
                                                      foregroundColor:
                                                          Colors.red,
                                                    ),
                                                    child:
                                                        const Text('Supprimer'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (_searchController.text.isNotEmpty && _searchResults.isNotEmpty)
            Positioned(
              top: 265,
              left: _isSidebarOpen ? 350 : 80,
              child: Container(
                width: 350,
                constraints: const BoxConstraints(maxHeight: 250),
                decoration: BoxDecoration(
                  color: themeService.surfaceColor,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final patient = _searchResults[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _searchController.clear();
                            _searchResults = [];
                          });
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Détails du Patient"),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Nom: ${patient.name}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Âge: ${patient.age}"),
                                    Text("Genre: ${patient.gender}"),
                                    Text("Condition: ${patient.condition}"),
                                    Text(
                                        "Dernière visite: ${patient.lastVisit}"),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Fermer"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.person_outline,
                                  size: 20, color: Colors.grey),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      patient.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      patient.condition,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  size: 16, color: Colors.grey[400]),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAppBar(ThemeService themeService) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(
                themeService.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeService.toggleTheme(),
            tooltip: 'Changer de thème',
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    final themeService = Provider.of<ThemeService>(context);
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: themeService.surfaceColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            if (value.isEmpty) {
              _searchResults = [];
            } else {
              _searchResults = _patients
                  .where((patient) =>
                      patient.name.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            }
          });
        },
        decoration: InputDecoration(
          hintText: 'Rechercher un patient par nom...',
          hintStyle: const TextStyle(fontWeight: FontWeight.w100),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget buildSizedBox2(double screen) {
    if (screen > 1100) {
      return SizedBox(width: 330);
    } else {
      return Container();
    }
  }

  Widget buildSizedBox3(double screen) {
    if (screen < 1100) {
      return SizedBox(width: 100);
    } else {
      return Container();
    }
  }
}
