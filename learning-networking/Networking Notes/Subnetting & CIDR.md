# **subnetting & CIDR**

## **Subnetting Basics: CIDR notation & Subnet masks etc.**
**Subnetting** is the process of dividing a larger network (IP address block) into smaller, more manageable sub-networks, or subnets. It helps optimise IP address allocation, improve network performance, and enhance security by isolating network segments.
**CIDR** (Classless Inter-Domain Routing) is a method for allocating and routing IP addresses more efficiently than the traditional IP address classes (Class A, B, C). CIDR enables flexible subnetting by using a suffix to indicate the number of bits in the network portion of an IP address `IP_address/Prefix_length` = 192.168.1.0/24.

### **Understanding CIDR Exercise**:
```math
192.168.0.0/24 = 
192/.168.0.255 (256 IPs)
```
```math
192.168.0.0/16 = 
192.168.255.255 (65,536 IPs)
```
```math
134.56.78.123/32 = 
134.56.78.123 (Single IP)
```
```math
0.0.0.0/0
(All IPs)
```
https://www.ipaddressguide.com/cidr

## **Binary Basics**
A binary system is a base-2 number system and therefore only uses the digits, 0 and 1. In binary, each position represents a power of 2, similar to how each position in a decimal number represents a power of 10. The rightmost digit is the least significant bit, while the leftmost digit is the most significant bit.

![Screenshot 2024-09-28 133258](https://github.com/user-attachments/assets/33331cb3-69f9-401e-b0f2-cd4fbd9fa053)

**How to convert an IP Address (decimal) into binary form?**
To convert a decimal number to binary, divide the number by 2 and record the remainder (Use the lower number if it is not a complete number (example: 19 /2 = 9, remainder 1)). Continue dividing the quotient by 2 until the quotient is 0. The binary number is the remainders read in reverse order (from bottom to top).

**192.168.1.1** in binary: 

| **1st**                | **2nd**                    | **3rd**               | **4th**              |
|---|---|---|---|
| 192/2 = 96, remainder 0 | 168/2 = 84, remainder 0 | 1/2 = 0, remainder 1    | 1/2 = 0, remainder 1 |                   
| 96/2 = 48, remainder 0  |  84/2 = 42, remainder 0 |                         |                      | 
| 48/2 = 24, remainder 0  |  42/2 = 21, remainder 0 |                         |                      |
| 24/2 = 12, remainder 0  |  21/2 = 10, remainder 1 |                         |                      |
| 12/2 = 6,  remainder 0  |  10/2 =  5, remainder 0 |                         |                      |
| 6/2  = 3,  remainder 0  |   5/2 =  2, remainder 1 |                         |                      | 
| 3/2  = 1,  remainder 1  |   2/2 =  1, remainder 0 |                         |                      |
| 1/2  = 0,  remainder 1  |   1/2 =  0, remainder 1 |                         |                      |
|     **11000000**        |      **10101000**       |       **00000001**      |     **00000001**     |

***Read remainders in reverse !***

## **Calculating subnets and host ranges**
A Subnet (short for subnetwork) allows you to break down a large IP network into smaller, more manageable networks. This helps improve network performance, efficiency, and security by organising how IP addresses are distributed and how traffic flows within the network.
A **Subnet Mask** is used to divide an IP address into a network and host portions. It helps routers determine which part of an IP address is a network address and which part is a host address.


### **Subnet Mask 8-bit Octet calculation chart**:

If all the values in an 8 bit Octet Chart are added up. This will equal 255. To find the binary form of a number, use the least amount of values you can.

1) Example IP Address 1. Subnet is: **255.255.`224`.0** in binary form is **11111111.11111111.11100000.00000000**

| **128** | **64** | **32** | **16** | **8** |  **4** | **2** | **1** |
|---|---|---|---|---|---|---|---|
|    1    |    1   |    1   |   0    |   0   |   0    |   0   |   0   |

124 + 64 + 32 = **224**

2) Example IP Address 2. Subnet is: **172.16.1.0** in binary form is **10101100.00010000.00000001.00000000**

3) Example IP Address 3. Subnet is: **192.168.1.0** in binary form is **11000000.10101000.00000001.00000000**

To find out the portion of the subnet that is a network vs host, simply line up the IP Address with the subnet mask:

2) Using Example IP Address 2 **192.168.1.0** with subnet mask **255.255.255.0**. The first three Octets is the Network (1) portion  and the last three Octets is the Host (0): 

| **11000000.10101000.00000001.00000000** | 
|---|
| **11111111.11111111.11111111.00000000** |

![alt text](<Screenshot 2024-09-28 232319.png>)

## **NAT (Network & Address Translation)**
Network Address Translation (NAT) is a technique used to translate private IP addresses to a public IP address. information in IP packet headers while they are in transit across a router or firewall. NAT allows multiple devices on a private network to share a single public IP address when accessing the internet.

### **How NAT works**:
*Below an internal device connects to a router and then an external network. Then the external network connects back to the router and the router connects to the internal device*
Internal devices using private IP addresses. Router receives internal IP source and destination and translates the sources private IP addresses to a Public IP before connecting to the external network. The external network then connects back to the router (public IP) and the router connects to the internal device. This translation facilitates communication with external networks.

### **Types of NAT**:
- **Static NAT**: Maps a single private IP address to a single public IP address. Each private IP address is mapped to a unique public IP address. This is used when you want specific devices to always use the same public IP address for external communications. **One-to-One Mapping**

- **Dynamic NAT**: Maps a private IP address to one of many public IP addresses, from a pool of options. The router dynamically assigns available public IP addresses to internal devices as needed. When there are more devices than public IP addresses, some devices may not be able to connect at the same time. **Many-to-Many Mapping**

- **PAT (Port Address Translation) or NAT Overload**: This is the most common form of NAT used in home networks. PAT is super efficient. Multiple devices inside a private network share a single public IP address, with unique port numbers to distinguish each connection. **Many-to-One Mapping**

NAT is important for engineers because it conserves public IP addresses, enhances network security  and simplifies network design and management.



