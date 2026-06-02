I got the IOC from the Phase 6

**Indicators of Compromise (IOCs)**

| Attribute          | Value                                              | Notes                         |
| ------------------ | -------------------------------------------------- | ----------------------------- |
| File Name          | svchost32.exe                                      | Suspected malware             |
| SHA-256            | N/A                                                | Not yet extracted from sample |
| Related Archive    | Important.rar                                      | Opened by WinRAR              |
| C2 Address         | 203.0.113.88:4444                                  | Network callback              |
| User Path          | C:\Users\Alissa Simpson\Documents\Important.rar    | Observed in memory            |
| Suspicious Process | svchost32.exe                                      | Malware payload               |
| Service Context    | svchost.exe -k imgsvc                              | PID 2660                      |
| Persistence        | HKCU\Software\Microsoft\Windows\CurrentVersion\Run | Suspected Run Key             |

