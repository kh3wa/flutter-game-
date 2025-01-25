import 'dart:collection';

import 'package:game/design_patterns/iterator/tree_collections/depth_first_tree_collection.dart';
import 'package:game/design_patterns/iterator/tree_iterators/itree_iterator.dart';


class DepthFirstIterator implements ITreeIterator {
  final DepthFirstTreeCollection treeCollection;
  final Set<int> visitedNodes = <int>{}; // لتخزين العقد التي تم زيارتها
  final ListQueue<int> nodeStack = ListQueue<int>(); // مكدس العقد التي سيتم زيارتها

  final int _initialNode = 1; // العقدة الابتدائية
  int _currentNode; // العقدة الحالية أثناء التكرار

  DepthFirstIterator(this.treeCollection, {int initialNode = 1})
      : _currentNode = initialNode { // تعيين العقدة الأولية مباشرة هنا
    nodeStack.add(_currentNode); // إضافة العقدة الابتدائية للمكدس
  }

  // الوصول إلى قائمة التراكيب (adjacency list) من الشجرة
  Map<int, Set<int>> get adjacencyList => treeCollection.graph.adjacencyList;

  @override
  bool hasNext() {
    return nodeStack.isNotEmpty; // إذا كان المكدس يحتوي على عقد يمكن زيارتها
  }

  @override
  int getNext() {
    if (!hasNext()) {
      throw StateError("No more elements."); // لا توجد عناصر للتكرار
    }

    // إزالة العقدة الحالية من المكدس
    _currentNode = nodeStack.removeLast();
    visitedNodes.add(_currentNode); // إضافة العقدة إلى مجموعة العقد التي تم زيارتها

    // إضافة الأطفال غير المزارين بعد إلى المكدس
    for (var node in adjacencyList[_currentNode]!) {
      if (!visitedNodes.contains(node)) {
        nodeStack.addLast(node);
      }
    }

    return _currentNode; // إرجاع العقدة الحالية
  }

  @override
  void reset() {
    _currentNode = _initialNode; // إعادة تعيين العقدة إلى العقدة الابتدائية
    visitedNodes.clear(); // مسح العقد التي تم زيارتها
    nodeStack.clear(); // مسح المكدس
    nodeStack.add(_initialNode); // إضافة العقدة الابتدائية مرة أخرى إلى المكدس
  }
}