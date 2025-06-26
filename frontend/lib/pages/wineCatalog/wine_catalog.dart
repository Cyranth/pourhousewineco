import 'package:flutter/material.dart';
import '../../components/wine_card/wine_card.dart';
import '../../data/mock_wines.dart';

enum WineSortOption { name, year, rating }

enum WineFilterOption { type, varietal, country }

class WineCatalog extends StatefulWidget {
  const WineCatalog({super.key});

  @override
  State<WineCatalog> createState() => _WineCatalogState();
}

class _WineCatalogState extends State<WineCatalog> {
  WineSortOption _sortOption = WineSortOption.name;
  WineFilterOption _filterOption = WineFilterOption.type;
  String _selectedFilterValue = "All";
  String _searchText = "";

  List<String> getFilterValues() {
    switch (_filterOption) {
      case WineFilterOption.type:
        return [
          "All",
          ...{for (var w in mockWines) w.type},
        ];
      case WineFilterOption.varietal:
        return [
          "All",
          ...{for (var w in mockWines) w.varietal},
        ];
      case WineFilterOption.country:
        return [
          "All",
          ...{for (var w in mockWines) w.country},
        ];
    }
  }

  List sortWines(List wines) {
    List sorted = List.of(wines);
    switch (_sortOption) {
      case WineSortOption.name:
        sorted.sort((a, b) => a.name.compareTo(b.name));
        break;
      case WineSortOption.year:
        sorted.sort((a, b) => b.year.compareTo(a.year));
        break;
      case WineSortOption.rating:
        sorted.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }
    return sorted;
  }

  List filterWines(List wines) {
    List filtered = wines;
    if (_selectedFilterValue != "All") {
      switch (_filterOption) {
        case WineFilterOption.type:
          filtered = filtered
              .where((wine) => wine.type == _selectedFilterValue)
              .toList();
          break;
        case WineFilterOption.varietal:
          filtered = filtered
              .where((wine) => wine.varietal == _selectedFilterValue)
              .toList();
          break;
        case WineFilterOption.country:
          filtered = filtered
              .where((wine) => wine.country == _selectedFilterValue)
              .toList();
          break;
      }
    }
    if (_searchText.isNotEmpty) {
      final query = _searchText.toLowerCase();
      filtered = filtered
          .where(
            (wine) =>
                wine.name.toLowerCase().contains(query) ||
                wine.varietal.toLowerCase().contains(query) ||
                wine.region.toLowerCase().contains(query) ||
                wine.country.toLowerCase().contains(query) ||
                wine.description.toLowerCase().contains(query) ||
                wine.foodPairing.toLowerCase().contains(query),
          )
          .toList();
    }
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final filteredWines = filterWines(mockWines);
    final sortedWines = sortWines(filteredWines);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "Search wines...",
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              const Text("Filter by: "),
              DropdownButton<WineFilterOption>(
                value: _filterOption,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _filterOption = value;
                      _selectedFilterValue = "All";
                    });
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: WineFilterOption.type,
                    child: Text("Type"),
                  ),
                  DropdownMenuItem(
                    value: WineFilterOption.varietal,
                    child: Text("Varietal"),
                  ),
                  DropdownMenuItem(
                    value: WineFilterOption.country,
                    child: Text("Country"),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: _selectedFilterValue,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedFilterValue = value;
                    });
                  }
                },
                items: getFilterValues()
                    .map(
                      (val) => DropdownMenuItem(value: val, child: Text(val)),
                    )
                    .toList(),
              ),
              const Spacer(),
              const Text("Sort by: "),
              DropdownButton<WineSortOption>(
                value: _sortOption,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _sortOption = value;
                    });
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: WineSortOption.name,
                    child: Text("Name"),
                  ),
                  DropdownMenuItem(
                    value: WineSortOption.year,
                    child: Text("Year"),
                  ),
                  DropdownMenuItem(
                    value: WineSortOption.rating,
                    child: Text("Rating"),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 cards per row
              childAspectRatio: 0.75,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: sortedWines.length,
            itemBuilder: (context, index) {
              final wine = sortedWines[index];
              return WineCard(
                wine: wine,
                onTap: () {
                  // Handle tap, e.g., navigate to detail page
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
