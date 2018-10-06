[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null
[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.SqlWmiManagement") | Out-Null
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$server = $env:COMPUTERNAME
$db = "AdventureWorks2017"
$bak = "$db.bak"
$url = "https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2017.bak"

# Download database backup
Write-host "Downloading database backup ..."
$client = new-object System.Net.WebClient
$client.DownloadFile($url, $bak)

# Restore database
Write-Host "Restoring database ..."
Restore-SqlDatabase -ServerInstance $server -Database $db -BackupFile $bak -Credential (Get-Credential "sa")

# Done
Write-Host "All done!"
