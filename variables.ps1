# User Variables
$vcsafqdn="vcsa-001v.aaronrombaut.com"
$vcsaUser="administrator@vsphere.local"
$vcsaCredential = Get-Credential -UserName $vcsaUser -Message "vCenter SSO User"

# PowerCLI Configuration
$doNotDisplay = Set-PowerCLIConfiguration -InvalidCertificateAction Prompt -Confirm:$false 
$doNotDisplay = Set-PowerCLIConfiguration -DefaultVIServerMode Multiple -Confirm:$false # Modes: [Multiple | Single]
$doNotDisplay = Set-PowerCLIConfiguration -ParticipateInCeip $false -Confirm:$false