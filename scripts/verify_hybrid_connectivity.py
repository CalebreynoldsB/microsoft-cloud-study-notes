"""
Hybrid Enterprise Network Status Checker
Integrates Cisco Enterprise Gateway (200-301/350-401) with Azure VNet Gateway (AZ-104).
"""

import socket
import sys

def check_bgp_peering(neighbor_ip: str, port: int = 179) -> bool:
    """Checks TCP Port 179 (BGP) between Cisco Router and Azure ExpressRoute/VPN Gateway."""
    print(f"[*] Testing BGP Peering connection to {neighbor_ip}:{port}...")
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(5)
    try:
        result = sock.connect_ex((neighbor_ip, port))
        if result == 0:
            print(f"[+] SUCCESS: BGP Session port 179 to {neighbor_ip} is OPEN.")
            return True
        else:
            print(f"[-] ERROR: Cannot reach BGP Peer {neighbor_ip}. Error Code: {result}")
            return False
    except Exception as e:
        print(f"[-] EXCEPTION: Connection failed: {e}")
        return False
    finally:
        sock.close()

if __name__ == "__main__":
    # Example On-Premises Cisco BGP Peer & Azure VPN Peer IPs
    azure_bgp_peer = "10.254.0.254"
    print("=== Hybrid Cloud Network Diagnostics ===")
    status = check_bgp_peering(azure_bgp_peer)
    sys.exit(0 if status else 1)
