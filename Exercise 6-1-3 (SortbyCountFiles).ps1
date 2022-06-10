#Каталог для обработки
$sourcePath="C:\Temp\6\Source"

$folders = @()   
Foreach ($SubFolderPath in (Get-ChildItem -Path $sourcePath -Directory -Recurse).FullName) 
{
    $CountFiles=Get-ChildItem -Path $SubFolderPath -File | Measure-Object | %{$_.Count}
    $size=(Get-ChildItem $SubFolderPath -Recurse -Force| Measure-Object -Sum Length).Sum
    $obj=@([pscustomobject]@{Directory=$SubFolderPath;CountFiles=$CountFiles;Size=$size})
    $folders=$folders+$obj
}
$folders | Sort-Object -Property CountFiles -Descending