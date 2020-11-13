function Write-stigHeader([String]$stigID) {
    Write-Host "============================="
    Write-Host -ForegroundColor Yellow -NoNewline  "   STIG ID: "
    Write-Host "$stigID"
    Write-Host "============================="
}

function Write-stigTitle([String]$stigTitle) {
    Write-Host -ForegroundColor Yellow -NoNewline "Rule Title: "
    Write-Host $stigTitle
}

function Write-stigDiscussion([String]$stigDiscussion) {
    Write-Host -ForegroundColor Yellow -NoNewline "Discussion: "
    Write-Host $stigDiscussion
}

function Write-stigCheckText([String]$stigCheck) {
    Write-Host -ForegroundColor Yellow -NoNewline "Check text: "
    Write-Host $stigCheck
}

function Test-stigBool($stigValueToCheck, $hostValueToCheck) {
    if($hostValueToCheck -eq $stigValueToCheck) {
        return $true
    } else {
        return $false
    }
}

function Write-stigFooterManual() {
    Write-Host ""
    Write-Host "============================="
    Write-Host -ForegroundColor Yellow -NoNewline  "   Status: "
    Write-Host "Manual check"
    Write-Host "============================="
    Write-Host ""
}
function Write-stigFooter([String]$outputColor, [String]$stigStatus) {
    Write-Host "============================="
    Write-Host -ForegroundColor Yellow -NoNewline  "   Status: "
    Write-Host -ForegroundColor $outputColor "$stigStatus"
    Write-Host "============================="
}