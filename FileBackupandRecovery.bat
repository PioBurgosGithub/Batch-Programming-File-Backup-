@echo off
setlocal enabledelayedexpansion


REM function for main menu
:menu
cls
echo ========================================================================================
echo                A Simple Windows 10 Backup Tool Written in Batch Script
echo                                    Made by: Pio
echo ========================================================================================
echo.
echo Choose an option:
echo 0 - Instructions
echo 1 - Back Up Directory
echo 2 - Delete Directory
echo 3 - Restore Directory
echo E - Exit
echo.
set /P "choice=Enter your choice: "

if /i "%choice%"=="0" goto instructions
if /i "%choice%"=="1" goto backup
if /i "%choice%"=="2" goto delete
if /i "%choice%"=="3" goto restore
if /i "%choice%"=="E" (
    echo Exiting...
    timeout /t 2 > nul
    exit
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 > nul
    goto menu
)

REM ********************************************************************
                                REM Instruction Function 
:instructions
:instructionsLoop
cls
echo About the Program and Instructions
echo.
echo Choose an option:
echo 1 - What does this program do?
echo 2 - Back Up Feature
echo 3 - Delete Feature
echo 4 - Restore Directory
echo M - Main Menu
echo.   

set /P "choice=Enter your choice: "
if /i "%choice%"=="1" goto aboutProgram
if /i "%choice%"=="2" goto instructions_Backup
if /i "%choice%"=="3" goto Instructions_Delete
if /i "%choice%"=="4" goto Instructions_Restore
if /i "%choice%"=="M" (
    echo Returning to Main Menu..
    timeout /t 2 > nul
    goto menu
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 > nul
    goto instructionsLoop
)

:aboutProgram

cls

:validate1
echo This program is a simple Windows 10 Backup Tool written in Batch Script
echo It provides a menu-driven interface with the following main functionalities:
echo 1. Back Up a Directory
echo 2. Delete a Directory
echo 3. Restore a Directory
echo.
echo.
echo.
echo The program includes input validation to handle invalid choices or inputs and aims  
echo to provide a straightforward interface for performing basic backup, deletion, and 
echo restoration tasks on directories.

rem Prompt the user to pick a directory or return to menu
echo.
echo.
set /p "selection=Press [R] to return to Instructions Menu: "

rem Validate the user input
if /i "%selection%"=="R" (
     echo Returning to Instructions Menu...
     timeout /t 2 > nul
     goto instructions
) else if not defined folders[%selection%] (
     echo Invalid input. Please enter a valid input.
     timeout /t 2 > nul
     cls
     goto validate1
)


REM ========================================================
:Instructions_Backup

cls

echo Back Up a Directory:
echo # Allows the user to specify a source directory for backup.
echo # Creates a timestamped backup folder in a designated directory using robocopy to copy files and folders.
echo # Offers the option to back up another folder.
echo.
pause
cls


:validate2
echo Example 
echo    Enter the Source Directory Path: C:\Dummy_Files_Prac\New folder 2
echo.
echo    Log File : D:\Batch_File_Backup_Data\BackUp\Backup_2023-12-06_19-43-53\robocopy_log.txt
echo    Backup completed successfully
echo.
echo    Do you want to back up another folder?
echo    "Type (Y) for yes or enter any key to exit:"

rem Prompt the user to pick a directory or return to menu
echo.
echo.
set /p "selection=Press [R] to return to Instructions Menu: "

rem Validate the user input
if /i "%selection%"=="R" (
     echo Returning to Instructions Menu...
     timeout /t 2 > nul
     goto instructions
) else if not defined folders[%selection%] (
     echo Invalid input. Please enter a valid input.
     timeout /t 2 > nul
     cls
     goto validate2
) 

REM ========================================================
:Instructions_Delete

cls

