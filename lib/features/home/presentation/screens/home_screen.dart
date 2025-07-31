import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hairbook_app/features/home/presentation/providers/credit_provider.dart';
import 'package:hairbook_app/features/home/presentation/providers/home_provider.dart';
import 'package:hairbook_app/features/home/presentation/providers/salon_filter_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salonsAsync = ref.watch(salonsProvider);
    final filter = ref.watch(salonFilterProvider);
    final filterNotifier = ref.read(salonFilterProvider.notifier);

    final types = salonsAsync.when(
      data: (salons) {
        return <String>{'Todos', ...salons.map((s) => s.type).toSet()}.toList()
          ..sort();
      },
      loading: () => ['Todos'],
      error: (_, __) => ['Todos'],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('HairBook App'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Icon(Icons.credit_score_outlined, size: 20),
                const SizedBox(width: 4),
                Consumer(
                  builder: (context, ref, _) {
                    final credits = ref.watch(creditProvider);
                    return Text(
                      credits.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              children: types.map((type) {
                final isSelected =
                    (type == 'Todos' && filter == null) ||
                    (type != 'Todos' && type == filter);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FilterChip(
                    label: Text(type),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (type == 'Todos') {
                        filterNotifier.clearFilter();
                      } else {
                        filterNotifier.setFilter(selected ? type : null);
                      }
                    },
                    backgroundColor: Colors.grey[200],
                    selectedColor: Colors.blue[100],
                    checkmarkColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.blue[900] : Colors.black87,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: salonsAsync.when(
              data: (data) {
                final filteredData = filter == null
                    ? data
                    : data.where((s) => s.type == filter).toList();

                return filteredData.isEmpty
                    ? const Center(
                        child: Text(
                          'No hay salones que coincidan con el filtro',
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          final salon = filteredData[index];
                          return ListTile(
                            onTap: () =>
                                context.push('/home_detail/${salon.id}'),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                salon.image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(salon.name),
                            subtitle: Text(salon.type),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          );
                        },
                      );
              },
              error: (error, stackTrace) =>
                  Center(child: Text(error.toString())),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
