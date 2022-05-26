$AllPowerShellReleases = Invoke-RestMethod https://api.github.com/repos/PowerShell/PowerShell/releases

foreach ($realse in $AllPowerShellReleases)
{
  $PowershellVersion = $realse.tag_name.Substring(1) -as [version]
  #$realse.html_url
  if($realse.name.Contains('preview'))  { continue }
  #$realse.name
  
  $AllLinks = $realse.assets.browser_download_url | where {$_.contains('win-x64.msi') -or $_.contains('rhel.7') }
  
  foreach ($link in $AllLinks)
  {
    wget $link
  }
  
}


