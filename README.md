# ESP_HOME_APP
This project leverages an ESP8266 microcontroller to control four relays via Wi-Fi using the ESPHome app. The relays can toggle connected appliances, making the system suitable for home automation purposes. Users can send HTTP requests from the ESPHome app or other HTTP clients to control the relays remotely.

Key Features:
Wi-Fi Connectivity:

The ESP8266 connects to a local Wi-Fi network, enabling remote access via HTTP requests.
Relay Control:

Four relays are interfaced with the ESP8266, allowing control of multiple devices.
Each relay can be independently toggled on or off.
ESPHome Integration:

Easy configuration using YAML in the ESPHome framework.
Compatibility with Home Assistant for extended automation capabilities.
HTTP API:

The system accepts HTTP GET/POST requests to toggle the relay states.
Example request: http://<ESP_IP>/relay1/on or http://<ESP_IP>/relay2/off.
Real-Time Status:

The system provides feedback on the current state of the relays via HTTP or integration with a dashboard.
Scalability and Low Power:

Designed for energy efficiency and the ability to expand by adding more relays or features.
Components Used:
Hardware:

ESP8266: Acts as the main controller and Wi-Fi module.
4-Channel Relay Module: Controls connected appliances.
Power supply, resistors, and connecting wires.
Software:

ESPHome framework for firmware creation.
ESPHome app or Home Assistant for controlling the relays.
HTTP client for sending direct requests (e.g., a browser, Postman, or a custom app).
Applications:
Smart Home Automation.
Remote control of lights, fans, or other appliances.
Industrial automation systems.
Future Enhancements:
Add MQTT support for better integration with IoT platforms.
Include real-time energy monitoring for connected devices.
Add a web-based GUI for controlling the relays without external apps.
This project demonstrates a cost-effective and scalable approach to implementing IoT-based automation using widely available components and software.
