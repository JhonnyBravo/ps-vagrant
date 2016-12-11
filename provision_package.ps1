param(
    [switch]$install,
    [switch]$uninstall
)

$dst="$(Split-Path -Parent $profile)\script"

if($install){
    $src_zip=$(find ./ -name *.zip)
    unzip $src_zip -d .

    if($(Test-Path $dst) -eq $false){
        New-Item -ItemType directory $dst
    }

    $src_dir=$(echo $src_zip | sed -e "s/.zip//")
    $src=$(find $src_dir -name *.exe)

    Copy-Item $src $dst
    Remove-Item $src_zip
    Remove-Item -Recurse $src_dir
}elseif($uninstall){
    if(Test-Path $dst){
        $path=$(find $dst -name phantomjs.exe)
        Remove-Item $path
    }
}


<#
.SYNOPSIS
パッケージをインストール / アンインストールします。

.DESCRIPTION
パッケージをインストール / アンインストールします。

.PARAMETER install
パッケージをインストールします。

.PARAMETER uninstall
パッケージをアンインストールします。
#>