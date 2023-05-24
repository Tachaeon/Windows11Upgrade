#https://www.microsoft.com/software-download/windows11
$Capable = "C:\Install\Capable.txt"
If (Test-Path -Path $Capable) { 
    #Download .iso
    Start-Job -Name WebReq -ScriptBlock { 
        $ProgressPreference = 'SilentlyContinue'
        $URL = "https://software.download.prss.microsoft.com/dbazure/Win11_22H2_English_x64v1.iso?t=390278cd-bf50-41a5-86c5-3f4b6e29521d&e=1684931139&h=17591f78f7c5bbc3509661b020c5427b80716e7884f2ad40b4504672e0de0a63"
        $Path = "C:\Install\Windows11Upgrade.iso"
        Invoke-WebRequest -Uri $URL -OutFile $Path 
    }
    Wait-Job -Name WebReq
}