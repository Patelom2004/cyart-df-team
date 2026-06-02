**1. 5 Whys Root Cause Analysis (RCA)**

| Question                                       | Answer                                                                                                  |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| Why was patient data exfiltrated?              | The attacker successfully gained access and transferred sensitive data outside the network.             |
| Why did the attacker gain access?              | A malicious file (Important.rar) was opened, leading to malware execution.                              |
| Why was the malware able to operate?           | Persistence was established through a Registry Run Key and the malware communicated with its C2 server. |
| Why was the activity not detected immediately? | No alert existed for outbound communications to the malicious C2 channel.                               |
| Why was there no alert?                        | Detection rules and monitoring controls were not reviewed or updated regularly.                         |

**2. Fishbone Diagram on Workflow**

**3. Incident Metrics Table**
| Metric                      | Value     | Target       | Assessment        |
| --------------------------- | --------- | ------------ | ----------------- |
| Mean Time to Detect (MTTD)  | 7 Hours   | < 1 Hour     | Needs Improvement |
| Mean Time to Respond (MTTR) | 2 Hours   | < 30 Minutes | Needs Improvement |
| Dwell Time                  | 7.8 Hours | < 1 Hour     | Critical Gap      |
| False Positive Rate         | 3%        | < 5%         | Acceptable        |
| Time to Containment         | 1 Hour    | < 30 Minutes | Needs Improvement |
| Time to Eradication         | 2 Hours   | < 1 Hour     | Needs Improvement |

**4. Identified Gaps & Recommendations**
The incident resulted in unauthorized access to patient data through the execution of a malicious file that established persistence and communicated with an
external command-and-control server. Root Cause Analysis identified the primary issue as insufficient detection engineering and the absence of regular security
monitoring reviews. The attacker remained active for approximately 7.8 hours before detection, highlighting gaps in monitoring and response capabilities. Key
recommendations include implementing detection rules for unusual outbound traffic, deploying endpoint detection and response (EDR) solutions, introducing email
sandboxing, and establishing a monthly detection review process. These improvements will reduce dwell time, improve visibility, and strengthen overall incident
response effectiveness.
