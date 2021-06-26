$myPathLocation  = (Get-Item -Path ".\").FullName

#region Parse_Website_Latest_Version

$content = Get-Content "$myPathLocation\data\websiteHTML.txt"
$count = 0 
$targetRowIndex = 101

foreach ($line in $content) {
    $count += 1
    if ($count -eq $targetRowIndex) {
        $line | Out-File -FilePath "$myPathLocation\data\latestStableVersion.txt"
        break
    } 

}


$latestStableVersion = Get-content "$myPathLocation\data\latestStableVersion.txt" 
$latestStableVersion -replace('<h5 class="mb-1">','') -replace('</h5>','') | Set-Content "$myPathLocation\data\latestStableVersion.txt"
$latestStableVersion = Get-Content "$myPathLocation\data\latestStableVersion.txt"


clear-host


write-host " ------------------------------------------" -ForegroundColor White
write-host "  Web Scraping (VER)" -ForegroundColor Blue
write-host " ------------------------------------------" -ForegroundColor White
write-host "" -ForegroundColor White

$ConfirmExit = Read-Host "  Vill du avsluta och stänga detta fönster? (y/n)"

if ($ConfirmExit -eq 'a'){

[System.Environment]::exit(1)

}elseif ($ConfirmExit -eq 'y'){

[System.Environment]::exit(1)

}elseif ($ConfirmExit -eq 'n'){

}
