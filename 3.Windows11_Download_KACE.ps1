#https://www.microsoft.com/software-download/windows11
$Capable = "C:\Install\Capable.txt"
If (Test-Path -Path $Capable) { 
    #Download .iso
    Start-Job -Name WebReq -ScriptBlock { 
        $ProgressPreference = 'SilentlyContinue'
        $URL = "https://software.download.prss.microsoft.com/dbazure/Win11_22H2_English_x64v2.iso?t=3a7d78ff-f65d-4ea7-9445-c04eb30cf280&e=1686267902&h=c82a34d97e537a85c2ef8d92117a35c2896041ddf1b697a2a1fafec996242807"
        $Path = "C:\Install\Windows11Upgrade.iso"
        Invoke-WebRequest -Uri $URL -OutFile $Path 
    }
    Wait-Job -Name WebReq
}