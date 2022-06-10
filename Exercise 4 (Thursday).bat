@echo off
set dayofweek=%DATE:~0,3%
If "%dayofweek%"=="Thu" (set /p choise=Нужен дополнительный акцепт, продолжить установку? Y/N: )