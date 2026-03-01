import 'package:flutter/material.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/ai_insight_card.dart';
import '../../core/models/recommendation.dart';
import '../../core/theme/app_theme.dart';

class OptimizationScreen extends StatefulWidget {
  const OptimizationScreen({super.key});

  @override
  State<OptimizationScreen> createState() => _OptimizationScreenState();
}

class _OptimizationScreenState extends State<OptimizationScreen> {
  late List<Recommendation> _recommendations;
  String _selectedFilter = 'all';

  @override
  void initState() {
    super.initState();
    _recommendations = Recommendation.getMockRecommendations();
  }

  List<Recommendation> get _filteredRecommendations {
    if (_selectedFilter == 'all') return _recommendations;
    return _recommendations
        .where((r) => r.priority == _selectedFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ScreenHeader(
          title: 'Optimization',
          subtitle: 'AI-powered recommendations',
          leadingIcon: Icons.auto_awesome,
          backgroundColor: const Color(0xFF7C3AED),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stats Cards
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      label: 'Potential Savings',
                      value: 'R1,245',
                      subtitle: 'This month',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      label: 'Battery Health',
                      value: '96%',
                      subtitle: 'Cycles optimized',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _FilterChip(
                      label: 'All',
                      isActive: _selectedFilter == 'all',
                      onTap: () =>
                          setState(() => _selectedFilter = 'all'),
                    ),
                    const SizedBox(width: 8),
                    _FilterChip(
                      label: 'High Priority',
                      isActive: _selectedFilter == 'high',
                      onTap: () =>
                          setState(() => _selectedFilter = 'high'),
                    ),
                    const SizedBox(width: 8),
                    _FilterChip(
                      label: 'Medium',
                      isActive: _selectedFilter == 'medium',
                      onTap: () =>
                          setState(() => _selectedFilter = 'medium'),
                    ),
                    const SizedBox(width: 8),
                    _FilterChip(
                      label: 'Low',
                      isActive: _selectedFilter == 'low',
                      onTap: () =>
                          setState(() => _selectedFilter = 'low'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Recommendations List
              Text(
                'Recommendations',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              ..._filteredRecommendations.map((rec) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: AIInsightCard(
                      title: rec.title,
                      description: rec.description,
                      impact: rec.impact,
                      category: rec.category,
                      priority: rec.priority,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Applied: ${rec.title}'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  )),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String subtitle;

  const _StatCard({
    required this.label,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryBlue,
            AppTheme.primaryBlue.withValues(alpha: 0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      onSelected: (_) => onTap(),
      selected: isActive,
      backgroundColor: AppTheme.bgWhite,
      selectedColor: const Color(0xFFEFF6FF),
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: isActive ? AppTheme.primaryBlue : AppTheme.textMedium,
      ),
      side: BorderSide(
        color: isActive ? AppTheme.primaryBlue : const Color(0xFFE2E8F0),
      ),
    );
  }
}

