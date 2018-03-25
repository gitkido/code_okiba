# Cut-FileName
# 
# ファイル名の不要部分を除去する。
# 例: ★実施済★試験仕様書.xlsx → 試験仕様書.xlsx
# 
# usage:
# Cut-FileName {ディレクトリ} {削除したい文字列} 
# {モード(R:再帰 未指定:ディレクトリ直下のみ)}

param(
	[Parameter(Mandatory)]$parentDir,
	[Parameter(Mandatory)]$delStr,
	$mode
)

if ($mode -eq "R") {
	$command = "Get-ChildItem -Recurse -File $parentDir"
} else {
	$command = "Get-ChildItem -File $parentDir"
}

Invoke-Expression $command | %{
	$BefPath = $_.FullName
	$AftPath = $BefPath -replace $delStr, ""
	
	if ($BefPath -ne $AftPath) {
		Move-Item $BefPath $AftPath
		Write-Host "置換: " $BefPath
	}
}
