import 'package:flutter/material.dart';
import 'package:flutter_cocktail/models/cocktail.dart';

class CocktailDetailsScreen extends StatelessWidget {
  const CocktailDetailsScreen({super.key, required this.cocktail});
  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(cocktail.strDrink),
         backgroundColor: Colors.transparent, // Hace el AppBar transparente
         elevation: 0, // Cambiado para usar el nombre del cóctel
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                cocktail.strDrinkThumb,
                width: width,
                height: width * 0.85,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8.0), // Agregado margin a la Card
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cocktail.strDrink,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.category),
                            const SizedBox(width: 8),
                            Text(
                              'Category: ${cocktail.strCategory}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.book),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Instructions: ${cocktail.strInstructions}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}