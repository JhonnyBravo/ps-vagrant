param(
    [string]$path,
    [switch]$x32,
    [switch]$x64
)

if($x32){
    $package="vagrant_1.9.8_i686.msi"
}elseif($x64){
    $package="vagrant_1.9.8_x86_64.msi"
}

Import-Csv $path | ForEach-Object {
    If ($_.Title -eq $package){
        $url=$_.URL
    }
}

if("$url"){
    firefox "$url"
}

<#
.SYNOPSIS
CSV に記載された URL から vagrant のパッケージをダウンロードします。

.DESCRIPTION
OS のアーキテクチャに合わせて CSV に記載された URL から
vagrant のパッケージをダウンロードします。

.PARAMETER path
URL リストのパス。

.PARAMETER x32
32 bit 版のパッケージをダウンロードします。

.PARAMETER x64
64 bit 版のパッケージをダウンロードします。
#>
