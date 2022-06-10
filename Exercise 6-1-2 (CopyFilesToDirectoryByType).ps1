#Каталог для обработки
$sourcePath="C:\Temp\6\Source"
#Целевой каталог
$destinationPath="C:\Temp\6\Destination"

#Цикл для каждого подкаталога. В целевом подкаталоге будет создан каталог для каждого типа файлов.
#В эти каталоги будут скопированны файлы данного типа.
foreach ($SubFolderPath in (Get-ChildItem -Path $sourcePath -Directory -Recurse).FullName)
{
    foreach ($File in (Get-ChildItem -Path $SubFolderPath -File).FullName)
    {
        #Определяем целевой каталог
        [System.IO.FileInfo]$Fileinfo=$File
        $dp=$destinationPath + '\' + $Fileinfo.Extension
        If (!(Test-Path $dp)) {New-Item -Path $dp -ItemType Directory}
        Copy-Item -Path $File -Destination $dp
    }
}