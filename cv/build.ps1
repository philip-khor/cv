param([switch]$Watch)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$fontDir = Join-Path $scriptDir "fonts"
$pkgDir  = Join-Path $scriptDir "..\typst-packages"
$source  = Join-Path $scriptDir "cv.typ"
$output  = Join-Path $scriptDir "philip_khor-cv.pdf"

if ($Watch) {
  typst watch --font-path $fontDir --package-path $pkgDir $source $output
} else {
  typst compile --font-path $fontDir --package-path $pkgDir $source $output
}
