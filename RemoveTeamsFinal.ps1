# Uninstall Teams Machine-Wide Installer
Start-Process "msiexec.exe" -Arg "/X {39AF0813-FA7B-4860-ADBE-93B9B214B914} /quiet" -Wait

# Get all users into a variable
$Users = Get-ChildItem -Path “$($ENV:SystemDrive)\Users\”

$Users | ForEach-Object {

    Try {
        # Uninstall Microsoft Teams for all users
        if (Test-Path “$($ENV:SystemDrive)\Users\$($_.Name)\AppData\Local\Microsoft\Teams\Update.exe”) {
            Start-Process -FilePath “$($ENV:SystemDrive)\Users\$($_.Name)\AppData\Local\Microsoft\Teams\Update.exe” -Arg “-uninstall -s” -Wait
        }
    } Catch {
        Out-Null
    }
}

$Users | ForEach-Object {

    Try {
        # Remove Microsoft Teams desktop icon
        if (Test-Path “$($ENV:SystemDrive)\Users\$($_.Name)\Desktop\Microsoft Teams.lnk”) {
            Remove-Item –Path “$($ENV:SystemDrive)\Users\$($_.Name)\Desktop\Microsoft Teams.lnk” -Force -ErrorAction Ignore
        }
    } Catch {
        Out-Null
    }
}

$Users | ForEach-Object {

    Try {
        # Remove Microsoft Teams from Start Menu
        if (Test-Path “$($ENV:SystemDrive)\Users\$($_.Name)\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Microsoft Corporation\Microsoft Teams.lnk”) {
            Remove-Item –Path “$($ENV:SystemDrive)\Users\$($_.Name)\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Microsoft Corporation\Microsoft Teams.lnk” -Force -ErrorAction Ignore
        }
    } Catch {
        Out-Null
    }
}

$Users | ForEach-Object {
    Try {
        # Remove Teams folder from %localappdata% folder for all users
        if (Test-Path “$($ENV:SystemDrive)\Users\$($_.Name)\AppData\Local\Microsoft\Teams\”) {
            Remove-Item –Path “$($ENV:SystemDrive)\Users\$($_.Name)\AppData\Local\Microsoft\Teams\” -Recurse -Force -ErrorAction Ignore
        }
    } Catch {
        Out-Null
    }
}

Remove-Item 'C:\Program Files (x86)\Teams Installer' -Recurse