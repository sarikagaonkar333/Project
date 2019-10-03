
$alldata=Get-AllHotfix
$alldata| Out-File d:\hotfix.txt
$text = "D:\hotfix.txt"
$html = "D:\hotfix.htm"

$File = Get-Content $text
$FileLine = @()
Foreach ($line in $File) 
{
$MyObject = New-Object -TypeName PSObject
Add-Member -InputObject $MyObject -Type NoteProperty -Name Status -Value $Line
$FileLine += $MyObject
}

Import-Csv $text | Select-Object -Property * | ConvertTo-Html -Title "Hotfix Report" | Out-File $html  

Get-HotFix|ConvertTo-Html -Title "hotfix"|Out-File -FilePath D:\test.html
