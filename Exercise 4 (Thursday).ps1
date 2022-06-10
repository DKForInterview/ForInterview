#Функция возвращающая True или Falsе, в зависимости от ответа пользователя
#Функции обязательно требуется передать день недели, в который будет отображаться запрос
Function Get-UserChoise {
    param (
        #Передать значения дня, в который требуется подтверждение пользователем
        [Parameter(ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [ValidateSet ("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")]
        [string]$DayforChoise = $(throw "'DayforChoise' is required argument")
    )
    #Переменная, содержащая текущий день недели
    $DayOfWeek=(Get-Date).DayOfWeek.ToString()
    if ($DayOfWeek -eq $DayforChoise)
        {
            #Переменная, содержащая информацию об ошибочном вводе пользователем
            $errchoise=$true
            #Проверка корректности ввода
            While ($errchoise)
                {
                    Write-Host("Нужен дополнительный акцепт, продолжить установку? (Y/N): ")
                    $Choise=read-host
                    If ("Y","y" -contains $Choise) { $errchoise=$false ; return $True }
                    Elseif ("N","n" -contains $Choise) { $errchoise=$false; return $false }
                    Else { $errchoise=$True }
                }
        }
}


#Пример вызова из другого скрипта
If (Get-UserChoise -DayforChoise Thursday) {Write-Host ("Update agreed by user")}
Else {Write-Host("Update was rejected by the user or other day of the week")}