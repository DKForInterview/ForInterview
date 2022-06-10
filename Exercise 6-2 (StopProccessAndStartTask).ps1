#Название процесса
$ProcessName="ReportService"
#Название задачи
$TaskName="Service ReportService"
#Путь расположения задачи
$TaskPath="\Report\"

$cred=Get-Credential
Invoke-Command -ComputerName OscarTestApp -Credential $cred -ScriptBlock {
    Stop-Process -Name $ProcessName
    Start-ScheduledTask -TaskPath $TaskPath -TaskName $TaskName
}