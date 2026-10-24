# Refreshes the static "Present (N yrs M mos)" text of #currentTimespan in cv.html,
# so the CV reads correctly without JavaScript. The inline script next to the span
# applies the same rule in the browser; both read the start month from data-start.

$path = Join-Path $PSScriptRoot 'cv.html'
$html = [IO.File]::ReadAllText($path)

$pattern = '(<span id="currentTimespan"[^>]*data-start="(\d{4})-(\d{2})"[^>]*>[^<]*\()[^)]*(\)</span>)'
$match = [regex]::Match($html, $pattern)
if (-not $match.Success) {
    throw "Couldn't find the #currentTimespan span with a data-start attribute in $path"
}

# Count the current month too (LinkedIn style)
$now = Get-Date
$total = ($now.Year - [int]$match.Groups[2].Value) * 12 + ($now.Month - [int]$match.Groups[3].Value) + 1
$years = [math]::Floor($total / 12)
$months = $total % 12

$parts = @()
if ($years -gt 0) { $parts += "$years yr" + $(if ($years -ne 1) { 's' } else { '' }) }
if ($months -gt 0) { $parts += "$months mo" + $(if ($months -ne 1) { 's' } else { '' }) }
$duration = $parts -join ' '

$updated = $html.Substring(0, $match.Index) +
    $match.Groups[1].Value + $duration + $match.Groups[4].Value +
    $html.Substring($match.Index + $match.Length)

if ($updated -ceq $html) {
    Write-Output "Already current: $duration"
} else {
    [IO.File]::WriteAllText($path, $updated, [Text.UTF8Encoding]::new($false))
    Write-Output "Updated to: $duration"
}
