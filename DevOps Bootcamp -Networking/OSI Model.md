# **OSI MODEL**

## **Overview of the OSI Model (layers 1-7)**:
The OSI Model (Open Systems Interconnection Model) is a conceptual framework used to standardise the functions of a network into seven distinct layers. Each layer has a specific role in handling network communication.

Communication models like the OSI Model provide a systematic approach to understanding, designing, troubleshooting, and improving communication systems. It is essential for ensuring that networks are **interoperable**, **standardised**, **scalable**, and **reliable**, breaking down complex communication processes into simpler layers, allowing for modular design, easier troubleshooting, and fostering innovation in networking technologies.

| **Layer**       | **Number** | **Description**  | **Examples**                                 |
|---|---|---|---|
| **Application**  |  7  | End user layer         | HTTP, FTP, IRC, DNS, SSH                     |
| **Presentation** |  6  | Syntax user Layer      | SSL/TLS, JPEG, MPEG, ASCII                   |
| **Session**      |  5  | Synch & send to port   | API's, Sockets, Winsock                      |
| **Transport**    |  4  | End-to-end connections | TCP, UDP                                     |
| **Network**      |  3  | Packets                | IP, ICMP, IPSec, IGMP                        |
| **Data Link**    |  2  | Frames                 | Ethernet, PPP, Switch, Bridge, MAC addresses |
| **Physical**     |  1  | Physical structure     | Coax, Fibre, Wireless, Hubs, Repeaters       |

1) **Physical/ Layer 1**: 
This layer transmits raw bit stream over a physical medium. Uses cables, switches and network interface cards.

2) **Data Link/ Layer 2**: 
This layer provides node-to-node data transfer and detects, possibly corrects errors that may occur in the physical layer. It frames data packets into organised frames for transmission and manages access to the physical medium. Uses MAC addresses, switches and bridges.

3) **Network/ Layer 3**: 
This layer determines how data is data is sent to the recipient. Manages packet fowarding including routing of data packets between devices across different networks. It also manages logical addressing and determines the best path for data delivery. Uses Internet Protocol addresses (IP), Internet Control Message Protocol (ICMP) and Open Shortest Path First (OSPF).

4) **Transport/ Layer 4**: 
This layer Ensures reliable data transfer between hosts or upper layers. It manages flow control, error correction, and segmentation of data. Uses TCP and UDP.

5) **Session/ Layer 5**: 
This layer manages sessions between applications. It establishes, maintains, and terminates connections between them, such as logging out. Uses Remote Procedure Call (RPC) NetBIOS sessions.

6) **Presentation/ Layer 6**: 
This layer translates data between the application layer and the network. It handles data formatting, encryption, and compression. Uses SSL/TLS for encryption, JPEG for image formatting, ASCII for text representation.

7) **Application/ Layer 7**: 
This layer provides network services directly to end-user applications. It enables user interfaces and application-level protocols. Uses Hypertext Transfer Protocol (HTTP), File Transfer Protocol (FTP) and Domain Name System (DNS).

## **Overview of the TCP/IP Model**:
The The TCP/IP model is another conceptual framework used to describe the process of data communication over a network. While they share some similarities with the OSI model, they differ in terms of structure, layers, and approach. This is the structure of the TCP/IP model: 

| **Layer**       | **Number** | **Description**  | **Examples**                           |
|---|---|---|---|
|                  | End user layer         | HTTP, FTP, IRC, DNS, SSH                     |
| **Application**  | Syntax user Layer      | SSL/TLS, JPEG, MPEG, ASCII                   
|                  | Synch & send to port   | API's, Sockets, Winsock                      |
|||||
| **Transport**    | End-to-end connections | TCP, UDP                                     |
|||||
| **Internet**     | Packets                | IP, ICMP, IPSec, IGMP                        |
|||||
| **Network**      | Frames                 | Ethernet, PPP, Switch, Bridge, MAC addresses |
| **Access**       | Physical structure     | Coax, Fibre, Wireless, Hubs, Repeaters       |