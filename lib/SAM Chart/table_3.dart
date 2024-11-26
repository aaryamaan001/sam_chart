import 'package:flutter/material.dart';

class Table3 extends StatefulWidget {
  @override
  _Table3State createState() => _Table3State();
}

class _Table3State extends State<Table3> {
  final _formKey = GlobalKey<FormState>();

  List<TextEditingController> _weightControllers =
      List.generate(16, (index) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _weightControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Weight Gain Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header for Weight on Admission and Discharge
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Weight on Admission'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Weight on Discharge'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Table headers for Days with horizontal scroll
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      16,
                      (index) => Container(
                        width: 40,
                        child: Center(
                          child: Text('${index + 1}',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Input fields for each day (16 days) with horizontal scroll
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      16,
                      (index) => Container(
                        width: 40,
                        child: TextFormField(
                          controller: _weightControllers[index],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: '0'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Save or process the weight data here
                      print(
                          "Weights saved: ${_weightControllers.map((controller) => controller.text).toList()}");
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
