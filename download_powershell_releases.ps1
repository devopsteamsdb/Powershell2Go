$AllPowerShellReleases = Invoke-RestMethod https://api.github.com/repos/PowerShell/PowerShell/releases

foreach ($release in $AllPowerShellReleases)
{
  $PowershellVersion = $release.tag_name.Substring(1) -as [version]
  #$release.html_url
  if($release.name.Contains('preview'))  { continue }
  #$release.name
  
  $AllLinks = $release.assets.browser_download_url | where {$_.contains('win-x64.msi') -or $_.contains('rhel.7') }
  
  foreach ($link in $AllLinks)
  {
    wget $link
  }
  
}


