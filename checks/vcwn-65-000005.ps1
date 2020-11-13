## Import Functions
. ".\functions.ps1"

## Check STIG-ID VCWN-65-000005
try {
    Write-stigHeader "VCWN-65-000005"
    Write-stigTitle "The vCenter Server for Windows users must have the correct roles assigned."
    Write-stigDiscussion "Users and service accounts must only be assigned privileges they require. Least Privilege requires that these privileges must only be assigned if needed, to reduce risk of confidentiality, availability or integrity loss."
    Write-stigCheckText "View each role and verify the users and/or groups assigned to it. Application service account and user required privileges should be documented. If any user or service account has more privileges than required, this is a finding."
    
    Get-VIPermission | Sort-Object Role | Select-Object Role,Principal,Entity,Propagate,IsGroup | Format-Table -Auto

    Write-stigFooterManual
} catch {
    
}