$Path = $MyInvocation.MyCommand.Path
$Parent = Split-Path -Parent $Path
$Csv = Join-Path -Path $Parent -ChildPath Users.csv


try {Import-Module -Name ActiveDirectory -ErrorAction Stop } catch { Write-Host "DC de çalıştırınız." -ForegroundColor Red; Start-Sleep 5}

$UsersData = Import-Csv -Path .\Users.csv

foreach($User in $UsersData)
{

    try {
        
        if(!(Get-ADOrganizationalUnit -Filter "Name -eq '$($User.Department)'"))
        {
            $Ou = New-ADOrganizationalUnit -Name $User.Department -ProtectedFromAccidentalDeletion $false -PassThru 
        }

        $Created = @{
            SamAccountname = $($User.'First Name' + "." + $User.'Last Name') 
            UserPrincipalName = $($User.'First Name' + "@" + ((Get-ADForest).rootdomain)) 
            Surname = $User.'Last Name'
            Path = $Ou.DistinguishedName
            Name = $User.Name
            GivenName = $User.'First Name'
            Enabled = $true
            City = $User.City
            Department = $User.Department
            Company = $User.Company
            DisplayName = $User.'Display Name'
            AccountPassword = "Password1" | ConvertTo-SecureString -AsPlainText -Force
            PasswordNeverExpires  = $true

        }
        
        New-ADUser @Created -ErrorAction Stop

        Write-Host "[$(Get-Date -Format "ddMMyyy hhmmss")] : $($User.Name) Created" -ForegroundColor Green
    }
    catch{
        Write-Host "Error" -ForegroundColor Red
    }
}