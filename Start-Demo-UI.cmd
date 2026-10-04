@echo off
rem Double-click to start the demo UI; it opens in your browser. Close this window to stop it.
rem Uses demo\.venv when present (full ML stack: live runs). Otherwise any Python 3.9+ serves the
rem saved results; live runs then need the venv, so use Start-Demo-UI-Simulate.cmd for UI work.
rem Extra arguments pass through, e.g.  Start-Demo-UI.cmd --simulate --ui path\to\build
cd /d "%~dp0demo"
if exist ".venv\Scripts\python.exe" (
  ".venv\Scripts\python.exe" server.py --open %*
) else (
  where py >nul 2>nul && (py -3 server.py --open %*) || (python server.py --open %*)
)
pause
