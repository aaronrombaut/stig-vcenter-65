## Disconnect vCenter Server Connection
try {
    Write-Host ""
    Write-Host "Logging off vCenter Server session"
    Disconnect-VIServer -Server $vcsaConnection.Name -Confirm:$false
} catch {

}