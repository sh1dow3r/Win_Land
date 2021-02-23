
function ADDuser_student ([string] $CSVFilePath){
    $Users = Import-Csv -Path $CSVFilePath
    $Server = "dc.vase.local"            
foreach ($User in $Users)            
{   $Name = $User.'Name'
    $LName = $Name.Split(" ")[0] 
    $FName = $Name.Split(" ")[1] 
    #$Displayname = $FName + " " + $LName  
    #$GroupID = $User.'Team'
    $UserName = $User.UserID
    $Team = $User.Team.Substring(0,1)  
    $Password = New-RandomPassword -Length 10 
    $Description = "CDT Class Spring 2020 "
    $OU = "OU=Students,OU=CDT,DC=vase,DC=local"
    
    #Check if the user account already exists in AD
    if (Get-ADUser -F {SamAccountName -eq $Username})
    {
            #If user does exist, output a warning message
            Write-Warning "A user account $Username has already exist in Active Directory."
    }
    else
    {
           #If a user does not exist then create a new user account
       
     #Account will be created in the OU listed in the $OU variable in the CSV file; don’t forget to change the domain name in the"-UserPrincipalName" variable
        New-ADUser `
         -SamAccountName $Username `
         -UserPrincipalName "$Username@vase.local" `
         -Name "$FName $LName" `
         -GivenName $FName `
         -Surname $LName `
         -Enabled $True `
         -Description $Description `
         -DisplayName "$LName, $FName" `
         -Department $Department `
         -Path $OU `
         -ChangePasswordAtLogon $false `
         -AccountPassword (convertto-securestring $Password -AsPlainText -Force)
         
         Write-Output "User $UserName created with a password  $Password "

     # Add to the student to the prober Resource Group
     if ($Team -eq "A"){
        $GroupMembership = "TeamA-CDT"
        Add-ADGroupMember -Identity $GroupMembership -Members $UserName -Server $Server
        #Write-Output "User $UserName added to group: $GroupMembership"
     }
     elseif ($Team -eq "B"){
        $GroupMembership = "TeamB-CDT"
        Add-ADGroupMember -Identity $GroupMembership -Members $UserName -Server $Server
        #Write-Output "User $UserName added to group: $GroupMembership"
     }
     elseif ($Team -eq "C"){
        $GroupMembership = "TeamC-CDT"
        Add-ADGroupMember -Identity $GroupMembership -Members $UserName -Server $Server
        #Write-Output "User $UserName added to group: $GroupMembership"
     }
        
    }
}
}
Function New-RandomPassword {
    <#
    .Synopsis
        This will generate a new password in Powershell using Special, Uppercase, Lowercase and Numbers.  The max number of characters are currently set to 79.
        For updated help and examples refer to -Online version.
      
     
    .DESCRIPTION
        This will generate a new password in Powershell using Special, Uppercase, Lowercase and Numbers.  The max number of characters are currently set to 79.
        For updated help and examples refer to -Online version.
     
     
    .NOTES  
        Name: New-RandomPassword
        Author: the Sysadmin Channel
        Version: 1.0
        DateCreated: 2019-Feb-23
        DateUpdated: 2019-Feb-23
     
     
    .LINK
        https://thesysadminchannel.com/generate-strong-random-passwords-using-powershell/ -
    #>
     
        [CmdletBinding()]
        param(
            [ValidateRange(4,79)]
            [int]    $Length = 16,
            [switch] $ExcludeSpecialCharacters
        )
     
     
        BEGIN {
            $SpecialCharacters = @((33,35) + (36..38) + (42..44) + (60..64) + (91..94))
        }
     
        PROCESS {
            try {
                if (-not $ExcludeSpecialCharacters) {
                        $Password = -join ((48..57) + (65..90) + (97..122) + $SpecialCharacters | Get-Random -Count $Length | foreach {[char]$_})
                    } else {
                        $Password = -join ((48..57) + (65..90) + (97..122) | Get-Random -Count $Length | foreach {[char]$_})  
                }
     
            } catch {
                throw $_.Exception.Message
            }
     
        }
     
        END {
            Write-Output "$Password"
        }
     
    }

    $CSV_Path = "C:\Users\Administrator\Downloads\rit-airgap\AD_scripts\CDT_Spring_2020_csv.csv"
    ADDuser_student($CSV_Path)