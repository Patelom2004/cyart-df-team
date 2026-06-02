rule SVCHOST32_Backdoor
{
    meta:
        author = "Analyst"
        description = "Detects svchost32 malware variant"
        date = "2026-06-02"

    strings:
        $s1 = "svchost32.exe" ascii nocase
        $s2 = "203.0.113.88" ascii
        $s3 = "CurrentVersion\\Run" ascii
        $s4 = "Important.rar" ascii

    condition:
        2 of ($s*)
}
