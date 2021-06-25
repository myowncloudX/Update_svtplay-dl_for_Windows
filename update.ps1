
$myPathLocation  = (Get-Item -Path ".\").FullName

#region ParseWebsite_WebHTML

$webPage = "https://svtplay-dl.se/archive/"
$webHTML = "$myPathLocation\data\webHTML.txt"

$WebResponse = Invoke-WebRequest $webPage -UseBasicParsing
$WebResponse.RawContent | Out-File -FilePath $webHTML

#endregion

#region Parse_Website_Latest_Version

$content = Get-Content "$myPathLocation\data\webHTML.txt"
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

#endregion

#region Extract_Installed_Version

.\bin\svtplay-dl.exe --version | Set-Content "$myPathLocation\data\installedStableVersion.txt"

$installedStableVersion = Get-content "$myPathLocation\data\installedStableVersion.txt" 
$installedStableVersion -replace('svtplay-dl ','') | Set-Content "$myPathLocation\data\installedStableVersion.txt"
$installedStableVersion = Get-Content "$myPathLocation\data\installedStableVersion.txt"
        
#endregion


clear-host

Write-Host " --------------------------------------------------" -ForegroundColor White 
Write-Host "  Systemuppdatering" -ForegroundColor Blue
Write-Host " --------------------------------------------------" -ForegroundColor White
Write-Host ""
Write-Host "  --> Söker efter uppdateringar" -ForegroundColor White
Write-Host ""


start-sleep -Milliseconds 4000

if ($latestStableVersion -gt $installedStableVersion){

Write-Host "  Det finns en ny version tillgänglig av svtplay-dl för windows." -ForegroundColor Green


Write-Host ""

Write-Host ""

Write-Host " ...
