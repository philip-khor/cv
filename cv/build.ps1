param([switch]$Watch)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$fontDir = Join-Path $scriptDir "fonts"
$source  = Join-Path $scriptDir "cv.typ"
$output  = Join-Path $scriptDir "philip_khor-cv.pdf"

if ($Watch) {
  typst watch --font-path $fontDir $source $output
} else {
  typst compile --pdf-standard 1.7 --font-path $fontDir $source $output
}
