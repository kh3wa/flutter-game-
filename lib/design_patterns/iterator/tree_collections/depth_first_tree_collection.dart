import 'package:game/design_patterns/iterator/graph.dart';
import 'package:game/design_patterns/iterator/tree_collections/itree_collection.dart';
import 'package:game/design_patterns/iterator/tree_iterators/depth_first_iterator.dart';
import 'package:game/design_patterns/iterator/tree_iterators/itree_iterator.dart';

class DepthFirstTreeCollection implements ITreeCollection {
  final Graph graph; // يمثل الرسم البياني الذي يحتوي على العقد

  // المُنشئ الذي يقبل كائن من نوع Graph
  const DepthFirstTreeCollection(this.graph);

  // ينشئ ويعيد الـ Iterator الذي يعمل بتقنية Depth-First
  @override
  ITreeIterator createIterator() {
    return DepthFirstIterator(this); // استخدام الـ DepthFirstIterator
  }

  // إعادة عنوان الشجرة أو طريقة التصفح
  @override
  String getTitle() {
    return 'Depth-first'; // عنوان الشجرة الذي يصف طريقة التصفح
  }
}