echo Delete a Directory:
echo # Provides options for temporary and permanent deletion of directories.
echo # Temporarily deleted directories are moved to a 'Deleted' folder.
echo # Permanently deleted directories are removed from the system.
echo # Offers the option to delete another folder.

echo.
pause
cls

:validate3
echo Example of Input for Both Temporary and Permanent Delete 
echo    [1] Backup_2023-11-22_16-44-54
echo    [2] Backup_2023-12-01_15-42-44
echo    [3] Backup_2023-12-01_15-43-49
echo    [4] Backup_2023-12-01_15-44-47
echo    [5] Backup_2023-12-01_16-01-28
echo    [6] Backup_2023-12-01_16-29-17
echo    [7] Backup_2023-12-06_12-43-27
echo    [8] Backup_2023-12-06_13-04-42
echo    [9] Backup_2023-12-06_13-04-54
echo    [10] Backup_2023-12-06_19-43-11
echo    [11] Backup_2023-12-06_19-43-53
echo    [12] Backup_2023-12-06_19-46-13
echo    [13] Backup_2023-12-07_08-51-31
echo    [R] Return to Menu

echo.
echo    /*The User will TYPE THE NUMBER of the Directory they want to delete*/ 
echo.  
echo    Enter the number of the directory you want to pick (or press R to return to Menu): 4
echo.   
echo    /*Depending on which Option(permanent or temporary) you pick the Batch File will delete the vaild input*/
echo.  
echo    Folder has been Deleted.

echo    /*The Program will Ask if you want to Delete another folder*/
echo.
echo    Do you want to delete another folder?
echo    Type (Y) to restore again or enter any key to exit:

rem Prompt the user to pick a directory or return to menu
echo.
echo.
set /p "selection=Press [R] to return to Instructions Menu: "

rem Validate the user input
if /i "%selection%"=="R" (
     echo Returning to Instructions Menu...
     timeout /t 2 > nul
     goto instructions
) else if not defined folders[%selection%] (
     echo Invalid input. Please enter a valid input.
     timeout /t 2 > nul
     cls
     goto validate3
)


REM ========================================================
:Instructions_Restore
cls

echo Restore a Directory:
echo # Allows the user to restore directories from the 'Deleted' folder to their original location.
echo # Offers the option to restore another folder.

echo.
pause
cls


:validate4
echo Example of Input for Restore Feature



echo    [1] Backup_2023-11-22_16-48-11
echo    [2] Backup_2023-11-30_22-09-22
echo    [3] Backup_2023-12-01_15-42-44
echo    [4] Backup_2023-12-01_16-30-23
echo    [5] Backup_2023-12-01_16-32-11
echo    [6] Backup_2023-12-07_08-50-26
echo    [R] Return to Menu
echo.

echo    /*The User will TYPE THE NUMBER of the Directory they want to RESTORE*/ 
echo.  
echo    Enter the number of the directory you want to pick (or press R to return to Menu): 4

echo.  
echo    Folder has been successfully restored.
echo.
echo    /*The Program will Ask if you want to Restore another folder*/
echo.  
echo    Do you want to restore another folder?
echo    Type (Y) to restore again or enter any key to exit:

rem Prompt the user to pick a directory or return to menu
echo.
echo.
set /p "selection=Press [R] to return to Instructions Menu: "

rem Validate the user input
if /i "%selection%"=="R" (
     echo Returning to Instructions Menu...
     timeout /t 2 > nul
     goto instructions
) else if not defined folders[%selection%] (
     echo Invalid input. Please enter a valid input.
     timeout /t 2 > nul
     cls
     goto validate4
)

REM ********************************************************************

                                REM function that backs up files.
:backup
:backupLoop 
REM purpose of backupLoop function is used as a reference point for looping back to a specific section of the code.

cls

rem Ask the user if they want to enter a source directory or return to the main menu
echo Do you want to:
echo 1 - Enter a source directory
echo 2 - Return to Main Menu
set /p "choice=Enter your choice: "

