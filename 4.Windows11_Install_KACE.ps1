$Capable = "C:\Install\Capable.txt"
If (Test-Path -Path $Capable) {
    Start-Job -Name Install -ScriptBlock {
        #Mount Image
        $DriveLetter = "U:"
        $Path = "C:\Install\Windows11Upgrade.iso"
        $DiskImg = Mount-DiskImage -ImagePath $Path -NoDriveLetter
        $VolInfo = $DiskImg | Get-Volume
        mountvol $DriveLetter $VolInfo.UniqueId

        #Start Upgrade
        $Setup = "U:\Setup.exe"
        $startParams = @{
            FilePath     = $Setup
            ArgumentList = '/Auto Upgrade', '/Quiet', '/MigrateDrivers all', '/DynamicUpdate Disable', '/Telemetry disable', '/compat IgnoreWarning', '/ShowOOBE none', '/NoReboot', '/eula accept', '/copylogs C:\Install\Logfiles.log'
            PassThru     = $true
            Wait         = $true
        }
        Start-Process @startParams
        Wait-Process SetupHost
    
        #Unmount Image
        DisMount-DiskImage -ImagePath $Path

        #Remove .iso
        Remove-Item -Path $Path -Recurse }
    Wait-Job -Name Install
}