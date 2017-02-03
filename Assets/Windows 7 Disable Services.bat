@ECHO OFF

ECHO Disabling Unnecessary Windows Shit

ECHO Disabling Adaptive Brightness Service
sc config SensrSvc start= disabled

ECHO.
ECHO Disabling Bitlocker Drive Encryption Service
sc config BDESVC start= disabled

ECHO.
ECHO Disabling Disk Defragmenter Service
sc config defragsvc start= disabled

ECHO.
ECHO Disabling Distributed Link Tracking Client Service
sc config TrkWks start= disabled

ECHO.
ECHO Disabling Encrypting File System Service
sc config EFS start= disabled

ECHO.
ECHO Disabling Home Group Listener Service
sc config HomeGroupListener start= disabled

ECHO.
ECHO Disabling Home Group Provider Service
sc config HomeGroupProvider start= disabled

ECHO.
ECHO Disabling Internet Connection Sharing Service
sc config SharedAccess start= disabled

ECHO.
ECHO Disabling IP Helper Service
sc config iphlpsvc start= disabled

ECHO.
ECHO Disabling Portable Device Enumerator Service
sc config WPDBusEnum start= disabled

ECHO.
ECHO Disabling Remote Registry Service
sc config RemoteRegistry start= disabled

ECHO.
ECHO Disabling Routing and Remote Access Service
sc config RemoteAccess start= disabled

ECHO.
ECHO Disabling Windows Biometric Service
sc config WbioSrvc start= disabled

ECHO.
ECHO Disabling Windows Defender Service
sc config WinDefend start= disabled

ECHO.
ECHO Disabling Windows Search Service
sc config WSearch start= disabled

ECHO.
ECHO Disabling Application Layer Gateway Service
sc config ALG start= disabled

ECHO.
ECHO Disabling Certificate Propagation Service
sc config CertPropSvc start= disabled

ECHO.
ECHO Disabling Fax Service
sc config Fax start= disabled

ECHO.
ECHO Disabling Group Policy Client Service
sc config gpsvc start= disabled

ECHO.
ECHO Disabling Superfetch Service
sc config SysMain start= disabled

ECHO.
ECHO Disabling Superfetch Service
sc config SysMain start= disabled