if /i "%choice%"=="1" goto enterSourceDirectory
if /i "%choice%"=="2" (
    echo Returning to Main Menu..
    timeout /t 2 > nul
    goto menu
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 > nul
    goto backupLoop
)


:enterSourceDirectory
cls

rem Create 'Backup' folder if it doesn't exist
if not exist "D:\Batch_File_Backup_Data\BackUp" mkdir "D:\Batch_File_Backup_Data\BackUp"
attrib +r "D:\Batch_File_Backup_Data\BackUp"

cls

rem Prompt user for the source directory
echo BackUp Data
echo.
set /p "sourceDir=Enter the source directory path: "

rem Ensure the source directory path is enclosed in double quotes
rem Some Folders or Files have spaces in its name. The purpose of double quotes are so that the CLI can read names with spaces
set "sourceDir="%sourceDir%""

rem Check if the entered source directory exists
rem If the Directory does not exist Program will ask user to input another directory
if not exist %sourceDir% (
    echo Directory does not exist. Please input another directory.
    timeout /t 2 > nul
    cls
    goto backupLoop
)

rem Set destination directory
set "backupDir=D:\Batch_File_Backup_Data\BackUp"

rem Set timestamp for the backup folder
for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set datetime=%%a
set "timestamp=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%-%datetime:~12,2%"
rem Backup_Year-Month-Day-Hour-Minute-Second
rem example of Folder Name:
rem Backup_2023-12-01_15-43-49

rem Create backup folder
set "backupFolder=%backupDir%\Backup_%timestamp%"
mkdir "%backupFolder%"

rem Use robocopy to copy files and folders
rem robocopy_log.txt will contain the metadata of the BackUp Folder
rem Example of MetaData are Source Directory, Destination Directory, Download Time Started and Download Time Ended
robocopy %sourceDir% "%backupFolder%" /E /COPY:DAT /DCOPY:T /R:1 /W:1 /V /LOG:"%backupFolder%\robocopy_log.txt"

echo.
echo Backup completed successfully.
pause
cls

REM Ask the user if they want to perform the same process again
echo Do you want to back up another folder?
set /p "repeat=Type (Y) for yes or enter any key to exit: "
if /i "%repeat%"=="Y" goto backupLoop
cls
goto menu

REM **************************************************************************

                        REM Change Directory Functions
:ChangeToDeletedDirectory
cd /d "D:\Batch_File_Backup_Data\BackUp\Deleted"
exit /b

:ChangeToBackupDirectory
cd /d "D:\Batch_File_Backup_Data\BackUp"
exit /b


REM **************************************************************************
                    REM Function to delete a directory
:delete

rem change directory to .\BackUp folder
call :ChangeToBackupDirectory

rem Create 'Backup\Deleted' folder if it doesn't exist
if not exist "D:\Batch_File_Backup_Data\BackUp\Deleted" mkdir "D:\Batch_File_Backup_Data\BackUp\Deleted"
attrib +r +h "D:\Batch_File_Backup_Data\BackUp\Deleted"
rem 'Backup\Deleted' is where we will temporarily "delete" our Folders
rem  using 'Backup\Deleted' is not a true remove directory command. We just move our files here so 
rem that we can have the option to recover our files later.

cls

:delMenu
echo Choose an option:
echo 1 - temporarily delete
echo 2 - permanently delete
echo E - Exit
echo.
set /P "choice=Enter your choice: "

if /i "%choice%"=="1" goto tempDelete
if /i "%choice%"=="2" goto permaDelete
if /i "%choice%"=="E" (
    echo Exiting...
    timeout /t 2 > nul
    goto menu
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 > nul
    cls
    goto delMenu
)
REM ============================================================
                    
:tempDelete
:tempDeleteLoop

cls
echo Temporarily Delete
echo.
rem Use a for loop to iterate over directories. This loop shows all folders present current directory
set /a count=1
for /d %%i in (*) do (
    echo [!count!] %%i
    set "folders[!count!]=%%i"
    set /a count+=1
)

