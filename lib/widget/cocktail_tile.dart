import 'package:flutter/material.dart';
import 'package:flutter_cocktail/models/cocktail.dart';
import 'package:flutter_cocktail/persistences/Favourite_dao.dart';

class CocktailTile extends StatefulWidget {
  const CocktailTile({super.key, required this.cocktail});
  final Cocktail cocktail;

  @override
  State<CocktailTile> createState() => _CocktailTileState();
}

class _CocktailTileState extends State<CocktailTile> {
  late bool _isFavourite = false;

  onTap() async {
    if (_isFavourite) {
      await FavouriteDao().removeFavourite(widget.cocktail.idDrink);
    } else {
      await FavouriteDao().addFavourite(widget.cocktail);
    }

    setState(() {
      _isFavourite = !_isFavourite;
    });
  }

  isFavourite() async {
    _isFavourite = await FavouriteDao().isFavourite(widget.cocktail.idDrink);
    setState(() {
      _isFavourite = _isFavourite;
    });
  }

  @override
  initState() {
    super.initState();
    isFavourite();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
              tag: 'cocktail-image-${widget.cocktail.idDrink}',
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image.network(
                    widget.cocktail.strDrinkThumb,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    icon: Icon(
                      _isFavourite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      onTap();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(_isFavourite
                            ? 'Removed ${widget.cocktail.strDrink} from favourites'
                            : 'Added ${widget.cocktail.strDrink} to favourites'),
                      ));
                    },
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.cocktail.strDrink,
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(widget.cocktail.strCategory,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant)),
            ]),
          )
        ],
      ),
    );
  }
}