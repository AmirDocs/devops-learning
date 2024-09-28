# **Subnetting & CIDR**

## **Subnetting Basics: CIDR notation & Subnet masks etc.**
**Subnetting** is the process of dividing a larger network (IP address block) into smaller, more manageable sub-networks, or subnets. It helps optimise IP address allocation, improve network performance, and enhance security by isolating network segments.
**CIDR** (Classless Inter-Domain Routing) is a method for allocating and routing IP addresses more efficiently than the traditional IP address classes (Class A, B, C). CIDR enables flexible subnetting by using a suffix to indicate the number of bits in the network portion of an IP address `IP_address/Prefix_length` = 192.168.1.0/24.

## **Binary Basics**
A binary system is a base-2 number system and therefore only uses the digits, 0 and 1. In binary, each position represents a power of 2, similar to how each position in a decimal number represents a power of 10. The rightmost digit is the least significant bit, while the leftmost digit is the most significant bit.

![alt text](<Screenshot 2024-09-28 133258.png>)

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
|           Read remainders in reverse                                                               |
|     **11000000**        |      **10101000**       |       **00000001**      |     **00000001**     |



## **Calculating subnets and host ranges**

## **NAT (Network & Address Translation)**
