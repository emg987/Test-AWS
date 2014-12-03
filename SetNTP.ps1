

# PDC emulator operations master role
$forest = [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest();
Write-Host "Forest Name:" $trace.Name;
$forest.RootDomain.PdcRoleOwner.Name;

# Link the domain controller to an external time source
w32tm.exe /config /manualpeerlist:"0.us.pool.ntp.org 1.us.pool.ntp.org 2.us.pool.ntp.org 3.us.pool.ntp.org" /syncfromflags:manual /reliable:YES /update;
w32tm.exe /config /update;

# Restart the Windows Team service
Restart-Service w32time;
