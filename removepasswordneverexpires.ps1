ForEach ($Identity in Get-Content "C:\gts\disabled.txt")
{
Set-ADUser -identity $identity  -PasswordNeverExpires $false
}