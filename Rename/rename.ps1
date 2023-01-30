$folder = Read-Host "Inserisci il percorso della cartella"
$removeText = Read-Host "Inserisci il testo da rimuovere dal titolo dei file"
Get-ChildItem $folder | ForEach-Object {
    $newName = $_.Name -replace $removeText, ""
    Rename-Item $_.FullName -NewName $newName
}
