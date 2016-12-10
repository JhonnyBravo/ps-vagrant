param(
    [string]$path
)

$url=$(Get-Content $path)
$dst=$(Split-Path $url -Leaf)

wget $url -OutFile $dst