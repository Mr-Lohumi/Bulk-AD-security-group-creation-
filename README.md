# Bulk-AD-security-group-creation-


Got it! Here's the updated **README.md** without that phrasing:

---

# Bulk Active Directory Security Group Creation Script

## Overview

This PowerShell script allows you to create multiple security groups in Active Directory using a CSV file. Each group is created with a specified name, description, and Organizational Unit (OU).

## Requirements

- PowerShell (v5.0+)
- Active Directory module
- CSV file with group details

## CSV Format

Prepare a CSV file like this:

```csv
GroupName,Description,OU
HR_Security,HR Department Security Group,OU=Groups,DC=domain,DC=com
Finance_Security,Finance Department Security Group,OU=Groups,DC=domain,DC=com
```

- **GroupName**: Name of the security group.
- **Description**: Description for the group.
- **OU**: Organizational Unit in DN format where the group will be created.

## How to Use

1. **Prepare your CSV file** with group details.
2. **Run the script**:
   ```powershell
   .\BulkADSecurityGroupCreation.ps1 -csvFilePath "C:\Path\To\GroupsToCreate.csv"
   ```

3. The script will create security groups in AD and log the results.

## Example

```powershell
.\BulkADSecurityGroupCreation.ps1 -csvFilePath "C:\GroupsToCreate.csv"
```

## License

Licensed under the MIT License.
