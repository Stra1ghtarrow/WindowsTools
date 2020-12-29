$displayname = @()
$names = get-content "c:\gts\enabled.txt"
foreach ($name in $names) {


$displaynamedetails = Get-ADUser -filter { DisplayName -eq $name } -server "ServerNamegoeshere"| Select name,samAccountName

$displayname += $displaynamedetails

}

$displayname | Export-Csv "C:\gts\Samaccountname.csv"