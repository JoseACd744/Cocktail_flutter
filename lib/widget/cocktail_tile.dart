import 'package:flutter/material.dart';
import 'package:flutter_cocktail/models/cocktail.dart';
import 'package:flutter_cocktail/screens/cocktail_details_screen.dart'; // Asegúrate de importar la pantalla de detalles aquí

class CocktailTile extends StatelessWidget {
  const CocktailTile({super.key, required this.cocktail});
  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        // Navegar a la pantalla de detalles del cóctel
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CocktailDetailsScreen(
              cocktail: cocktail,
            ), // Asegúrate de que CocktailDetailScreen esté implementado para aceptar un cóctel como parámetro
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                cocktail.strDrinkThumb,
                width: width,
                height: width * 0.42,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Text(cocktail.strDrink,
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(cocktail.strCategory,
                      style: Theme.of(context).textTheme.labelLarge),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}