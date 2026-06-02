finding from pcap file target file ip address 192.168.56.101

| Source IP      | Destination IP | Protocol | Frames | Data   |
| -------------- | -------------- | -------- | ------ | ------ |
| 192.168.56.101 | 192.168.56.102 | SSH/TCP  | 322    | ~45 KB |

Network Traffic Findings Table

| Timestamp        | Src IP         | Dst IP         | Protocol | Size    | Notes                             |
| ---------------- | -------------- | -------------- | -------- | ------- | --------------------------------- |
| 00:00:00 – 04:40 | 192.168.56.101 | 192.168.56.102 | SSH      | ~45 KB  | Encrypted interactive SSH session |
| 00:13:59         | 192.168.56.102 | 192.168.56.100 | TCP      | ~1.8 KB | Minor network communication       |
| 03:10:00+        | Various        | Broadcast      | UDP      | <1 KB   | Normal broadcast traffic          |

Analysis of the network capture identified primarily SSH traffic between 192.168.56.101 and 192.168.56.102. A total of 322 packets exchanged approximately 45 KB of
encrypted data over a single session lasting about 280 seconds. No communication with the suspected C2 address 203.0.113.88 was observed. No HTTP POST requests, FTP
transfers, DNS tunneling, or large outbound data transfers indicative of exfiltration were detected. Network activity appears limited to encrypted SSH communication
and routine broadcast traffic.
