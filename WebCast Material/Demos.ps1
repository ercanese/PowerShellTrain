Get-Service
Set-Service -Name ALG -StartupType Disabled
Get-Service -Name ALG 
Get-AzureADUser
Install-Module -Name Invoke-SqlCmd2
Invoke-SqlCmd2

$PSVersionTable
$LogPath = "C:\Demo"
$FileName = "\Log.txt"
$Number1 = 1
$Number2 = 5

$Number1 + $Number2
$LogPath + $FileName

$Name = "ceyda"

switch($Name){
"Ercan" { "Seçtiğin isim Ercan"}
"Ceyda" { "Seçtiğin isim Ceyda"}

}

$Size = 6GB


if ($Size -lt 5GB)
{
    "5GB altında bır deger"
}
else
{
    "5Gb üzerinde"
}

$Planets = "Merkür","Venüs","Mars"

$DemoPlanets = @()

$DemoPlanets += "Merkür"
$DemoPlanets += "Venus"

Get-Service -Name ALG | Get-Member
Get-Process | Get-Member

Get-Service -Name ALG  | Select-Object -Property Name,StartType,Status
Get-Service | Sort-Object -Property Status -Descending

Get-Process | Sort-Object CPU -Descending 

1,6,7,2,8,9 | Sort-Object

Get-ChildItem -Path C:\Windows | Measure-Object 
<#
Get-Process | Measure-Object -Property CPU -Maximum -Minimum -Sum -Average
#>


Get-Service | Where-Object Status -eq "Stopped"
Get-Process | Where-Object CPU -gt 10
Get-Volume

Get-Process

Get-Help 
Get-Member
Get-Command

$Name = "ceyda"

switch($Name){
"Ercan" { "Seçtiğin isim Ercan"}
"Ceyda" { "Seçtiğin isim Ceyda"}

}


$Planets

foreach($Planet in $Planets)
{
    $Planet + " Demo"
}

for ($i = 1; $i -le 9; $i++)
{ 
  $i  
}


$Name = "ceyda"

switch($Name){
"Ercan" { "Seçtiğin isim Ercan"}
"Ceyda" { "Seçtiğin isim Ceyda"}

}


Get-ADUser -Filter * -Properties * | Where-Object Department -eq "Sales" | 
Select-Object -Property Name,Department,SamAccountName | Sort-Object -Property Name

$Groups = Get-ADGroup -Filter * 
foreach($Group in $Groups){

    Get-ADGroupMember -Identity $Group
}


$Users = Get-ADUser -Filter * -Properties *

foreach($User in $Users){

    if($User.Department -eq "Sales"){
       Write-Host "$($User.Name) adlı kullanıcı Sales departmanına üye." -ForegroundColor Green
    }

}