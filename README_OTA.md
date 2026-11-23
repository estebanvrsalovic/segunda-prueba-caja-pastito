# OTA / Flash helper

This repository includes a PowerShell helper to initialize ESP-IDF on Windows and flash the built image to `COM5`.

Usage (PowerShell):

1. Open PowerShell in the project folder.
2. Run the script (adjust `-IdfPath` if your ESP-IDF is installed elsewhere):

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
.\scripts\flash_windows.ps1 -IdfPath "C:\Esp32_Idf\Espressif\frameworks\esp-idf-v5.5.2" -Port COM5
```

What the script does:
- Verifies `export.ps1` exists at the given `IdfPath`.
- Temporarily sets execution policy to allow running `export.ps1`.
- Sources `export.ps1` to add `idf.py` to your PATH.
- Runs `idf.py -p <Port> flash`.

If `idf.py` still isn't found after running the script, open the same PowerShell session and run `idf.py --version` to check if it's on PATH. If not, ensure ESP-IDF tools and Python environment are installed following ESP-IDF installation instructions.
