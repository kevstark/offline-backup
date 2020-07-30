::
:: BackupTools Update from local Dropbox sync
::
::

:: Setup global variables and robocopy arguments
FOR /F "tokens=2-4 delims=/ " %%a IN ('DATE /T') DO (SET _curdate=%%c%%b%%a)

SET _backupmirror=/MIR
SET _exclude=/XD ".git"
SET _options=/Z /COPY:DAT /R:10 /W:1 /XJ /TEE /BYTES /NP

:: Copy/update contents of data directories
SET log=/LOG+:"%_logpath%\%_curdate%.update.dropbox.log" 
ROBOCOPY "C:\Users\%USERNAME%\Dropbox\Backup\BackupTools"  	"."  	%_backupmirror% %_options% %_exclude%

