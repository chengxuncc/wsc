echo off
(echo select disk 2&echo.offline disk&echo.attr disk clear readonly)|diskpart
sleep 3