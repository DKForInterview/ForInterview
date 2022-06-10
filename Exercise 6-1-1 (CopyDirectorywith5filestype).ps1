#Каталог для обработки
$sourcePath="C:\Temp\6\Source"
#Целевой каталог
$destinationPath="C:\Temp\6\Destination"
#Количество типов файлов в каталоге
$typescount=5

#Цикл для каждого подкаталога, в котором подсчитывается количество типов файлов.
#Если их количество больше заданного значения, то каталог копируется со всем содержимым.
foreach ($SubFolderPath in (Get-ChildItem -Path $sourcePath -Directory -Recurse).FullName)
{
    If ((Get-ChildItem -Path $SubFolderPath -File | Group-Object Extension | Measure-Object | %{$_.Count}) -gt $typescount)
    {
        Copy-Item -Path $SubFolderPath -Destination $destinationPath -Recurse
    }
}