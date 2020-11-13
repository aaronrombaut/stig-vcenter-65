## Import Functions
. ".\functions.ps1"

function Get-VDSwitchNIOCSetting() {
    Get-VDSwitch | Select-Object Name,@{N="NIOC Enabled";E={$_.ExtensionData.config.NetworkResourceManagementEnabled}}
}

function Set-VDSwitchNIOCSetting([String]$VDSwitchName, [Boolean]$stigValue=$true) {
    (Get-VDSwitch $VDSwitchName | Get-View).EnableNetworkResourceManagement($stigValue)
}
function Test-VDSwitchNIOCSetting($hostValueToCheck, $stigValueToCheck=$true) {
    if($hostValueToCheck -eq $stigValueToCheck) {
        return $true
    } else {
        return $false
    }
}

## Check STIG-ID VCWN-65-000007
try {
    Write-stigHeader "VCWN-65-000007"
    Write-stigTitle "The vCenter Server for Windows must manage excess capacity, bandwidth, or other redundancy to limit the effects of information-flooding types of Denial of Service (DoS) attacks by enabling Network I/O Control (NIOC)."
    Write-stigDiscussion "DoS is a condition when a resource is not available for legitimate users. When this occurs, the organization either cannot accomplish its mission or must operate at degraded capacity. Managing excess capacity ensures that sufficient capacity is available to counter flooding attacks. Employing increased capacity and service redundancy may reduce the susceptibility to some DoS attacks. Managing excess capacity may include, for example, establishing selected usage priorities, quotas, or partitioning."
    Write-stigCheckText "If Network I/O Control is disabled, this is a finding."
    
    ## Check command
    #Get-VDSwitch | Select-Object Name,@{N="NIOC Enabled";E={$_.ExtensionData.config.NetworkResourceManagementEnabled}} | Format-Table
    Get-VDSwitchNIOCSetting | Format-Table

    ## Check logic
    if(Test-VDSwitchNIOCSetting $(Get-VDSwitchNIOCSetting).'NIOC Enabled' $true) {
        Write-stigFooter "Green" "Not a finding"
    } else {
        Write-stigFooter "Red" "Open"
        do {
            Write-Host "Do you want to correct?"
            $userChoice = Read-Host -Prompt "(Y/y) yes, (N/n) no, (Q/q) quit"
            if($userChoice -ieq 'y') {
                Write-Host "Correcting"
                Set-VDSwitchNIOCSetting $(Get-VDSwitchNIOCSetting).Name $true
                break
            } elseif($userChoice -ieq 'n') {
                Write-Host "Not correcting, exiting"
                break
            }
        } while ($userChoice -ine 'q')
    }
} catch {
    
}