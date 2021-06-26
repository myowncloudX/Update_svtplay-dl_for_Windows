$myPathLocation  = (Get-Item -Path ".\").FullName

#region Parse_Website_Latest_Version

$content = Get-Content "$myPathLocation\data\websiteHTML.txt"
$count = 0 
$targetRowIndex = 102

foreach ($line in $content) {
    $count += 1
    if ($count -eq $targetRowIndex) {
        $line | Out-File -FilePath "$myPathLocation\data\latestStableVersionDate.txt"
        break
    } 

}


$latestStableVersionDate = Get-content "$myPathLocation\data\latestStableVersionDate.txt" 
$latestStableVersionDate -replace('<small class="text-muted">','') -replace('</small>','') | Set-Content "$myPathLocation\data\latestStableVersionDate.txt"
$latestStableVersionDate = Get-Content "$myPathLocation\data\latestStableVersionDate.txt"

clear-host


write-host " ------------------------------------------" -ForegroundColor White
write-host "  Web Scraping (DATE)" -ForegroundColor Blue
write-host " ------------------------------------------" -ForegroundColor White
write-host "" -ForegroundColor White

$ConfirmExit = Read-Host "  Vill du avsluta och stänga detta fönster? (y/n)"

if ($ConfirmExit -eq 'y'){

[System.Environment]::exit(1)

}elseif ($ConfirmExit -eq 'n'){

}