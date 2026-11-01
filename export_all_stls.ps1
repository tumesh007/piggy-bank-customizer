# ==============================================================================
# OpenSCAD Piggy Bank Batch STL Exporter for Bambu Lab A1 Mini / Standard
# ==============================================================================
# Usage:
#   powershell -ExecutionPolicy Bypass -File .\export_all_stls.ps1
# Optional parameters:
#   powershell -ExecutionPolicy Bypass -File .\export_all_stls.ps1 -Profile "A1_Mini"
#   powershell -ExecutionPolicy Bypass -File .\export_all_stls.ps1 -Profile "Standard_256"
# ==============================================================================

param(
    [string]$Profile = "A1_Mini",
    [string]$OutputDir = "$PSScriptRoot\Piggy_Bank_STLs"
)

$OpenScadPath = "C:\Program Files\OpenSCAD\openscad.com"
if (-not (Test-Path $OpenScadPath)) {
    $OpenScadPath = "openscad"
}

$ScadFile = "$PSScriptRoot\Piggy_Bank_Batch_Export.scad"

if (-not (Test-Path $ScadFile)) {
    Write-Error "Could not find $ScadFile"
    exit 1
}

if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Piggy Bank Batch STL Exporter" -ForegroundColor Cyan
Write-Host " Target Profile: $Profile" -ForegroundColor Yellow
Write-Host " Output Directory: $OutputDir" -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Export Stopper (Shared across all 4 children)
Write-Host "`n[1/10] Exporting single Stopper..." -ForegroundColor Green
& $OpenScadPath -o "$OutputDir\Stopper.stl" --export-format binstl -D "Printer_Profile=`"$Profile`"" -D "export_part=`"stopper`"" $ScadFile

# 2. Export 4x Stoppers Batch (2x2 grid for printing on one plate)
Write-Host "[2/10] Exporting Stoppers 4x Batch Plate..." -ForegroundColor Green
& $OpenScadPath -o "$OutputDir\Stoppers_Batch_x4.stl" --export-format binstl -D "Printer_Profile=`"$Profile`"" -D "export_part=`"stoppers_batch`"" $ScadFile

# Children names
$Children = @("Shivansh", "Luvish", "Janice", "Nivaan")
$idx = 3

foreach ($Child in $Children) {
    Write-Host "[$idx/10] Exporting Body for $Child..." -ForegroundColor Green
    & $OpenScadPath -o "$OutputDir\${Child}_Body.stl" --export-format binstl -D "Printer_Profile=`"$Profile`"" -D "Child_Name=`"$Child`"" -D "export_part=`"body`"" $ScadFile
    $idx++

    Write-Host "[$idx/10] Exporting Front Plate for $Child..." -ForegroundColor Green
    & $OpenScadPath -o "$OutputDir\${Child}_Front_Plate.stl" --export-format binstl -D "Printer_Profile=`"$Profile`"" -D "Child_Name=`"$Child`"" -D "export_part=`"front_plate`"" $ScadFile
    $idx++
}

Write-Host "`n==========================================================" -ForegroundColor Cyan
Write-Host " Export Complete! All STLs saved to:" -ForegroundColor Green
Write-Host " $OutputDir" -ForegroundColor White
Write-Host "==========================================================" -ForegroundColor Cyan
