# count down clock

# 基準時刻 (定時) を定義
$st = $True
while ($st) {
	Write-Host "今日の定時を入力してね 例: 18:00"
	$readStr = Read-Host
	$goHomeTime = Get-Date -Date $readStr
	
	# 入力文字列をDateとして解釈できなければ、もう一度受け付ける
	if (!$?) {
		Write-Host "入力形式が不正です"
		Write-Host ""
	} else {
		$st = $False
	}
}

# 無限ループ
while (1) {
	# 現在時刻と基準時刻との差異を計算
	$nowDate = Get-Date
	$timeSpan = $goHomeTime - $nowDate

	# 表示させる文言を作成
	# 午前中は、昼休み分を除いて計算
	if ($nowDate.Hour -lt 13) {

		$timeSpanStr = "定時まで" + ($timeSpan.Hours - 1) + "時間" + $TimeSpan.Minutes + "分"

	} else {

		$timeSpanStr = "定時まで" + $timeSpan.Hours + "時間" + $TimeSpan.Minutes + "分"

	}

	# 表示
	Clear-Host
	Write-Host $timeSpanStr

	# 1分待機
	Start-Sleep 60
}
