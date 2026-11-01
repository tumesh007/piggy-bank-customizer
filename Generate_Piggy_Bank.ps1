param(
    [string]$Name = "",
    [string]$Profile = "A1_Mini",
    [string]$OutputDir = "$HOME\Downloads",
    [switch]$SyncToWebApp
)

$OpenScad = "C:\Program Files\OpenSCAD\openscad.com"
if (-not (Test-Path $OpenScad)) {
    $OpenScad = "openscad"
}

$RepoDir = "C:\Users\tumes\Downloads\piggy-bank-customizer"
$ScadFile = "$RepoDir\Piggy_Bank_Batch_Export.scad"

if (-not (Test-Path $ScadFile)) {
    Write-Host "Error: Could not locate $ScadFile" -ForegroundColor Red
    exit 1
}

# Prompt if name was not provided
if ([string]::IsNullOrWhiteSpace($Name)) {
    Write-Host "==========================================================" -ForegroundColor Cyan
    Write-Host " PIGGY BANK 1-CLICK GENERATOR (OpenSCAD CGAL Engine)" -ForegroundColor Cyan
    Write-Host "==========================================================" -ForegroundColor Cyan
    $Name = Read-Host "Enter child / custom name (e.g. AARAV, SIMRAN, ROHIT)"
}

$Name = $Name.Trim().ToUpper()
if ([string]::IsNullOrWhiteSpace($Name)) {
    Write-Host "Name cannot be empty!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Generating authentic OpenSCAD STLs for: $Name" -ForegroundColor Yellow
Write-Host "Profile: $Profile (Bambu Lab A1 Mini 180x180mm)" -ForegroundColor Gray
Write-Host "Output Directory: $OutputDir" -ForegroundColor Gray
Write-Host "----------------------------------------------------------" -ForegroundColor DarkGray

# 1. Generate Body
$BodyFile = "$OutputDir\${Name}_Body.stl"
Write-Host "[1/2] Compiling Body (hollow cavity, top coin slot, twist-lock socket)..." -ForegroundColor Green
$argList1 = @(
    "-o", "$BodyFile",
    "--export-format", "binstl",
    "-D", "Printer_Profile=`"$Profile`"",
    "-D", "Child_Name=`"$Name`"",
    "-D", "export_part=`"body`"",
    "$ScadFile"
)
$p1 = Start-Process -FilePath $OpenScad -ArgumentList $argList1 -Wait -PassThru -NoNewWindow

if ($p1.ExitCode -ne 0) {
    Write-Host "Failed to compile Body STL!" -ForegroundColor Red
    exit 1
}
$bSize = (Get-Item $BodyFile).Length
Write-Host "Body STL created: $BodyFile ($bSize bytes)" -ForegroundColor Cyan

# 2. Generate Front Plate
$PlateFile = "$OutputDir\${Name}_Front_Plate.stl"
Write-Host "[2/2] Compiling Front Plate (raised 3D text, fit tolerance offset)..." -ForegroundColor Green
$argList2 = @(
    "-o", "$PlateFile",
    "--export-format", "binstl",
    "-D", "Printer_Profile=`"$Profile`"",
    "-D", "Child_Name=`"$Name`"",
    "-D", "export_part=`"front_plate`"",
    "$ScadFile"
)
$p2 = Start-Process -FilePath $OpenScad -ArgumentList $argList2 -Wait -PassThru -NoNewWindow

if ($p2.ExitCode -ne 0) {
    Write-Host "Failed to compile Front Plate STL!" -ForegroundColor Red
    exit 1
}
$pSize = (Get-Item $PlateFile).Length
Write-Host "Front Plate STL created: $PlateFile ($pSize bytes)" -ForegroundColor Cyan

# 3. Universal Stopper check
$StopperFile = "$OutputDir\Stopper.stl"
if (-not (Test-Path $StopperFile)) {
    Copy-Item "$RepoDir\models\Stopper.stl" $StopperFile -ErrorAction SilentlyContinue
}

# 4. Sync to Web App if requested
if ($SyncToWebApp) {
    Write-Host ""
    Write-Host "Syncing STLs to Web App repository..." -ForegroundColor Yellow
    Copy-Item $BodyFile "$RepoDir\models\${Name}_Body.stl" -Force
    Copy-Item $PlateFile "$RepoDir\models\${Name}_Front_Plate.stl" -Force
    
    # Update index.html VERIFIED_MODELS
    $IndexPath = "$RepoDir\index.html"
    $indexContent = [System.IO.File]::ReadAllText($IndexPath)
    $keyMatch = "`"$Name`":"
    if (-not $indexContent.Contains($keyMatch)) {
        $insertPoint = "const VERIFIED_MODELS = {"
        $newEntry = "`"$Name`": { body: `"${Name}_Body.stl`", plate: `"${Name}_Front_Plate.stl`", w: 155.0, h: 50.0 },"
        $indexContent = $indexContent.Replace($insertPoint, "$insertPoint`r`n            $newEntry")
        [System.IO.File]::WriteAllText($IndexPath, $indexContent)
        Write-Host "Added $Name to web app verified models." -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " SUCCESS! Files are ready for Bambu Studio in Downloads:" -ForegroundColor Green
Write-Host " - $BodyFile" -ForegroundColor White
Write-Host " - $PlateFile" -ForegroundColor White
Write-Host " - $StopperFile" -ForegroundColor White
Write-Host "==========================================================" -ForegroundColor Cyan
