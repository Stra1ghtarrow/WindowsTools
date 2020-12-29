# Export your users first by display name and save to a text file.
# Then you must run this script but set pwdlastset to 0 first and then -1.
# make sure you check it's applied.

ForEach ($Identity in Get-Content "C:\gts\allusers.txt")
{
    Set-ADUser -identity $identity -Replace @{pwdlastset="-1"} 
}
