# **ROUTING**

## **How Routing Works?**:
Routing is determining the best path for data packets to travel across different networks from the source to destination. Like a GPS for data. They use routing tables to makes decisions. Routing ensures data meets its destination quickly and efficiently. Routing is fundamental for the internet to function smoothly.

Routing is important for DevOps Engineers as it:
- Optimises network performance 
- Ensures reliable application delivery
- Crucial for managing complex infrastructures

## **Static vs Dynamic Routing**

| **Feature**                  | **Static Routing**                            | **Dynamic Routing**                                                                      |
|---|---|---|
| **Configuration**            | Routes are manually configured by a network administrator.                 | Routes are automatically updated using routing protocols.                                  |
| **Adaptability**             | No. Manual changes are required if the network topology changes.           | Automatically adapts to changes in the network (e.g., new routes, failures).                         |
| **Complexity**               | Simple to configure in small networks.                                     | More complex and requires configuring routing protocols.                                         |
| **Network Size Suitability** | Best for small, simple, and stable networks.                               | Ideal for large and dynamic networks where routes frequently change.                                |
| **Overhead**                 | No additional bandwidth or CPU usage once routes are set.                  | Requires additional resources (bandwidth and CPU) for protocol communication.                       |
| **Maintenance**              | Requires manual intervention to maintain and update routes.                | Minimal maintenance, routing protocols handle updates.                                               |
| **Examples**                 | Manually setting routes on a router (e.g., via command line).              | OSPF (Open Shortest Path First), RIP (Routing Information Protocol), BGP (Border Gateway Protocol). |
| **Convergence Time**         | No convergence time, routes are fixed.                                     | Has convergence time, as routers take time to update and agree on new routes.                         |
| **Security**                 | More secure as there is no automatic route sharing.                        | Less secure due to automatic route updates, may require additional security measures.              |

**Key Differences between Static and Dynamic Routing**: Static Routing is manually configured and does not automatically adapt to changes in the network. The paths are fixed and dont update unless an admin changes them. It is simple but not scaleable.
Dynamic Routing automatically discovers and updates routes using routing protocols like OSPF, RIP, or BGP to find the best path. It is scalable and adaptable.

## **Common Routing Protocols (BGP, OSPF etc)**
Roiuting protocols use algorithms that determine the best path for data to travel from one destination to another.
Routing protocols are essential as they automate the process of determining the best route for data to travel accross a network. Instead of setting up routes, these protocols do the heavy lifting for you. Routing protocols also enhance network efficiency, they ensure the data or packets you send take the most efficient path, reducing congestion and improving your overall performance. Two common routing protocols are OSPF and BGP.

- **OSPF**: "Open Shortest Path First" is a dynamic link-state routing protocol that is typically used in a large organisation's network. It is designed to find the shortest path for data to travel between routers using a method called Dijkstra's algorithm. A link-state protocol considers the status of a network and the links/cost to use them. It has a fast conversion (can quickly recalculate routes) when there are changes in a network.
- **BGP**: "Border Gateway Protocol" is a dynamic path-vector routing protocol primarily used to route traffic between different autonomous systems (AS), such as between ISPs (Internet Service Providers) or large organisations. It is the protocol that makes the internet work by managing how packets are routed across the web. BGP uses a path vector, this means it maintains the path formation that gets updated dynamically as the network topology changes. BGP allows network admins to define routing policies based on various attributes, this provides greater control over how traffic flows through the network.
