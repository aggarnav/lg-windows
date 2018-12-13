@echo off
setlocal EnableDelayedExpansion
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
set "UserChoice=abort"
set /P "UserChoice=Enter lg number(2 for slave and 1 for master): "
set \n=^


rem ** Two empty lines are required
echo "installing google earth"
if %OS%==32BIT (
	powershell -Command "(New-Object Net.WebClient).DownloadFile('https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.2.exe', 'googleearthprowin-7.3.2.exe')"
	start "" googleearthprowin-7.3.2.exe
	echo "done installing google earth"
	if "!UserChoice!"=="2" (
	powershell -Command "(gc 'C:\Program Files (x86)\Google\Google Earth Pro\client\drivers.ini') -replace '    GPUTLPerfRating = 1.0', '    GPUTLPerfRating = 1.0!\n!	ViewSync/send = false!\n!	ViewSync/receive = true!\n!	ViewSync/port = 21567!\n!	ViewSync/yawOffset = -36.5!\n!	ViewSync/pitchOffset = 0.0!\n!	ViewSync/rollOffset = 0.0!\n!	ViewSync/horizFov = 36.5' | Out-File 'C:\Program Files (x86)\Google\Google Earth Pro\client\drivers.ini'"
	
	)
	if "!UserChoice!"=="1" (
		set "SIP=abort"
		set /P "SIP=Enter slave's ip: "
		powershell -Command "(gc 'C:\Program Files (x86)\Google\Google Earth Pro\client\drivers.ini') -replace '    GPUTLPerfRating = 1.0', '    GPUTLPerfRating = 1.0!\n!	ViewSync/send = true!\n!	ViewSync/receive = false!\n!	ViewSync/hostname = !SIP!!\n!	ViewSync/port = 21567!\n!	ViewSync/yawOffset = 0!\n!	ViewSync/pitchOffset = 0.0!\n!	ViewSync/rollOffset = 0.0!\n!	ViewSync/horizFov = 36.5' | Out-File 'C:\Program Files (x86)\Google\Google Earth Pro\client\drivers.ini'"
	)
	
)
	
if %OS%==64BIT (
	powershell -Command "(New-Object Net.WebClient).DownloadFile('https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.2-x64.exe', 'googleearthprowin-7.3.2-x64.exe')"
	start "" googleearthprowin-7.3.2-x64.exe
	echo "done installing google earth"
	if "!UserChoice!"=="2" (
	powershell -Command "(gc 'C:\Program Files\Google\Google Earth Pro\client\drivers.ini') -replace '    GPUTLPerfRating = 1.0', '    GPUTLPerfRating = 1.0!\n!	ViewSync/send = false!\n!	ViewSync/receive = true!\n!	ViewSync/port = 21567!\n!	ViewSync/yawOffset = -36.5!\n!	ViewSync/pitchOffset = 0.0!\n!	ViewSync/rollOffset = 0.0!\n!	ViewSync/horizFov = 36.5' | Out-File 'C:\Program Files\Google\Google Earth Pro\client\drivers.ini'"
	
	)
	if "!UserChoice!"=="1" (
		set "SIP=abort"
		set /P "SIP=Enter slave's ip: "
		powershell -Command "(gc 'C:\Program Files\Google\Google Earth Pro\client\drivers.ini') -replace '    GPUTLPerfRating = 1.0', '    GPUTLPerfRating = 1.0!\n!	ViewSync/send = true!\n!	ViewSync/receive = false!\n!	ViewSync/hostname = !SIP!!\n!	ViewSync/port = 21567!\n!	ViewSync/yawOffset = 0!\n!	ViewSync/pitchOffset = 0.0!\n!	ViewSync/rollOffset = 0.0!\n!	ViewSync/horizFov = 36.5' | Out-File 'C:\Program Files\Google\Google Earth Pro\client\drivers.ini'"
	)
)



endlocal