import 'package:flutter/material.dart';
import 'package:flutter_cocktail/models/cocktail.dart';
import 'package:flutter_cocktail/persistence/cocktail_dao.dart';
import 'package:flutter_cocktail/screens/cocktail_details_screen.dart'; // Asegúrate de importar la pantalla de detalles aquí

class CocktailTile extends StatefulWidget {
  const CocktailTile({super.key, required this.cocktail});
  final Cocktail cocktail;

  @override
  State<CocktailTile> createState() => _CocktailTileState();
}

class _CocktailTileState extends State<CocktailTile> {
  bool _isFavorite = false;

  final CocktailDao dao = CocktailDao();
  checkFavorite() {
    dao.isFavorite(widget.cocktail).then(
      (value) {
        if (mounted) {
          setState(() {
            _isFavorite = value;
          });
        }
      },
    );
  }

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
              cocktail: widget.cocktail,
            ),
          ),
        );
      },
      child: InkWell(
        onTap: () {
          // Navegar a la pantalla de detalles del cóctel
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CocktailDetailsScreen(
                cocktail: widget.cocktail,
              ),
            ),
          );
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: 
                  [Image.network(
                    widget.cocktail.strDrinkThumb,
                    width: width,
                    height: width * 0.42,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
                _isFavorite
                    ? dao.insert(widget.cocktail)
                    : dao.delete(widget.cocktail);
              },
              icon: Icon(Icons.favorite_border_outlined,
                  color: _isFavorite
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).hintColor),
            ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text(widget.cocktail.strDrink,
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(widget.cocktail.strCategory,
                        style: Theme.of(context).textTheme.labelLarge),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}