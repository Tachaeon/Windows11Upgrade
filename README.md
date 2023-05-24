# Windows 11 Upgrade Scripts

This is my take on the Windows 11 Upgrade conundrum. This was born out of frustration of the Windows 11 Upgrade Assistant just rebooting without notification after the upgrade was complete. This was scripted for a KACE environment so you may tailor anything here to fit your needs. The scripts are numbered in the order in which they need to run and are further explained below.

## Files
1.HardwareReadiness.ps1
- **Run as System.**
- This is Microsoft's HardwareReadiness script that can be found [here] [hardware].
- I have added a directory check at the start as well as forced Windows notifications to be on.
- At the end I create a file with the results of the script based on CAPABLE or NOT CAPABLE.

2.Win11_Toast1_Notif.ps1
- **Run as logged in user.**
- At the top I set variables for the NOT CAPABLE document to be later output by the "Not Capable" Toast notification.
- Everything from here on out in the remainder of the scripts is determinate on either file existing.
- You will have to taylor the toast notification's message to your liking.

3.Windows11_Download_KACE.ps1
- **Run as logged in user.**
- I tried to get this to run in the **2.Win11_Toast1_Notif.ps1** however, the download would just stop in the middle somewhere. This is why this is it's own script.
- https://www.microsoft.com/software-download/windows11 This is where you can generate a new download key. It lasts for 24 hours. Just replace it in the script.

4.Windows11_Install_KACE.ps1
- **Run as System.**
- Mounting ISO
- Installing Windows 11 Upgrade
- Unmounting Image
- Deleting ISO

5.Win11_Toast2_Notif.ps1
- **Run as logged in user.**
- Final Toast Notification letting the user know to restart their computer.
- In my testing there isn't the normal options in the shutdown menu for "Reboot and Update" or "Shutdown and Update".

[hardware]: <https://techcommunity.microsoft.com/t5/microsoft-intune-blog/understanding-readiness-for-windows-11-with-microsoft-endpoint/ba-p/2770866>