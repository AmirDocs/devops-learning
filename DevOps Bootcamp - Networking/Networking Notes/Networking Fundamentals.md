# **NETWORKING FUNDAMENTALS**

***Networking Contents:***
1) Networking Fundamentals
2) OSI Model
3) DNS
4) Routing 
5) Subnetting
6) Network Troubleshooting
7) Cloud-Native Networking 
8) Hands-on Networking

## **Computer Networks Overview**:
A Computer network is a system of interconnected devices, such as computers, servers, and routers, that communicate and share data. These networks enable you to carry out data exchanges, resource sharing, and communication across various locations, with common types including Local Area Networks (LAN), Wide Area Networks (WAN), and the internet. They are the foundation of digital communication.

**Role of Networking in DevOps**?
- Server Interaction: Enables communication between servers and applications.
- Deployment: Critical for launching and updating applications.
- Management: Crucial in monitoring and managing infrastructure.
- Optimisation: Enhances troubleshooting, peformance and scalability.

## **LAN & WAN**:
- **LAN**: Covers a small geographic area, like a home, office, or building. Provides high-speed connectivity and is used for connecting devices within a single location such as printers and files.

- **WAN**: Covers a larger geographic area, such as cities, countries, or even globally. WANs connect multiple LANs together (also enabling communication and data transfer) and typically have slower speeds due to the vast distances involved.

## **Key Networking Components**:
These key components, **Switches**, **Routers** and **Firewalls**, form the backbone of any network.
- **Switches**: A switch is a networking device that connects multiple devices within a LAN (Local Area Network) and manages data flow within it. It uses MAC addresses to forward data to the correct device within the network, preventing congestion and ensuring efficient communication between devices like computers, printers, and servers.

- **Routers**: A router is like a traffic cop for your network. It connects different networks, such as a home network (LAN) to the internet (WAN). It directs traffic between these networks using IP addresses, ensuring that data packets are sent to the correct destination across networks.

- **Firewalls**: A firewall is a security device that monitors and controls incoming and outgoing network traffic. It acts as a barrier between a trusted internal network and untrusted external networks, blocking or permitting data based on predefined security rules to prevent unauthorised access.

## **IP Address & MAC Address**:
IP addressing assigns unique identifiers (IP addresses). It allows devices to locate and communicate with each other over the internet or local networks. The two main types of IP addresses are **IPv4** and **IPv6**. 
### IPv4 (Internet Protocol version 4): 
- Uses a 32-bit address space.
- Written as four decimal numbers separated by dots (**192.168.0.5**)
 - Supports around 4.3 billion addresses.
### IPv6 (Internet Protocol version 6): 
- Uses a 128-bit address space.
- Written in eight groups of hexadecimal digits separated by colons (**2001:0db8:85a3:0000:0000:8a2e:0370:7334**).
- Supports an enormous number of addresses (approximately 340 undecillion or $3.4 \times 10^{38}$).
- In IPv6 `::` means the segments are zero. 
  + `2001:db8 means 2001:db8` --> Last 6 are zero
  + `2001:db8::1234:5678` --> middle 4 segments are zero.

IP addresses can either be **static** (permanently assigned to a device) or **dynamic** (temporarily assigned from an existing pool of addresses)

### MAC (Media Access Control) Addresses:
Each device on a network has its own unique MAC address. A MAC address is a unique identifier assigned to a network interface. 
- Typically a 48-bit address written in hexadecimal or dashes, divided into six pairs (**00:1A:2B:3C:4D:5E**).
- Operates at the data link layer (layer 2) and helps devices identify each other on a local network, making sure data packets get to the right place. Essential for network communication and security.

## **Ports & Protocols: TCP, UDP**:
Ports and Protocols are essential concepts in computer networking that help facilitate communication between devices.

### **Ports**:
- A port is a virtual point on a network where connections start and end. Ports are used to distinguish different types of network traffic coming to a device. Think of ports as doorways through which data can enter or leave.
- Each port is identified by a number (ranging from 0 to 65535), examples are port 80 for HTTP, port 443 for HTTPS and Port 25 for SMTP (email).

### **Protocols**:
Protocols are sets of rules that govern how data is transmitted across a network. TCP and UDP are two common transport layer protocols. They define how data is sent between devices.

#### **TCP (Transmission Control Protocol)**:
- Connection-oriented protocol which establishes a reliable connection or before data is sent. Establishes connection with a a handshake process (SYN, SYN-ACK, ACK).
- Data is sent in a sequence, ensuring that packets arrive in order and are reassembled correctly.
- Error checks and is reliable enough that if a packet is lost, it is retransmitted.
- Used in Email (SMTP), web browsing (HTTP/HTTPS), file transfers (FTP).
#### **UDP (User Datagram Protocol)**:
- Connectionless protocol which does not establish a connection before sending data.
- Unreliable as it does not guarantee that all packets (datagrams) will arrive or arrive in the correct order.
- Faster due to skipping the overhead of connection setup and error-checking.
- Used in Streaming media (video/audio), online gaming, DNS queries, VoIP, where speed is prioritised over reliability.

#### **TCP vs UDP**:
| Feature | TCP | UDP |
| --- | --- | --- |
| **Connection type** | Connection-oriented | Connectionless |
| **Reliability** | Reliable, ensures data delivery and order | Less reliable. no guarantee of delivery on order |
| **Speed** | Slower due to overhead of connection setup | Faster, no connection or handshake setup required |
| **Error checking** | Error checking and flow control | No error checking and flow control |





