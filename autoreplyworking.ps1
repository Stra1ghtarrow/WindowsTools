ForEach ($Identity in Get-Content "C:\gts\furlough.txt")
{
Set-MailboxAutoreplyConfiguration -identity $Identity -autoreplystate disabled 
}