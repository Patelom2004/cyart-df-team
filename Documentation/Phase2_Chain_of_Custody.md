
Item ID	Description	         Collected By	Date	         SHA-256 (truncated)	Verified

EV-001	Disk Image (.E01)	         Forensic Analyst	2025-05-26	         	         Yes/No

EV-002	Memory Dump (.raw)	Forensic Analyst	2025-05-27	         	         Yes/No

EV-003	Network Capture (.pcap)	Forensic Analyst	2025-05-28	         	         Yes/No

EV-004	Volatile Process Log(.csv)	Forensic Analyst	2025-06-01	         	         Yes/No


Incident ID: INC-2026-0375 

Target System: WS-FINANCE-01 (192.168.0.90) 

Attack Type:  Phishing

C2 Server: 202.0.113.110:4444

Phishing Email

         ↓
   
User opens Word document

         ↓
   
Macro execution

         ↓
   
svchost32.exe installed

         ↓
   
Persistence (Registry Run key)

         ↓
   
C2 beaconing (202.0.113.110:4444)

         ↓
   
Data exfiltration (38 MB Malware.zip)

         ↓
   
Log clearing (anti-forensics)

