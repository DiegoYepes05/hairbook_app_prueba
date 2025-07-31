import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hairbook_app/features/home/presentation/providers/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salons = ref.watch(salonsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('HairBook App')),
      body: salons.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            final salon = data[index];
            return ListTile(
              onTap: () => context.push('/home_detail/${salon.id}'),
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
              trailing: Icon(Icons.arrow_forward_ios),
            );
          },
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Center(
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
