# gc C:\servers.txt |%{if(Test-Connection $_ -Count 2 -Quiet){Write-Host $_ '- доступен' -f DarkGreen}else{Write-Host $_ '- не доступен!' -f Red}}
#Get-ADComputer -Filter{OperatingSystem -like '*Server*'} -Properties * |%{if(Test-Connection $_.Name -Count 2 -Quiet){Write-Host $_.Name '- доступен' -f DarkGreen}else{Write-Host $_.Name '- не доступен!' -f Red}}

Get-ADComputer -Filter{OperatingSystem -like '*windows*'} -Properties * |%{if(Test-Connection $_.Name -Count 2 -Quiet){Write-Host $_.Name '- доступен' -f DarkGreen}else{Write-Host $_.Name '- не доступен!' -f Red}}
