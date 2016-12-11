param(
    [string]$path
)

$url=$(Get-Content $path)
$dst=$(Split-Path $url -Leaf)

wget $url -OutFile $dst


<#
.SYNOPSIS
URL リストに記載された URL から現在のディレクトリへパッケージをダウンロードします。

.DESCRIPTION
URL リストに記載された URL から現在のディレクトリへパッケージをダウンロードします。

.PARAMETER path
URL リストのパス。
#>