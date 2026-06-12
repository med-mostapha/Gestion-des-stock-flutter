import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/models/stock_movement_model.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';
import 'package:gestion_de_stock_flutter/providers/stock_movement_provider.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/add_movement_page.dart';
import 'package:gestion_de_stock_flutter/widgets/movements/movement_filter_chips.dart';
import 'package:gestion_de_stock_flutter/widgets/movements/stock_movement_card.dart';
import 'package:gestion_de_stock_flutter/widgets/ui/app_search_bar.dart';
import 'package:provider/provider.dart';

class MovementsPage extends StatefulWidget {
  const MovementsPage({super.key});

  @override
  State<MovementsPage> createState() => _MovementsPageState();
}

class _MovementsPageState extends State<MovementsPage> {
  String _searchQuery = '';
  StockMovementType? _selectedType;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StockMovementProvider>().loadMovements();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StockMovementProvider>();

    final filteredMovements = provider.movements.where((movement) {
      final matchesSearch =
          movement.productName.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          movement.reason.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesType =
          _selectedType == null || movement.type == _selectedType;
      return matchesSearch && matchesType;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          SearchBarApp(
            onChanged: (query) {
              setState(() {
                _searchQuery = query;
              });
            },
          ),

          MovementFilterChips(
            selectedType: _selectedType,
            onTypeSelected: (type) {
              setState(() {
                _selectedType = type;
              });
            },
          ),

          const SizedBox(height: 4),

          Expanded(
            child: provider.isLoading
                ? _buildSkeletonLoading()
                : provider.error != null
                ? _buildErrorWidget(provider.error!)
                : filteredMovements.isEmpty
                ? _buildEmptyStateWidget()
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 80, top: 4),
                    itemCount: filteredMovements.length,
                    itemBuilder: (context, index) {
                      return StockMovementCard(
                        movement: filteredMovements[index],
                      );
                    },
                  ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        heroTag: "fab_movements",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMovementPage()),
          );
        },
        backgroundColor: AppColors.primary,
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildSkeletonLoading() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: 6,
      itemBuilder: (_, __) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        height: 75,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 50,
              color: AppColors.error,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: const TextStyle(color: AppColors.error, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () =>
                  context.read<StockMovementProvider>().loadMovements(),
              child: const Text(
                "Retry",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyStateWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.swap_horizontal_circle_outlined,
            size: 70,
            color: AppColors.border.withValues(alpha: 0.8),
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).movements_empty,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
