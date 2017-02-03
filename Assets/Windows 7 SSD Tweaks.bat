@ECHO OFF

ECHO Running Windows 7 Tweaks for SSD Drives

ECHO.
ECHO Enable TRIM
fsutil.exe behavior set DisableDeleteNotify 0

ECHO Reducing Page File to 2GB
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=2048,MaximumSize=2048

ECHO.
ECHO Disabling Superfetch Service
sc config superfetch start= disabled

ECHO.
ECHO Disabling Disk Defragmenter Service
sc config defragsvc start= disabled

ECHO.
ECHO Disabling Hibernation
powercfg -h off

ECHO.
ECHO Disabling Windows Search Service
sc config WSearch start= disabled