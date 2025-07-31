import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hairbook_app/features/home/domain/datasources/home_datasource.dart';
import 'package:hairbook_app/features/home/domain/entities/salons_entities.dart';
import 'package:hairbook_app/features/home/infrastructure/mappers/home_mappers.dart';

class HomeDataSourceImpl implements HomeDatasource {
  @override
  Future<List<Salon>> getSalons() async {
    CollectionReference users = FirebaseFirestore.instance.collection('salons');

    try {
      final QuerySnapshot response = await users.get();
      final List<Salon> salons = response.docs
          .map((doc) => HomeMapper.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return salons;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw Exception('Error al obtener los salones: $e');
    }
  }

  @override
  Future<Salon> getSalonById(String id) async {
    final col = FirebaseFirestore.instance.collection('salons');

    QuerySnapshot<Map<String, dynamic>> snap = await col
        .where('id', isEqualTo: id)
        .limit(1)
        .get();

    if (snap.docs.isEmpty) {
      final asInt = int.tryParse(id);
      if (asInt != null) {
        snap = await col.where('id', isEqualTo: asInt).limit(1).get();
      }
    }

    if (snap.docs.isEmpty) {
      throw Exception('No se encontró el salón con ID: $id');
    }

    final doc = snap.docs.first;
    final data = doc.data();
    return HomeMapper.fromJson({...data, 'id': doc.id, 'innerId': data['id']});
  }
}
