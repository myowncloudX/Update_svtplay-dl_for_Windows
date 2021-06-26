clear-host

$myPathLocation  = (Get-Item -Path ".\").FullName

#region Parse_Website_WebHTML

$webPage = "https://svtplay-dl.se/archive/"
$webHTML = "$myPathLocation\data\websiteHTML.txt"

$WebResponse = Invoke-WebRequest $webPage -UseBasicParsing
$WebResponse.RawContent | Out-File -FilePath $webHTML

#endregion
clear-host


write-host " ------------------------------------------" -ForegroundColor White
write-host "  Web Scraping (HTML)" -ForegroundColor Blue
write-host " ------------------------------------------" -ForegroundColor White
write-host "" -ForegroundColor White

$ConfirmExit = Read-Host "  Vill du avsluta och stänga detta fönster? (y/n)"

if ($ConfirmExit -eq 'y'){

[System.Environment]::exit(1)

}elseif ($ConfirmExit -eq 'n'){

powershell.exe -noexit "$myPathLocation\scripts\action_web_scraping.ps1"

}





