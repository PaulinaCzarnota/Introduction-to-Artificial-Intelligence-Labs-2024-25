This repository contains a collection of labs from the Client-Server Programming module, completed during the third year of the Computer Scienc program at TU Dublin.

# Lab Summaries

### Lab 1: Ubuntu 14.04.5 Setup & Basic Linux Commands
This lab involves setting up a Virtual Machine (VM) running **Ubuntu 14.04.5** and connecting to it via SSH. The lab covers essential Linux commands for directory and file management, system information, network configurations, and process management. Tools like **PuTTY** are used for SSH access, and participants learn to interact with the terminal to execute basic commands.

### Lab 2: Network Traffic Analysis with Wireshark
This lab focuses on using **Wireshark** to capture and analyze network traffic. Participants generate network traffic by visiting websites and examine the **HTTP** packets captured. Key tasks include installing **Wireshark**, analyzing traffic through various protocol layers, and understanding the raw data transmitted over the network.

### Lab 3: Setting up the Virtual Network Environment
In this lab, participants configure a virtual network environment using **Oracle VM VirtualBox**. Two VMs are downloaded and set up, ensuring proper network adapter configurations and IP addressing. The VMs are connected via SSH, and tools like the **GCC** compiler are installed to prepare the environment for further client-server development exercises.

### Lab 4: Basic Client-Server Application Development with Berkeley Sockets
This lab introduces client-server programming using the **Berkeley Socket API**. A simple client-server application is developed where the client requests the server’s date and time. The necessary directory structure is created, and the source code for the client and server is written and compiled. The client and server are then executed on separate VMs to ensure successful communication between the two using **TCP/IP sockets**.

### Lab 5: Client-Server Application Development Using Berkeley Socket API
In this lab, participants extend their knowledge of client-server application development using the **Berkeley Socket API**. A simple **echo server** and **client** are created to communicate over a networked environment. The lab also involves writing a script to automate the process of compiling **C** source files, testing daytime client and server applications, and modifying the echo server and client to handle input messages.

### Lab 6: TCP Connections and HTTP Protocol
This lab reinforces the understanding of **TCP connections** using the `netstat` command and introduces the basics of **HTTP communication** using **telnet**. Client-server applications developed in previous labs are run and modified to integrate **HTTP** interaction. The lab also covers using `netstat` to observe **TCP connection states** and **HTTP requests** using telnet and command-line HTTP clients.

### Lab 7: Basic HTTP Server
In this lab, participants create a basic **HTTP server** capable of responding to **HTTP GET** requests. The lab begins by modifying the `echoServer.c` source code and then implements basic HTTP response handling, including providing a **200 OK** response for a valid resource and a **404 error** response for missing resources. The server handles incoming HTTP requests, extracts necessary information, and sends appropriate responses to clients. The server is tested using both a command-line HTTP client and a web browser.

# Environment Setup

To ensure the exercises run smoothly, the following networked environment must be in place, as per instructions from previous lab exercises:

- **VM1** should be configured with IPv4 address: **192.168.1.11**
- **VM2** should be configured with IPv4 address: **192.168.1.12**

### Required Tools:
- **PuTTY** for SSH access
- **Wireshark** for network traffic analysis
- **GCC** compiler for C language code compilation
- **Oracle VM VirtualBox** for virtualized network environment setup
