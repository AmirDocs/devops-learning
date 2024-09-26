# **DNS (DOMAIN NAME SYSTEM)**

## **DNS Overview**:
DNS (Domain Name System) translates human-friendly domain names (like www.amirbeile.co.uk) into IP addresses (like 192.168.20.1). This simplifiest navigation on the internet, essential for accessing websites and services.

## **DNS Components**:

### **Name servers**: 
A name server is a specialised server which is responsible for handling DNS queries, translating domain names (like www.amirbeile.co.uk) into IP addresses (like 192.168.20.1). There are two types of Name Servers **Authoritative** and **Recursive**.

1) **Authoritative DNS Servers**: This server holds the actual DNS records for a domain, loading the DNS settings and configurations. They respond to queries with the IP address of the domain. If the recursive server queries the name server, the authoritative server provides the IP address linked it. Entering `dig ns example.com` on terminal will provide you with the name servers.
2) **Recursive DNS Servers (Resolvers)**:
When you you type a Domain name in a browser, the recursive DNS server finds its IP address. If it does not have the address cached/saved, it queries other DNS servers (such as authoritative) until it finds the right IP address.

### **Zone Files**: 
Zone files are stored inside name servers and contain information about the Domain. They help name servers answer queries on how to get to a Domain. They are in an organised and readable format.

### **Records**: 
A zone file is compromised of multiple resource records. Each record contains specific information about hosts, name servers and various other resources. Some components of resource records are listed below:

| **Components of Resorce records**    | **Description** |
|---|---|
| **Record name**         |  The Domain name being queried  |
| **Time to Live (TTL)**  |  Indicates how long the record is valid  |
| **Class**               |  Namespace of the record information  |
| **Type**                |  Type of record (A, AAAA, CNAME, MX, TXT ect.) |
| **NS**                  |  Name server record  |
| **Data**                |  The actual information corresponding to the record type. Like IP address for an A record  |

| **Type of record**    | **Description** |
|---|---|
| **A**         |  Maps a Domain to a IPv4 address  |
| **AAAA**  |  Maps a Domain to a IPv6 address  |
| **CNAME**               |  Creates an Alias for a Domain Name  |
| **MX**                |  Specifies mail server for a domain. Includes priority value |
| **TXT**                  |  Stores text information for a domain, allowing any text to be inserted into a DNS. Uses verification. SPF data and other metadata   |

### **How does DNS work?**: 
#### **DNS hierachy and distribution**: 
This hierachy ensures that when you type a web address into a browser, it can quickly find the correct IP address to connect to.

![Screenshot 2024-09-26 004810](https://github.com/user-attachments/assets/bb2d633f-39b8-4cef-be29-d589511f2985)

#### **DNS Resolution Process Overview**: 
The DNS resolution process is the process where a domain name (like www.amirbeile.co.uk) is translated into an IP address (such as 192.0.20.1),
1) **Enter Domain**: User enters domain name When you type "amirbeile.co.uk" into a web browser, the browser sends a reques to a DNS resolver. 
2) **Browser Cache**: The DNS does a query, when it recieves the request, it starts looking for the IP address, checking the local cache. If it is not found it, the search moves to the root server. 
3) **root DNS Server**: The root server does not yet know the microsoft Domain but it knows where to direct the query next, based on the `.com` Top-Level Domain (TLD) of the requested domain
4) **TLD DNS Server**: If stil unsuccesful, the site then queries the `.com TLD server`. The TLD server doesnt know the exact IP address of amirbeile.co.uk but it knows which authoritative server to ask. 
5) **Authoritative DNS Server***: Finally the resolver queries the authoritative name server amirbeile.co.uk. This server contains the DNS records for the domain, such as A records (IP addresses), MX records (mail servers), and other information. This server also has a definitive IP address and the IP address is returned to your DNS resolver and back to your browser.

*Importance of DNS Resolution for DevOps Engineers!: Ensures service availabiliy. Essemtial for troubleshooting DNS issues. Critical for configuring and managing network services.*

### **Domain Registrar vs DNS Hosting Provider**:

| **Feature**              | **Domain Registrar**                                | **DNS Hosting Provider**                        |
|---|---|---|
| **Main Function**        | Registers and manages the ownership of domain names | Manages DNS records and resolves domain to IP addresses |
| **Examples**             | GoDaddy, Cloudflare, Amazon Route 53                | Cloudflare, Amazon Route 53, Google Cloud DNS           |
| **Primary Role**         | Ensures you legally own a domain name               | Ensures users can resolve your domain to reach your services |
| **Handles DNS Queries?** | No, unless they also offer DNS hosting services     | Yes, responds to DNS queries and translates domains into IP addresses  |
| **Provides DNS Records?**| No, unless bundled with DNS hosting                 | Yes, manages DNS records like A, CNAME, MX, etc.        |

When you purchase a domain, you need a DNS zone to be hosted on a DNS name server. The process varies depending on whether the DNS hosting provider is the same as the registrar. If they are the same company, it is automatically created and hosted. If they are different companies, for example you have your domain registrar on Cloudflare but your hosting provider zone is AWS, you will need to provide the name server information where the DNS zone is already hosted. The process to do this is the **DNS resolution/query process** above.

### **Network Debugging Tools `nslookup` and `dig`**:

- `nslookup`: name server look up will display the server's IP address (usually router), its port in the `#` column, and its non-authoritative answer (which means it came back from a cache and not directly from the authoritative DNS server)
- `dig`: A domain information groper is essentially a powerful version of `nslookup` with a question section, answer section, query time and other useful information.

### **/etc/hosts File**:
A /etc/hosts File is a local file on your computer which maps domain names to IP address. a host file takes precedence over DNS settings, overides them and providing an alternative IP address for specific entries. When you type a domain into your browser, it first checks this file.