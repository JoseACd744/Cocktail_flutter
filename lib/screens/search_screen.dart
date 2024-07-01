import 'package:flutter/material.dart';
import 'package:flutter_cocktail/models/cocktail.dart';
import 'package:flutter_cocktail/services/cocktail_service.dart';
import 'package:flutter_cocktail/widget/cocktail_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Cocktail> _cocktails = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktails'),
        backgroundColor: Colors.deepPurple, // Color de fondo actualizado
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ), // Estilo del texto actualizado
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _searchController,
              onChanged: (query) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search), // Icono de búsqueda agregado
                border: OutlineInputBorder( // Estilo del borde actualizado
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
            const SizedBox(height: 20), // Espacio agregado
            Expanded(
              child: FutureBuilder(
                future: CocktailService().getCocktails(_searchController.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error fetching data'),
                    );
                  } else {
                    final cocktails = snapshot.data as List<Cocktail>;
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: cocktails.length,
                      itemBuilder: (context, index) {
                        return CocktailTile(cocktail: cocktails[index]); // Asegúrate de que CocktailTile esté bien estilizado
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}