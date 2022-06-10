#Каталог для обработки
$sourcePath="C:\Temp\6\Rename"
#Количество файлов. Если количество файлов в каталоге меньше, то каталог будет переименован
$filescount=3

$small=0
#Цикл для каждого подкаталога, в котором подсчитывается количество файлов.
#Если их количество меньше заданного значения, то каталог будет переименован.
foreach ($SubFolderPath in (Get-ChildItem -Path $sourcePath -Directory -Recurse).FullName | Sort-Object -Descending)
{
    If ((Get-ChildItem -Path $SubFolderPath -File | Measure-Object | %{$_.Count}) -lt $filescount)
    {
        $small++
        $newname='small_'+$small
        Rename-Item -Path $SubFolderPath -NewName $newname
    }
}