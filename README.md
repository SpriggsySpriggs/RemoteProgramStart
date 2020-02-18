# RemoteProgramStart
This program uses Invoke-WmiMethod as specified here: "https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/invoke-wmimethod?view=powershell-5.1"
Very straightforward. All written in QB64 v1.4

Make sure you enable the settings in the firewall on the remote machine by using this:
netsh advfirewall firewall set rule group= "Windows Management Instrumentation (WMI)" new enable=yes

If you continue getting "Access Denied" exceptions/errors, try this solution:
https://social.technet.microsoft.com/Forums/ie/en-US/c19bed7f-e734-49b4-944c-ece1d3b66e2b/invokewmimethod-remote-0x80070005-eaccessdenied?forum=winserverpowershell
