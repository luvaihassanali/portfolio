$StartDate = [DateTime]'2021-10-01'
$today = Get-Date

$yeardiff = $today.year - $StartDate.year
If($yeardiff -gt 0 -And $StartDate.month -gt $today.month -And $StartDate.day -gt $today.day) { 
    $yeardiff = $yeardiff -1 
}
    
$monthdiff = $today.month - $StartDate.month + ($yeardiff * 12)
If($StartDate.day -gt $today.day) { $monthdiff = $monthdiff -1 }
    
$newDateString = ""

if ($monthdiff -ge 12) {
	$year = [math]::Round($monthdiff / 12)
	$newDateString = $monthdiff % 12
	if ($newDateString -eq 0) {
		if ($year -gt 1) {
			$newDateString = "$year yrs"
		} else {
			$newDateString = "$year yr"
		}
	} else {
		if ($year -gt 1) {
			if ($newDateString -gt 1) {
				$newDateString = "$year yrs $newDateString mos"
			} else {
				$newDateString = "$year yrs $newDateString mo"
			}
		} else {
			if ($newDateString -gt 1) {
				$newDateString = "$year yr $newDateString mos"
			} else {
				$newDateString = "$year yr $newDateString mo"
			}
		}
	}
} else {
	$newDateString = "$monthdiff mos"
}

$formatDateString = 'Present (' + $newDateString + ')'
[regex]$prevString = Get-Content -Path .\cv\prevDate.txt -TotalCount -1
$editString = (Get-Content -path .\cv\cv.html -Raw).TrimEnd()
$prevString.replace($editString, $formatDateString, 1) | Set-Content -Path .\cv\cv.html
$outputDateString = 'Present \(' + $newDateString + '\)'
Set-Content -Path .\cv\prevDate.txt -Value $outputDateString