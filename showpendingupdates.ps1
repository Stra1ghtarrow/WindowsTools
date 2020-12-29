$msUpdateSession = [activator]::CreateInstance([type]::GetTypeFromProgID("Microsoft.Update.Session",$env:COMPUTERNAME))
$updates = $msUpdateSession.CreateUpdateSearcher().Search("IsInstalled=0").Updates

$silverLightInstalled = Get-WindowsFeature | where { $_.Name.ToLower() -like 'silverlight' }

$pendingUpdates = [System.Collections.ArrayList]@()

$updates | % {

$title = $_.Title

if ($_.Title.ToLower().Contains("silverlight")){
    if($silverLightInstalled){
        $pendingUpdates.Add($title)}
}

else{
        $pendingUpdates.Add($title)
    }
}

$updatesCount = $pendingUpdates.Count

if($updatesCount -gt 0){
    Write-Host "***** $updatesCount updates pending for this machine*****" -BackgroundColor Black -ForegroundColor Yellow
    $pendingUpdates | % { Write-Host $_}
}

else{
    Write-Host "***** No pending updates for $env:COMPUTERNAME*****" -BackgroundColor Black -ForegroundColor Green
}
