$NOPREFIX
$CONSOLE:ONLY
CONSOLETITLE "Remote Program Start v1.000"
$EXEICON:'network_remote_control_icon_mWy_icon.ico'
_ICON
$VERSIONINFO:CompanyName=Zachary Spriggs
$VERSIONINFO:FILEVERSION#=1,0,0,0
$VERSIONINFO:PRODUCTVERSION#=1,0,0,0
$VERSIONINFO:FileDescription=Remote Program Start v1.000
$VERSIONINFO:LegalCopyright=2020 Zachary Spriggs
$VERSIONINFO:ProductName=Remote Program Start
$VERSIONINFO:Comments=Starts a program on a remote machine using Invoke-WmiMethod
$VERSIONINFO:Web=https://github.com/SpriggsySpriggs

DIM args$(3)
IF COMMAND$ <> "" THEN 'Checks if it has been called from command prompt with parameters
    args$(0) = COMMAND$(1)
    args$(1) = COMMAND$(2)
    args$(2) = COMMAND$(3)
    IF args$(0) = "" OR args$(1) = "" OR args$(2) = "" THEN
        seconds = 5
        COLOR 12
        ECHO "Paramaters cannot be blank!"
        DO
            ECHO "Exiting in " + LTRIM$(STR$(seconds)) + " seconds"
            _DELAY 1
            seconds = seconds - 1
            DISPLAY
        LOOP UNTIL seconds = 0
        SYSTEM
    END IF
    ClearScreen
    ECHO "Computer Name: " + args$(0)
    ECHO "Credential Username: " + args$(1)
    ECHO "Program to Start: " + args$(2)
ELSE
    DEST CONSOLE
    ClearScreen
    DO
        LINE INPUT "Computer Name: ", args$(0)
    LOOP UNTIL args$(0) <> ""
    DO
        LINE INPUT "Credential Username: ", args$(1)
    LOOP UNTIL args$(1) <> ""
    DO
        LINE INPUT "Program to Start: ", args$(2)
    LOOP UNTIL args$(2) <> ""
END IF
a = SHELL("PowerShell -Command " + CHR$(34) + "invoke-WmiMethod -ComputerName " + CHR$(34) + args$(0) + CHR$(34) + " -Credential " + CHR$(34) + args$(1) + CHR$(34) + " -EnableAllPrivileges -Class win32_process -Name create -ArgumentList " + CHR$(34) + args$(2) + CHR$(34)) ' + ";exit $LASTEXITCODE")
'COLOR 15
'ECHO LTRIM$(STR$(a))

SUB ClearScreen
    CLS
    COLOR 12
    ECHO "NOTE: Make sure you have enabled the " + CHR$(34) + "Windows Management Instrumentation (WMI)" + CHR$(34) + " on the remote machine and that you have sufficient privileges to do so."
    ECHO "Copy and paste the below script into an elevated command prompt on the remote machine if it is not yet enabled."
    COLOR 10
    ECHO "netsh advfirewall firewall set rule group= " + CHR$(34) + "Windows Management Instrumentation (WMI)" + CHR$(34) + " new enable=yes"
    COLOR 15
    ECHO ""
END SUB
