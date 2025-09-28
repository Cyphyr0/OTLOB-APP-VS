import 'package:flutter/material.dart';
import '../../components/by_restaurant_tag.dart';

class RestaurantScreen extends StatefulWidget {
  final Map<String, dynamic> restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.restaurant['name']),
              background: Image.asset(
                widget.restaurant['microMenuImages'][0],
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.fastfood, size: 80, color: Colors.grey),
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Delivery'),
                Tab(text: 'Pickup'),
              ],
              indicatorColor: Theme.of(context).primaryColor,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMenuTab(),
                _buildMenuTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDealsCard(),
        const SizedBox(height: 16),
        _buildReviewsCard(),
        const SizedBox(height: 16),
        const ByRestaurantTag(),
      ],
    );
  }

  Widget _buildDealsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Deals & Benefits', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('• 20% off on all pizzas\n• Free delivery for orders above 100 EGP'),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Customer Reviews', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber[700], size: 20),
                const SizedBox(width: 4),
                Text('4.7', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(width: 4),
                Text('(120 reviews)', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 8),
            Text('“Great food and fast delivery!”'),
            const SizedBox(height: 4),
            Text('“Loved the pizza, will order again.”'),
          ],
        ),
      ),
    );
  }
}
