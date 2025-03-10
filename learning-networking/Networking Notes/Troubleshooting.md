# **TROUBLESHOOTING WITH PING/TRACEROOT/NSLOOKUP

- `ping [IP address or domain]`:
Tests connectivity
- `Traceroute [domain]`:
Tracks the path to a destination
- `nslookup [domain]`:
Queries DNS for IP addresses

## **Example Troubleshoot**:

" I can't reach a website, how can I troubleshoot? "

1) Check network connectivity with `ping`.
2) if that doesn't work `nslookup`, to verify if there is an issue with DNS.
3) Check host file to check if there is overwriting entries.
4) Check firewall rules, of any outgoing or incoming blockages.
5) Check DNS cache, clear if necessary and check system logs with `traceroute`.