rem Check if there are any folders in the current directory.
rem if there are none it will go to the Main Menu
if %count% equ 1 (
    echo There are no folders currently in my directory.
    timeout /t 2 > nul
    goto menu
)



:validateTempDeleteSelection
echo [R] Return to Menu 
rem Prompt the user to pick a directory or return to menu
echo.
echo.
set /p "selection=Enter the number of the directory you want to pick (or press R to return to Menu): "

rem Validate the user input
if /i "%selection%"=="R" (
     echo Returning to Menu...
     timeout /t 2 > nul
     goto menu
) else if not defined folders[%selection%] ( 
    echo Invalid input. Please enter a valid input.
    timeout /t 2 > nul
    cls
    echo Temporarily Delete
    set /a count=1
    for /d %%i in (*) do (
        echo [!count!] %%i
        set "folders[!count!]=%%i"
        set /a count+=1
    )
    goto validateTempDeleteSelection
) else if %selection% lss 1 (
    echo Invalid input. Please enter a valid input.
    timeout /t 2 > nul
    cls
    echo Temporarily Delete
    set /a count=1
    for /d %%i in (*) do (
        echo [!count!] %%i
        set "folders[!count!]=%%i"
        set /a count+=1
    )
    goto validateTempDeleteSelection
) else if %selection% gtr %count% (
    echo Invalid input. Please enter a valid input.
    timeout /t 2 > nul
    cls
    echo Temporarily Delete
    set /a count=1
    for /d %%i in (*) do (
        echo [!count!] %%i
        set "folders[!count!]=%%i"
        set /a count+=1
    )
    goto validateTempDeleteSelection
)



rem User selected directory
set "selectedDir=!folders[%selection%]!"
echo.
echo You selected: %selectedDir%

rem Set the source directory path
set "sourceDir=%selectedDir%"

rem Set the destination directory path
set "deleteDir=D:\Batch_File_Backup_Data\BackUp\Deleted"

rem Use move to move the source directory to the destination directory
move %sourceDir% %deleteDir%

echo.
echo Folder has been temporarily deleted.
pause
cls

REM Ask the user if they want to perform the same process again
echo Do you want to temporarily delete another folder? 
set /p "repeat= Type (Y) to temporarily delete again or enter any key to exit: "
if /i "%repeat%"=="Y" goto tempDeleteLoop
cls
goto menu

REM ====================================================================================
:permaDelete
:permaDeleteLoop
call :ChangeToDeletedDirectory

cls

echo Permanently Delete
rem Use a for loop to iterate over directories.This loop shows all folders present current directory
set /a count=1
for /d %%i in (*) do (
    echo [!count!] %%i
    set "folders[!count!]=%%i"
    set /a count+=1
)

rem Check if there are any folders in the current directory
rem if there are none it will go to the Main Menu
if %count% equ 1 (
    echo There are no folders currently in my directory.
    timeout /t 2 > nul
    goto menu
)


:validatePermaDeleteSelection
echo [R] Return to Menu
rem Prompt the user to pick a directory or quit
echo.
echo.
set /p "selection=Enter the number of the directory you want to pick (or press R to return to Menu): "

rem Validate the user input
if /i "%selection%"=="R" (
    echo Returning to Menu...
    timeout /t 2 > nul
    goto menu
) else if not defined folders[%selection%] (
    echo Invalid input. Please enter a valid input.
    timeout /t 2 > nul
    cls
    echo Permanently Delete
    set /a count=1
    for /d %%i in (*) do (
        echo [!count!] %%i
        set "folders[!count!]=%%i"
        set /a count+=1
    )
    goto validatePermaDeleteSelection
) else if %selection% lss 1 (
    echo Invalid input. Please enter a valid input.
    timeout /t 2 > nul
    cls
    echo Permanently Delete
    set /a count=1
    for /d %%i in (*) do (
        echo [!count!] %%i
        set "folders[!count!]=%%i"
        set /a count+=1
    )
    goto validatePermaDeleteSelection
) else if %selection% gtr %count% (
    echo Invalid input. Please enter a valid input.
    timeout /t 2 > nul
    cls
    echo Permanently Delete
    set /a count=1
    for /d %%i in (*) do (
        echo [!count!] %%i
        set "folders[!count!]=%%i"
        set /a count+=1
    )
    goto validatePermaDeleteSelection
)


