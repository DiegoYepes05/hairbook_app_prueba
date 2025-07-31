import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hairbook_app/features/home/presentation/providers/home_detail_provider.dart';

class HomeDetailScreen extends ConsumerWidget {
  final String salonId;
  const HomeDetailScreen({super.key, required this.salonId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salon = ref.watch(homeDetailProvider(salonId));

    return Scaffold(
      body: salon.when(
        loading: () => const Center(
          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
        ),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (data) => CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 220,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              title: const Text(''),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsetsDirectional.only(
                  start: 16,
                  bottom: 12,
                ),
                title: Text(
                  data.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (data.image.isNotEmpty)
                      Image.network(data.image, fit: BoxFit.cover)
                    else
                      Container(color: Colors.grey.shade300),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black54],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              leadingWidth: 64,
              leading: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, top: 8),
                  child: Material(
                    elevation: 6,
                    shadowColor: Colors.black38,
                    color: Colors.white.withValues(alpha: 0.92),
                    shape: const CircleBorder(),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black87,
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 18),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            data.location,
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Chip(
                          label: Text('${data.creditCost} créditos'),
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      data.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),

                        onPressed: () {
                          /* TODO: reservar */
                        },
                        child: const Text('Reservar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
