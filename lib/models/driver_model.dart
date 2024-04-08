
class Driver {
  final String id;
  final String name;      
  final Map<String, bool> options; // {'1': true, '2': false}

  // constructor to initalize all the class variables
  Driver( {
    required this.id,
    required this.name,
    required this.options,
  });

  // printing question in terminal
  @override 
  String toString() {
    return 'Question(id: $id, name: $name, options: $options)';
  }

}