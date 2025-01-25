import 'dart:collection';

import 'package:game/design_patterns/iterator/tree_collections/breadth_first_tree_collection.dart';
import 'package:game/design_patterns/iterator/tree_iterators/itree_iterator.dart';

class BreadthFirstIterator implements ITreeIterator {
  final BreadthFirstTreeCollection treeCollection;
  final Set<int> visitedNodes = <int>{};
  final ListQueue<int> nodeQueue = ListQueue<int>();

  final int _initialNode = 1;
  int _currentNode;

  // يتم تعيين _currentNode بشكل مباشر في تعريفه
  BreadthFirstIterator(this.treeCollection) : _currentNode = 1 {
    nodeQueue.add(_initialNode);
  }

  Map<int, Set<int>> get adjacencyList => treeCollection.graph.adjacencyList;

  @override
  bool hasNext() {
    return nodeQueue.isNotEmpty;
  }

  @override
  int getNext() {
    if (!hasNext()) {
      throw StateError("No more elements.");
    }

    _currentNode = nodeQueue.removeFirst();
    visitedNodes.add(_currentNode);

    adjacencyList[_currentNode]?.forEach((n) {
      if (!visitedNodes.contains(n)) {
        nodeQueue.addLast(n);
      }
    });

    return _currentNode;
  }

  @override
  void reset() {
    _currentNode = _initialNode;
    visitedNodes.clear();
    nodeQueue.clear();
    nodeQueue.add(_initialNode);
  }
}