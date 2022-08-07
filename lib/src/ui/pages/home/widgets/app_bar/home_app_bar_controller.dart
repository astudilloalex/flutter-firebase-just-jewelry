import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/data/data.dart';
import 'package:just_jewelry/src/domain/domain.dart';
import 'package:just_jewelry/src/ui/utilities/exception_to_string.dart';

class HomeAppBarController extends GetxController {
  HomeAppBarController({
    required this.jewelFirebase,
  });

  final JewelFirebase jewelFirebase;

  final List<Jewel> _jewels = [];
  int _currentIndex = 0;
  bool _loading = true;

  Future<String?> load() async {
    try {
      if (!_loading) {
        _loading = true;
        update(['carousel', 'carouselindicator']);
      }
      _jewels.addAll(await jewelFirebase.findDiscounts());
    } on FirebaseException catch (e) {
      return firebaseExceptionToString(e);
    } on Exception catch (e) {
      return e.toString();
    } finally {
      _loading = false;
      update(['carousel', 'carouselindicator']);
    }
    return null;
  }

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    _currentIndex = index;
    update(['carouselindicator']);
  }

  List<Jewel> get jewels => _jewels;
  int get currentIndex => _currentIndex;
  bool get loading => _loading;
}