rem User selected directory
set "selectedDir=!folders[%selection%]!"
echo You selected: %selectedDir%
echo.

rem Set the source directory path
set "sourceDir=%selectedDir%"

rem Use rmdir /s /q to permanently delete the source directory
rmdir /s /q "%sourceDir%"

echo.
echo Folder has been permanently deleted.
pause
cls

REM Ask the user if they want to perform the same process again
echo Do you want to permanently delete another folder?
set /p "repeat= Type (Y) to permanently delete again or enter any key to exit: "
if /i "%repeat%"=="Y" goto permaDeleteLoop
cls
goto :menu
REM ==========================================================================================


REM **************************************************************************


                    REM Function to restore a directory
:restore
:restoreLoop
rem restoreLoop used as a reference point for looping back to a specific section of the code.

rem change directory to .\Deleted
call :ChangeToDeletedDirectory 


cls
echo.
echo Restore Files
rem Use a for loop to iterate over directories.This loop shows all folders present current directory
set /a count=1
for /d %%i in (*) do (
    echo [!count!] %%i
    set "folders[!count!]=%%i"
    set /a count+=1
)

rem Check if there are any folders in the current directory
rem if there are none it will go to the Main Menu
if %count% equ 1 (
    echo There are no folders currently in my directory.
    timeout /t 2 > nul
    goto menu
)


:validateRestoreSelection
echo [R] Return to Menu
rem Prompt the user to pick a directory or quit
echo.
echo.
set /p "selection=Enter the number of the directory you want to pick (or press R to return to Menu): "

rem Validate the user input
if /i "%selection%"=="R" (
    echo Returning to Menu...
    timeout /t 2 > nul
    goto menu
) else if not defined folders[%selection%] (
    echo Invalid input. Please enter a valid input.
    timeout /t 2 > nul
    cls
    echo Restore Files
    set /a count=1
    for /d %%i in (*) do (
        echo [!count!] %%i
        set "folders[!count!]=%%i"
        set /a count+=1
    )
    goto validateRestoreSelection
)  else if %selection% lss 1 (
    echo Invalid input. Please enter a valid input.
    timeout /t 2 > nul
    cls
    echo Restore Files
    set /a count=1
    for /d %%i in (*) do (
        echo [!count!] %%i
        set "folders[!count!]=%%i"
        set /a count+=1
    )
    goto validateRestoreSelection
) else if %selection% gtr %count% (
    echo Invalid input. Please enter a valid input.
    timeout /t 2 > nul
    cls
    echo Restore Files
    set /a count=1
    for /d %%i in (*) do (
        echo [!count!] %%i
        set "folders[!count!]=%%i"
        set /a count+=1
    )
    goto validateRestoreSelection
)


rem User selected directory
set "selectedDir=!folders[%selection%]!"
echo You selected: %selectedDir%
echo.

rem Set the source directory path
set "sourceDir=%selectedDir%"

rem Set the destination directory path
set "restoreDir=D:\Batch_File_Backup_Data\BackUp"

rem Use move to move the source directory to the destination directory
move %sourceDir% %restoreDir%

echo.
echo Folder has been successfully restored.
pause
cls

REM Ask the user if they want to perform the same process again
echo Do you want to restore another folder?
set /p "repeat=Type (Y) to restore again or enter any key to exit: "
if /i "%repeat%"=="Y" goto restoreLoop

cls
goto :menu