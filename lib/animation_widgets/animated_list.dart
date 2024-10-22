//AnimatedList is a widget that allows you to create lists where items can be added,
// removed, or animated dynamically.
//It's ideal for lists that need to update in response to user input or real-time changes,
// while animating the appearance and disappearance of list items.
//

/*
1. Properties of AnimatedList
itemBuilder:

Type: IndexedWidgetBuilder
This is required and defines the layout and design of each item in the list.
It takes two parameters:
context: The BuildContext of the list.
index: The index of the item in the list.

initialItemCount:

Type: int
Defines the number of items to show when the list is first created.
key:

Type: GlobalKey<AnimatedListState>
This key allows you to add or remove items programmatically by using the AnimatedListState.

scrollDirection:

Type: Axis
This property specifies the scroll direction of the list, either vertical (Axis.vertical, which is the default) or horizontal (Axis.horizontal).

shrinkWrap:

Type: bool
When set to true, the list only occupies the space it needs instead of expanding to fill its parent.

reverse:

Type: bool
If true, the list is reversed, meaning the list starts from the bottom or right.

physics:

Type: ScrollPhysics
This controls the behavior of scrolling, such as allowing bouncing or other scroll behaviors.




1. Adding an Item
When you add an item to the list, you:

Update the data source: Add the item to your list that holds the data (_listItems in your case).
Trigger the UI to reflect the addition: Use the insertItem() method of AnimatedListState to trigger the insertion animation and update the UI.
Steps to Add an Item:
Update the data source: Add the new item to the _listItems list (or whichever list you are using to store the data).

Update the UI: Call the insertItem() method on the AnimatedList key, passing the index where the new item was added.


What's happening:
_listItems.add() adds a new item to the list.
_listKey.currentState!.insertItem() tells the AnimatedList to insert the new item at a specific position, triggering the insertion animation.


2. Removing an Item
When removing an item from the list, you:

Update the data source: Remove the item from the list (_listItems).
Trigger the UI to reflect the removal: Use the removeItem() method of AnimatedListState to trigger the removal animation before the item is fully removed from the UI.
Steps to Remove an Item:
Update the data source: Remove the item from your _listItems list.

Update the UI: Call the removeItem() method on the AnimatedList key, passing the index of the item to be removed, along with an animation to display as the item disappears.

What's happening:
_listItems.removeAt() removes the item from your list.
_listKey.currentState!.removeItem() tells the AnimatedList to animate the removal at a specific index, and it also specifies how the removed item should animate out of view using SizeTransition.


*/



import 'package:flutter/material.dart';

class AnimatedListExample extends StatefulWidget {
  const AnimatedListExample({super.key});

  @override
  _AnimatedListExampleState createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
  int _nextItem = 4;

  void _addItem() {
    _items.add('Item $_nextItem');
    _listKey.currentState!.insertItem(_items.length - 1);
    _nextItem++;
  }

  void _removeItem(int index) {
    final String removedItem = _items.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildItem(removedItem, animation),
    );
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          title: Text(item),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _removeItem(_items.indexOf(item));
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List Example'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addItem,
          )
        ],
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index], animation);
        },
      ),
    );
  }
}


