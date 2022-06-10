#Каталог с отчетами
$ReportPath="D:\Update\Report"
#Формат файлов отчетов
$ReportType="**.rptdesign"
#Сервера, куда требуется отправлять отчеты
$servers=@("OscarProd01","OscarProd02")
#Шаблон для поиска
$searchstring="test/report_result\?uuid="
#Значение, на которое требуется заменить шаблон
$replacestring="prod/report_result?uuid="
#Пользователь сервера
$user='deployreport'
#Пароль пользователя
$password='dfsgdf32'
#Каталог для отчетов
$reportdir='/opt/IBM/profiles/report'
#Служба, которую нужно перезапустить
$service='RepResultService'

#Для каждого файла отчета выполняется замена значений в строках
foreach ($ReportFile in Get-ChildItem -Path $ReportPath -File -Filter $ReportType) {
   $file_content = Get-Content -Path $ReportFile.FullName
   $file_content -replace $searchstring, $replacestring | Set-Content -Path $ReportFile.FullName
    
    #Копирование файла на сервера
    foreach ($server in $servers) {
        #Формируем строку для подключения
        $transfer=$user+'@'+$server+':'+$reportdir
        #Используем PSCP.exe для передачи файла. Можно использовать module PS Posh-SSH
        pscp.exe -pw $password $ReportFile.FullName $transfer
    }
}

#Операции, которые нужно выполнить на удалённых серверах
foreach ($server in $servers) {
        #Смена прав доступа       
        plink.exe -pw $password -batch ${user}@${server} "find $reportdir -type f -exec chmod 644 {} \;"  
        #Смена владельца
        plink.exe -pw $password -batch ${user}@${server} "find $reportdir -type f -exec sudo chown RepResult:RepResult {} \;"
        #Перезапуск службы
        plink.exe -pw $password -batch ${user}@${server} "sudo systemctl restart $service"
    }

Write-Host ('Обновление успешно завершено')