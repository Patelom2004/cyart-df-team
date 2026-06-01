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

