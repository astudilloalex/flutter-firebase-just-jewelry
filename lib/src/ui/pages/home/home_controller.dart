import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/data/data.dart';
import 'package:just_jewelry/src/domain/domain.dart';
import 'package:just_jewelry/src/ui/utilities/exception_to_string.dart';

class HomeController extends GetxController {
  HomeController({
    required this.categoryFirebase,
    required this.jewelFirebase,
  });

  // Firebase data layer api connection
  final CategoryFirebase categoryFirebase;
  final JewelFirebase jewelFirebase;

  // Categories info.
  final List<Category> _categories = [];
  bool _loadingCategories = true;
  bool get loadingCategories => _loadingCategories;
  List<Category> get categories => _categories;

  // Jewels info.
  final List<Jewel> _jewels = [];
  bool _loadingJewels = true;
  bool get loadingJewels => _loadingJewels;
  List<Jewel> get jewels => _jewels;

  /// Load jewel categories, on exception returns a message otherwise null.
  Future<String?> loadCategories() async {
    try {
      if (!_loadingCategories) {
        _loadingCategories = true;
        update(['categories']);
      }
      _categories.addAll(await categoryFirebase.findAll(size: 100));
      return null;
    } on FirebaseException catch (e) {
      return firebaseExceptionToString(e);
    } on Exception catch (e) {
      return e.toString();
    } finally {
      _loadingCategories = false;
      update(['categories']);
    }
  }

  /// Load jewels, on exception returns a message otherwise null.
  Future<String?> loadJewels() async {
    try {
      if (!_loadingJewels) {
        _loadingJewels = true;
        update(['jewels']);
      }
      _jewels.addAll(await jewelFirebase.findAll(size: 13));
      return null;
    } on FirebaseException catch (e) {
      return firebaseExceptionToString(e);
    } on Exception catch (e) {
      return e.toString();
    } finally {
      _loadingJewels = false;
      update(['jewels']);
    }
  }
}
