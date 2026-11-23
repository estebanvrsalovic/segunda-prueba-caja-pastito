param(
    [string]$IdfPath = "C:\Esp32_Idf\Espressif\frameworks\esp-idf-v5.5.2",
    [string]$Port = "COM5"
)

Write-Host "Using IDF path: $IdfPath"
if (-not (Test-Path $IdfPath)) {
    Write-Error "ESP-IDF path not found: $IdfPath`nPlease update the path or run the export script manually.";
    exit 1
}

Write-Host "Temporarily allowing script execution..."
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

$exportScript = Join-Path $IdfPath 'export.ps1'
if (-not (Test-Path $exportScript)) {
    Write-Error "export.ps1 not found at $exportScript. Verify your ESP-IDF installation.";
    exit 1
}

Write-Host "Sourcing export.ps1..."
try {
    & $exportScript
} catch {
    Write-Warning "Running export.ps1 raised an error: $_";
}

Write-Host "Running idf.py -p $Port flash"
try {
    idf.py -p $Port flash
} catch {
    Write-Error "Failed to run idf.py. Make sure the export script completed successfully and idf.py is on PATH.";
    exit 1
}
