## Connect to vCenter Server
try {
    $vcsaConnection = Connect-VIServer -Server $vcsafqdn -Credential $vcsaCredential
} catch {                                                                                                                   

}