 Param(    
    [string]$VMName,
    [string]$RGName,
    [string]$Location )

Install-Module azure


Select-AzureSubscription -SubscriptionId "5620e8af-99c9-457d-9d82-009ac63d6c53" 

New-AzureAutomationCredential -AutomationAccountName "myautomation" -Name "MyCredential" -Value $cred

Get-InstalledModule Azure -AllVersions | Select-Object Name,Version,Path

Connect-AzureRmAccount -Subscription "free trial" -Credential $cred -Force  

$user = "mahesh.pansare"
$pw = ConvertTo-SecureString "IphoneXR2020" -AsPlainText -Force
$cred = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $user, $pw

 
 $data=Import-Csv -Path D:\VM-Input2.csv

 foreach( $row in $data)
 {
 write-host $row
 New-AzureRmVM -Name $row.VMName -ResourceGroupName $row.RGName `
    -Location $row.location -Size $vmsize -Credential $cred

 }

 ForEach-Object{
write-host $_.VMName , $_.RGName , $_.Location

New-AzureRmVM -Name $_.VMName -ResourceGroupName $_.RGName `
    -Location $_.location -Size $vmSize 
}
