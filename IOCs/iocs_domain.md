I got the IOC from the Phase 6

**Indicators of Compromise (IOCs)**

| Attribute          | Value                                              | Notes                         |
| ------------------ | -------------------------------------------------- | ----------------------------- |
| File Name          | svchost32.exe                                      | Suspected malware             |
| SHA-256            | N/A                                                | Not yet extracted from sample |
| Related Archive    | Important.rar                                      | Opened by WinRAR              |
| C2 Address         | 201.0.108.32:8888                                  | Network callback              |
| User Path          | C:\Users\Alissa Simpson\Documents\Important.rar    | Observed in memory            |
| Suspicious Process | svchost32.exe                                      | Malware payload               |
| Service Context    | svchost.exe -k imgsvc                              | PID 2660                      |
| Persistence        | HKCU\Software\Microsoft\Windows\CurrentVersion\Run | Suspected Run Key             |

**Process Tree **

explorer.exe
└── WinRAR.exe
    └── Opened Important.rar
         └── svchost32.exe (malicious)
              ├── Registry Run Key Persistence
              └── Data Exfiltration Activity
              
**Files Dropped**

svchost32.exe
%APPDATA%\svchost32.exe      (suspected)
Important.rar               (archive observed in memory)

**Registry Changes**

HKCU\Software\Microsoft\Windows\CurrentVersion\Run

Value Name:
svchost32

Data:
C:\Users\<User>\AppData\Roaming\svchost32.exe

**Network Callbacks**

| Source        | Destination       |
| ------------- | ----------------- |
| svchost32.exe | 201.0.108.32:8888 |
| Protocol      | TCP               |
| Purpose       | Command & Control |

