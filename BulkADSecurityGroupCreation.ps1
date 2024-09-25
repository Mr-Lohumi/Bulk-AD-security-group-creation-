<#
.SYNOPSIS
    Creates security groups in Active Directory in bulk using data from a CSV file.

.DESCRIPTION
    This script reads a CSV file containing security group details (like group name, description, and organizational unit) 
    and creates security groups in Active Directory based on the information in the file.

.PARAMETER csvFilePath
    The path to the CSV file that contains group information.

.EXAMPLE
    .\BulkADSecurityGroupCreation.ps1 -csvFilePath "C:\GroupsToCreate.csv"

    This command will create security groups in Active Directory based on the data in the CSV file.

.NOTES
    Author: Mr. Lohumi
    Version: 1.0
    License: MIT License
#>

param (
    [string]$csvFilePath = "C:\GroupsToCreate.csv" # Default file path for CSV
)

# Import Active Directory module
Import-Module ActiveDirectory

# Import the CSV file containing the groups' information
$groups = Import-Csv -Path $csvFilePath

# Loop through each group and create it in Active Directory
foreach ($group in $groups) {
    $groupName = $group.GroupName
    $description = $group.Description
    $ou = $group.OU

    try {
        # Create the security group in Active Directory
        New-ADGroup -Name $groupName `
                    -GroupScope Global `
                    -GroupCategory Security `
                    -Description $description `
                    -Path $ou

        Write-Host "Security group '$groupName' created successfully." -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to create security group '$groupName'. Error: $_" -ForegroundColor Red
    }
}
