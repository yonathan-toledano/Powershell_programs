Write-Output 'Welcom Liran to Jonnys Powershell lab:

1.Display date.
2.Display time.
3.Display desktop.
4.Display only pdf in JBT.
5.Display onli files abov 100kb in JBT.
6.Creat a folder.
7.Delete a file.
8.Display 10 last security event logs.
9.Display services.
10.Ping google server.'

$var = Read-Host -Prompt '

Please choose a number from the menu:
'
$DesktopPath = [Environment]::GetFolderPath("Desktop")

if($var -eq 1)
{
Write-Output('

Today is:
') 
 Get-Date -DisplayHint Date
}

elseif($var -eq 2)
{
write-output('
The curren time is:
') 
 Get-Date -DisplayHint Time
}

elseif($var -eq 3)
{
Write-Output('
Welcom to your Desktop:
')
Get-ChildItem $DesktopPath
}

elseif($var -eq 4)
{
Write-Output('
Here are all the pdf file in JBT:
')
Get-ChildItem $DesktopPath\jbt | Where-Object {$_.Extension -eq ".pdf"}
}

elseif($var -eq 5)
{
Write-Output('
Here are all your files in JBT filder that weight over 100kb 
')
Get-ChildItem $DesktopPath\jbt | Where-Object {$_.Length -gt 100000}
}

elseif($var -eq 6)
{
$foldername = Read-Host -Prompt "How would you like to name your new folder?"
New-Item $DesktopPath\jbt -ItemType directory -Name $foldername 
Write-Output "                      
              A new folder was created           -^-"
}

elseif($var -eq 7)
{
$filename = Read-Host -Prompt "Please name the file would you want to erase?"
Remove-Item -path $DesktopPath\jbt\$filename
Get-ChildItem $DesktopPath\jbt | Where-Object {$_.Name}
Write-Output "The file has been deleted."
}

elseif($var -eq 8)
{
Write-Output "Here are your last 10 security event logs:"
Get-EventLog Security -Newest 10
Write-Output "                                        
                              -^-   Stay updated   -^-"
}

elseif($var -eq 9)
{
Write-Output "Here are your runnung sevices:"
Get-Service | Where-Object {$_.Status -eq "running"}
Write-Output "
                       -^-  Enjoy keeping track of your activity  -^-"
}

elseif($var -eq 10)
{
ping 8.8.8.8
Write-Output "
         
          
           -^-   Seams like you internet communication is working just fine   -^-"
}

else
{
Write-Output 'WRONG NUMBER!'
}