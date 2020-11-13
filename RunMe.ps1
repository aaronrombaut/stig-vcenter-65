## Import Variables
. ".\variables.ps1"

## Get a connection to vCenter
. ".\open-connection.ps1"

## Test various STIG Rules
. ".\checks\vcwn-65-000005.ps1"
. ".\checks\vcwn-65-000007.ps1"

## Close the connection to vCenter
. ".\close-connection.ps1"