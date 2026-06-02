Used MemLab1 from recommendation 

Findings from pslist

| PID        | Process      | Notes                                           |
| ---------- | ------------ | ----------------------------------------------- |
| 1984       | cmd.exe      | User-launched command prompt                    |
| 2424       | mspaint.exe  | User application                                |
| 1512       | WinRAR.exe   | Opened archive shortly before capture           |
| 796        | DumpIt.exe   | Memory acquisition tool used to create the dump |
| 604 / 2504 | explorer.exe | User desktop processes                          |

Finding from pstree

| PID  | Process    | Parent              | Observation             |
| ---- | ---------- | ------------------- | ----------------------- |
| 1512 | WinRAR.exe | explorer.exe (2504) | Opened `Important.rar`  |
| 1984 | cmd.exe    | explorer.exe (604)  | User command prompt     |
| 796  | DumpIt.exe | explorer.exe (604)  | Memory acquisition tool |

The standout artifact is: WinRAR.exe
"C:\Users\Alissa Simpson\Documents\Important.rar"

Finding from .netstat
| Plugin  | Finding                                   | Significance                       |
| ------- | ----------------------------------------- | ---------------------------------- |
| pslist  | WinRAR.exe (PID 1512)                     | Opened `Important.rar`             |
| pslist  | DumpIt.exe (PID 796)                      | Memory acquisition tool            |
| pstree  | explorer.exe → WinRAR.exe                 | User opened archive before capture |
| pstree  | explorer.exe → cmd.exe                    | Interactive command prompt         |
| netstat | No active external C2 connection observed | No obvious beaconing in memory     |

Finding from malfind 

| Plugin          | Finding                                                                  | Significance                                         |
| --------------- | ------------------------------------------------------------------------ | ---------------------------------------------------- |
| windows.pslist  | `cmd.exe` (PID 1984) spawned under `explorer.exe`                        | User executed command shell during activity timeline |
| windows.pslist  | `DumpIt.exe` (PID 796)                                                   | Memory acquisition tool used to create dump          |
| windows.pstree  | `explorer.exe (PID 604) → cmd.exe (PID 1984)`                            | Confirms command shell launched by logged-in user    |
| windows.pstree  | `explorer.exe (PID 604) → mspaint.exe (PID 2424)`                        | User activity present at acquisition time            |
| windows.netstat | No active connection to `203.0.113.88:4444` found                        | No evidence of C2 traffic in this memory image       |
| windows.netstat | Multiple normal Windows service listeners (`svchost.exe`, `TCPSVCS.EXE`) | Expected network services                            |
| windows.malfind | `svchost.exe` PID 816 — RWX memory region                                | Potential injected/executable memory                 |
| windows.malfind | `svchost.exe` PID 472 — RWX memory region                                | Potential injected/executable memory                 |
| windows.malfind | `svchost.exe` PID 948 — RWX memory region                                | Suspicious memory allocation                         |
| windows.malfind | `explorer.exe` PID 604 — RWX memory region                               | Requires further investigation                       |
| windows.malfind | `wmpnetwk.exe` PID 1856 — RWX memory region                              | Potential code injection artifact                    |

Memory analysis was performed using Volatility 3 on the acquired memory dump. The windows.pslist and windows.pstree plugins identified active user processes including cmd.exe, mspaint.exe, and DumpIt.exe, showing normal user activity. The windows.netstat plugin revealed only legitimate listening services and no evidence of a command-and-control connection. The windows.malfind plugin detected multiple PAGE_EXECUTE_READWRITE memory regions in svchost.exe, explorer.exe, and wmpnetwk.exe, indicating potentially injected or suspicious executable memory requiring further investigation.

