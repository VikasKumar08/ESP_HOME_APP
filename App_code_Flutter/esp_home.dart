// ignore_for_file: use_build_context_synchronously, duplicate_ignore, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'relay_button.dart';

class ESPHome extends StatefulWidget {
  const ESPHome({super.key});

  @override
  _ESPHomeState createState() => _ESPHomeState();
}

class _ESPHomeState extends State<ESPHome> {
  String? espAddress;

  @override
  void initState() {
    super.initState();
    loadESPAddress();
  }

  Future<void> loadESPAddress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      espAddress = prefs.getString('esp_address') ?? 'http://192.168.4.1';
    });
  }

  Future<void> saveESPAddress(String address) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('esp_address', address);
    setState(() {
      espAddress = address;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ESP address updated!')),
    );
  }

  Future<void> sendCommand(String endpoint) async {
    if (espAddress == null) return;
    try {
      final response = await http.get(Uri.parse('$espAddress$endpoint'));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Command sent successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed: ${response.statusCode}')),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController addressController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ESP Relay Control Panel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Update ESP Address'),
                    content: TextField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        labelText: 'Enter New ESP Address',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          saveESPAddress(addressController.text);
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: ListTile(
                title: const Text('ESP Address'),
                subtitle: Text(espAddress ?? 'Not Set'),
                trailing: const Icon(Icons.wifi),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Two buttons per row
                mainAxisSpacing: 16, // Smaller spacing
                crossAxisSpacing: 16,
                childAspectRatio: 1.8, // Adjust ratio for compact buttons
                children: [
                  RelayButton(
                    label: 'Relay 1 ON',
                    icon: Icons.power,
                    onPressed: () => sendCommand('/relay1/on'),
                  ),
                  RelayButton(
                    label: 'Relay 1 OFF',
                    icon: Icons.power_off,
                    onPressed: () => sendCommand('/relay1/off'),
                  ),
                  RelayButton(
                    label: 'Relay 2 ON',
                    icon: Icons.power,
                    onPressed: () => sendCommand('/relay2/on'),
                  ),
                  RelayButton(
                    label: 'Relay 2 OFF',
                    icon: Icons.power_off,
                    onPressed: () => sendCommand('/relay2/off'),
                  ),
                  RelayButton(
                    label: 'Relay 3 ON',
                    icon: Icons.power,
                    onPressed: () => sendCommand('/relay3/on'),
                  ),
                  RelayButton(
                    label: 'Relay 3 OFF',
                    icon: Icons.power_off,
                    onPressed: () => sendCommand('/relay3/off'),
                  ),
                  RelayButton(
                    label: 'Relay 4 ON',
                    icon: Icons.power,
                    onPressed: () => sendCommand('/relay4/on'),
                  ),
                  RelayButton(
                    label: 'Relay 4 OFF',
                    icon: Icons.power_off,
                    onPressed: () => sendCommand('/relay4/off'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
