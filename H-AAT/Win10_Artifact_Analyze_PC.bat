
chcp 65001
REM ======================================
REM          Make Directory
REM ======================================

md "C:\Users\%username%\Desktop\H-AAT\Extraction"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze"

REM ======================================
REM          			- Application
REM ======================================
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Application"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Application\Internet Explorer"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Application\Edge Browser"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Application\Windows Store"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Application\Maps"
REM ======================================
REM          			- Registry
REM ======================================
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Registry"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Registry\Web Browser"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Registry\USB Activity"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Registry\MRU"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Registry\Autorun Location"
REM ======================================
REM          			- Memory
REM ======================================
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Memory"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Memory\Prefetch"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Memory\Superfetch"

REM ======================================
REM          			- Windows File
REM ======================================
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Windows File"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Windows File\Event Logs"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Windows File\Shell bag"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Windows File\LNK Files"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Windows File\Thumbcaches"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Windows File\Recycle bin"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Windows File\Windows Indexing Service"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Windows File\Cortana"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Windows File\Notification Center"
md "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze\Windows File\Picture Password"

REM ======================================
REM          Registry Extractor
REM ======================================

cd "C:\Users\%username%\Desktop\H-AAT\Extraction\Analyze"

reg.exe save hklm\sam sam.save

reg.exe save hklm\security security.save

reg.exe save hklm\system system.save

reg.exe save hkcu hkcu.save 

reg.exe save hkcu\software software.save

REM ======================================
REM          Registry Analysis : RegRipper
REM ======================================
cd "C:\Users\%username%\Desktop\H-AAT\RegRipper2.8"

rip.exe -r ..\Extraction\Analyze\sam.save -g ..\Extraction\Analyze\sam.txt -f sam >..\Extraction\Analyze\sam.txt

rip.exe -r ..\Extraction\Analyze\security.save -g ..\Extraction\Analyze\security.txt -f security >..\Extraction\Analyze\security.txt

rip.exe -r ..\Extraction\Analyze\system.save -g ..\Extraction\Analyze\system.txt -f system >..\Extraction\Analyze\system.txt

rip.exe -r ..\Extraction\Analyze\hkcu.save -g ..\Extraction\Analyze\hkcu.txt -f ntuser >..\Extraction\Analyze\hkcu.txt

rip.exe -r ..\Extraction\Analyze\software.save -g ..\Extraction\Analyze\software.txt -f software >..\Extraction\Analyze\software.txt

REM ======================================
REM        Argument 		Set
REM ======================================
FOR /f "tokens=1,2,3,4" %%a IN ('ver') DO set VER=%%a %%b %%c %%d

FOR /f "tokens=1" %%a IN ('date /t') DO set DATE=%%a 

FOR /f "tokens=2,3" %%a IN ('date /t') DO set TIME=%%a %%b

FOR /f "tokens=2" %%a IN ('whoami /user') DO set SID=%%a

chcp 1252
systeminfo>systeminfo.txt
FOR /f "tokens=3,4,5,6,7" %%a IN ('find "OS Name:" systeminfo.txt') DO set OS=%%a %%b %%c %%d %%e

chcp 65001
REM ======================================
REM        PREFECH Files Location
REM ======================================
cd ..

dir /a c:\windows\prefetch >\Extraction\Analyze\Memory\Prefetch\prefetch.txt

dir /a c:\windows\prefetch >\Extraction\Analyze\Memory\Prefetch\superfetch.txt

REM ======================================
REM		Internet 		Explorer
REM ======================================

dir /a "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache" >"Extraction\Analyze\Application\Internet Explorer\inetcache.txt"

dir /a "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCookies" >"Extraction\Analyze\Application\Internet Explorer\inetcookie.txt"
 

REM ======================================
REM		Edge 			Browser
REM ======================================

dir /a "C:\Users\%USERNAME%\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\MicrosoftEdge\User\Default\DataStore\Data\nouser1\120712-0049\DBStore\spartan.edb" >"Extraction\Analyze\Application\Edge Browser\edgeSetting.txt"

dir /a "C:\Users\%USERNAME%\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\#!001\MicrosoftEdge\Cache" >"Extraction\Analyze\Application\Edge Browser\edgeCache.txt"

dir /a "C:\Users\%USERNAME%\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\MicrosoftEdge\User\Default\Recovery\Active">"Extraction\Analyze\Application\Edge Browser\edgeSession.txt"

REM ======================================
REM				Registry
REM ======================================

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\TypedURLs"> "Extraction\Analyze\Registry\Web Browser\typedURL.txt"

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main\WindowsSearch">"Extraction\Analyze\Registry\Web Browser\ieVersion.txt"

reg query "HKEY_LOCAL_MACHINE\SYSTEM\MountedDevices">"Extraction\Analyze\Registry\USB Activity\mountedDev.txt"

reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\USBSTOR">"Extraction\Analyze\Registry\USB Activity\usbStor.txt"

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\CPC\Volume">"Extraction\Analyze\Registry\USB Activity\currConDiv.txt"

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU">"Extraction\Analyze\Registry\MRU\openSaveMRU.txt"

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU">"Extraction\Analyze\Registry\MRU\lastVisitedMRU.txt"

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs">"Extraction\Analyze\Registry\MRU\recentDocs.txt"

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU">"Extraction\Analyze\Registry\MRU\runMRU.txt"

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\CIDSizeMRU">"Extraction\Analyze\Registry\MRU\cidSizeMRU.txt"

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Currentversion\Run">"Extraction\Analyze\Registry\Autorun Location\run.txt"

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Currentversion\RunOnce">"Extraction\Analyze\Registry\Autorun Location\runOnce.txt"


REM ======================================
REM          Maps Application
REM ======================================

dir /a "C:\Users\%USERNAME%\AppData\Local\Packages\Microsoft.WindowsMaps_8wekyb3d8bbwe\LocalState\Graph\11d845678c3f9b5e">"Extraction\Analyze\Application\Maps\maps.txt"

REM ======================================
REM          Windows Files
REM ======================================

dir /a C:\Windows\System32\winevt\Logs>"Extraction\Analyze\Windows File\Event Logs\eventLogs.txt"

dir /a C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows>"Extraction\Analyze\Windows File\Shell bag\userClass.txt"

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop">"Extraction\Analyze\Windows File\Shell bag\shellBag.txt"

dir /a "C:\ProgramData\Microsoft\Windows\Start Menu\Programs">"Extraction\Analyze\Windows File\LNK Files\lnkFiles.txt"

dir /a "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer">"Extraction\Analyze\Windows File\Thumbcaches\thumbCaches.txt"

dir /a C:\$Recycle.Bin\%SID% >"Extraction\Analyze\Windows File\Recycle bin\reCycle.txt"

dir /a "C:\ProgramData\Microsoft\Search\Data\Applications\Windows">Extraction\Analyze\Windows File\Windows Indexing Service\WIS.txt

dir /a "C:\Users\%USERNAME%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\LocalState\ESEDatabase_CortanaCoreInstance\CortanaCoreDb">"Extraction\Analyze\Windows File\Cortana\coreDB.txt"

dir /a "C:\Users\%USERNAME%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AppData\Indexed DB">"Extraction\Analyze\Windows File\Cortana\indexDB.txt"

dir /a "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Notifications">"Extraction\Analyze\Windows File\Notification Center\NotiCen.txt"

reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\PicturePassword\%SID%">"Extraction\Analyze\picpassReg.txt"

dir /a "C:\ProgramData\Microsoft\Windows\SystemData\%SID%\ReadOnly\PicturePassword\">"Extraction\Analyze\Windows File\Picture Password\picpassImg.txt"


REM ======================================
REM          HTML		 Maker
REM ======================================
chcp 1252
cd Extraction
echo ^<!DOCTYPE html^> >index.html
echo ^<html lang="en"^> >>index.html
echo.>>index.html
echo ^<head^> >>index.html
echo.>>index.html
echo ^<title^>Hoseo Artifact Analysis Tool^</title^>
echo     ^<meta charset="utf-8"^> >>index.html
echo     ^<meta http-equiv="X-UA-Compatible" content="IE=edge"^> >>index.html
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1"^> >>index.html
echo     ^<meta name="description" content=""^> >>index.html
echo     ^<meta name="author" content=""^> >>index.html
echo.>>index.html
echo     ^<title^>SB Admin - Bootstrap Admin Template^</title^> >>index.html
echo.>>index.html
echo     ^<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet"^> >>index.html
echo. >>index.html
echo     ^<link href="../bootstrap/css/sb-admin.css" rel="stylesheet"^> >>index.html
echo. >>index.html
echo     ^<link href="../bootstrap/css/plugins/morris.css" rel="stylesheet"^> >>index.html
echo. >>index.html
echo     ^<link href="../bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"^> >>index.html
echo. >>index.html
echo     ^<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries --^>>>index.html
echo    ^<!-- WARNING: Respond.js doesn't work if you view the page via file:// --^>>>index.html
echo     ^<!--[if lt IE 9]^>>>index.html
echo         ^<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"^>^</script^> >>index.html>>index.html
echo         ^<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"^>^</script^> >>index.html>>index.html
echo     ^<![endif]--^>>>index.html
echo.>>index.html
echo ^</head^> >>index.html
echo.>>index.html
echo ^<body^> >>index.html
echo.>>index.html
echo     ^<div id="wrapper"^> >>index.html
echo.>>index.html
echo         ^<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"^> >>index.html
echo        ^<div class="navbar-header"^> >>index.html
echo                 ^<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"^> >>index.html
echo                     ^<span class="sr-only"^>Toggle navigation^</span^> >>index.html
echo                     ^<span class="icon-bar"^>^</span^> >>index.html
echo                     ^<span class="icon-bar"^>^</span^> >>index.html
echo                     ^<span class="icon-bar"^>^</span^> >>index.html
echo                 ^</button^> >>index.html
echo                 ^<a class="navbar-brand" href="index.html"^>H-AAT^</a^> >>index.html
echo             ^</div^> >>index.html
echo             ^<ul class="nav navbar-right top-nav"^> >>index.html
echo                 ^<li class="dropdown"^> >>index.html
echo                     ^<a href="#" class="dropdown-toggle" data-toggle="dropdown"^>^<i class="fa fa-gear"^>^</i^> Team 5 ^<b class="caret"^>^</b^>^</a^> >>index.html
echo                     ^<ul class="dropdown-menu"^> >>index.html
echo                         ^<li^> >>index.html
echo                             ^<a href="#"^>^<i class="fa fa-fw fa-user"^>^</i^> 김유철^</a^> >>index.html
echo                         ^</li^> >>index.html
echo                         ^<li^> >>index.html
echo                             ^<a href="#"^>^<i class="fa fa-fw fa-user"^>^</i^> 성중곤^</a^> >>index.html
echo                         ^</li^> >>index.html
echo                         ^<li^> >>index.html
echo                             ^<a href="#"^>^<i class="fa fa-fw fa-user"^>^</i^> 홍수빈^</a^> >>index.html
echo                         ^</li^> >>index.html
echo                     ^</ul^> >>index.html
echo                 ^</li^> >>index.html
echo     	   ^</ul^> >>index.html
echo.>>index.html
echo         ^</nav^> >>index.html
echo         ^</div^> >>index.html
echo.>>index.html 
echo         ^<div id="page-wrapper"^> >>index.html
echo. >>index.html
echo             ^<div class="container-fluid"^> >>index.html
echo. >>index.html
echo                 ^<div class="row"^> >>index.html
echo                     ^<div class="col-lg-12"^> >>index.html
echo                         ^<h1 class="page-header"^> >>index.html
echo                             Dashboard ^<small^>Statistics Overview^</small^> >>index.html
echo                         ^</h1^> >>index.html
echo                         ^<ol class="breadcrumb"^> >>index.html
echo                             ^<li class="active"^> >>index.html
echo                                 ^<i class="fa fa-dashboard"^>^</i^> Dashboard >>index.html
echo                             ^</li^> >>index.html
echo                         ^</ol^> >>index.html
echo                     ^</div^> >>index.html
echo                 ^</div^> >>index.html
echo. >>index.html
echo. >>index.html
echo              ^<div class="row"^> >>index.html
echo                   ^<div class="col-lg-3 col-md-6"^> >>index.html
echo                        ^<div class="panel panel-primary"^> >>index.html
echo                           ^<div class="panel-heading"^> >>index.html
echo                                ^<div class="row"^> >>index.html
echo                                    ^<div class="col-xs-3"^> >>index.html
echo                                        ^<i class="fa fa-comments fa-5x"^>^</i^> >>index.html
echo                                    ^</div^> >>index.html
echo                                    ^<div class="col-xs-9 text-right"^> >>index.html
echo                                         ^<div class="huge"^> ^</div^> >>index.html
echo                                         ^<div^>^<h3^>%userdomain%^</h3^>^</div^> >>index.html
echo                                 ^</div^> >>index.html
echo                                 ^</div^> >>index.html
echo                             ^</div^> >>index.html
echo                             ^<a href="#"^> >>index.html
echo                                 ^<div class="panel-footer"^> >>index.html
echo                                     ^<span class="pull-left"^>분석 PC명^</span^> >>index.html
echo                                     ^<span class="pull-right"^>^<i class="fa fa-arrow-circle-right"^>^</i^>^</span^> >>index.html
echo                                     ^<div class="clearfix"^>^</div^> >>index.html
echo                                 ^</div^> >>index.html
echo                             ^</a^> >>index.html
echo                         ^</div^> >>index.html
echo                     ^</div^> >>index.html
echo                     ^<div class="col-lg-3 col-md-6"^> >>index.html
echo                         ^<div class="panel panel-green"^> >>index.html
echo                             ^<div class="panel-heading"^> >>index.html
echo                                 ^<div class="row"^> >>index.html
echo                                     ^<div class="col-xs-3"^> >>index.html
echo                                         ^<i class="fa fa-tasks fa-5x"^>^</i^> >>index.html
echo                                     ^</div^> >>index.html
echo                                     ^<div class="col-xs-9 text-right"^> >>index.html
echo                                         ^<div class="huge"^> ^</div^> >>index.html
echo                                         ^<div^>^<h3^>%OS%^</h3^>^</div^> >>index.html
echo                                     ^</div^> >>index.html
echo                                 ^</div^> >>index.html
echo                             ^</div^> >>index.html
echo                             ^<a href="#"^> >>index.html
echo                                 ^<div class="panel-footer"^> >>index.html
echo                                     ^<span class="pull-left"^>OS^</span^> >>index.html
echo                                     ^<span class="pull-right"^> ^<i class="fa fa-arrow-circle-right"^>^</i^>^</span^> >>index.html
echo                                     ^<div class="clearfix"^>^</div^> >>index.html
echo                                 ^</div^> >>index.html
echo                             ^</a^> >>index.html
echo                         ^</div^> >>index.html
echo                     ^</div^> >>index.html
echo                     ^<div class="col-lg-3 col-md-6"^> >>index.html
echo                         ^<div class="panel panel-yellow"^> >>index.html
echo                             ^<div class="panel-heading"^> >>index.html
echo                                 ^<div class="row"^> >>index.html
echo                                     ^<div class="col-xs-3"^> >>index.html
echo                                         ^<i class="fa fa-shopping-cart fa-5x"^>^</i^> >>index.html
echo                                     ^</div^> >>index.html
echo                                     ^<div class="col-xs-9 text-right"^> >>index.html
echo                                         ^<div class="huge"^> ^</div^> >>index.html
echo                                         ^<div^>^<h3^>%VER%^</h3^>^</div^> >>index.html
echo                                     ^</div^> >>index.html
echo                                 ^</div^> >>index.html
echo                             ^</div^> >>index.html
echo                             ^<a href="#"^> >>index.html
echo                                 ^<div class="panel-footer"^> >>index.html
echo                                     ^<span class="pull-left"^>OS 버전^</span^> >>index.html
echo                                     ^<span class="pull-right"^>^<i class="fa fa-arrow-circle-right"^>^</i^>^</span^> >>index.html
echo                                     ^<div class="clearfix"^>^</div^> >>index.html
echo                                 ^</div^> >>index.html
echo                             ^</a^> >>index.html
echo                         ^</div^> >>index.html
echo                     ^</div^> >>index.html
echo                     ^<div class="col-lg-3 col-md-6"^> >>index.html
echo                         ^<div class="panel panel-red"^> >>index.html
echo                             ^<div class="panel-heading"^> >>index.html
echo                                 ^<div class="row"^> >>index.html
echo                                     ^<div class="col-xs-3"^> >>index.html
echo                                         ^<i class="fa fa-support fa-5x"^>^</i^> >>index.html
echo                                     ^</div^> >>index.html
echo                                     ^<div class="col-xs-9 text-right"^> >>index.html
echo                                         ^<div class="huge"^>^</div^> >>index.html
echo                                         ^<div^>^<h3^>%DATE% %TIME:~0,5%^</h3^>^</div^> >>index.html
echo                                     ^</div^> >>index.html
echo                                 ^</div^> >>index.html
echo                             ^</div^> >>index.html
echo                             ^<a href="#"^> >>index.html
echo                                 ^<div class="panel-footer"^> >>index.html
echo                                     ^<span class="pull-left"^>분석 일자^</span^> >>index.html
echo                                     ^<span class="pull-right"^>^<i class="fa fa-arrow-circle-right"^>^</i^>^</span^> >>index.html
echo                                    ^<div class="clearfix"^>^</div^> >>index.html
echo                                ^</div^> >>index.html
echo                           ^</a^> >>index.html
echo                       ^</div^> >>index.html
echo                     ^</div^> >>index.html
echo                 ^</div^> >>index.html
echo 				^<div class="col-lg-12 col-md-12 " align="center"^> >>index.html
echo 					^<a class="btn btn-lg btn-primary" href="source.html" type="button"^>View List^</a^> >>index.html
echo 				^</div^> >>index.html
echo 				^<div class="col-lg-12 col-md-6" align="center"^> >>index.html
echo 					^<div class=panel style=visibility:hidden; display:no;^>^</div^> >>index.html
echo 				^</div^> >>index.html
echo.>>index.html
echo            ^</div^> >>index.html
echo.>>index.html
echo        ^</div^> >>index.html
echo.>>index.html
echo.>>index.html
echo.>>index.html
echo     ^<script src="../bootstrap/js/jquery.js"^>^</script^> >>index.html
echo.>>index.html
echo     ^<script src="../bootstrap/js/bootstrap.min.js"^>^</script^> >>index.html
echo. >>index.html
echo     ^<script src="../bootstrap/js/plugins/morris/raphael.min.js"^>^</script^> >>index.html
echo     ^<script src="../bootstrap/js/plugins/morris/morris.min.js"^>^</script^> >>index.html
echo     ^<script src="../bootstrap/js/plugins/morris/morris-data.js"^>^</script^> >>index.html
echo. >>index.html
echo ^</body^> >>index.html
echo. >>index.html
echo ^</html^> >>index.html

REM ==============================
REM				Source
REM ==============================
echo ^<!DOCTYPE html^> >source.html
echo ^<html lang="en"^>>>source.html
echo.>>source.html
echo ^<head^>>>source.html
echo.>>source.html
echo ^<title^>Hoseo Artifact Analysis Tool^</title^> >>source.html
echo    ^<meta charset="utf-8"^>>>source.html
echo    ^<meta http-equiv="X-UA-Compatible" content="IE=edge"^>>>source.html
echo    ^<meta name="viewport" content="width=device-width, initial-scale=1"^>>>source.html
echo    ^<meta name="description" content=""^>>>source.html
echo    ^<meta name="author" content=""^>>>source.html
echo.>>source.html
echo    ^<title^>SB Admin - Bootstrap Admin Template^</title^>>>source.html
echo    ^<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet"^>>>source.html
echo.>>source.html
echo    ^<link href="../bootstrap/css/sb-admin.css" rel="stylesheet"^>>>source.html
echo.>>source.html
echo    ^<link href="../bootstrap/css/plugins/morris.css" rel="stylesheet"^>>>source.html
echo.>>source.html
echo    ^<link href="../bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"^>>>source.html
echo.>>source.html
echo    ^<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries --^>
echo    ^<!-- WARNING: Respond.js doesn't work if you view the page via file:// --^>
echo    ^<!--[if lt IE 9]^>
echo        ^<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"^>^</script^>>>source.html
echo        ^<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"^>^</script^>>>source.html
echo    ^<![endif]--^>
echo.>>source.html
echo.>>source.html
echo	^</style^>>>source.html
echo ^</head^>>>source.html
echo.>>source.html
echo ^<body style="overflow=hidden"^>>>source.html
echo.>>source.html
echo    ^<div id="wrapper"^>>>source.html
echo.>>source.html
echo        ^<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"^>>>source.html
echo            ^<!-- Brand and toggle get grouped for better mobile display --^>>>source.html
echo            ^<div class="navbar-header"^>>>source.html
echo                ^<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"^>>>source.html
echo                    ^<span class="sr-only"^>Toggle navigation^</span^>>>source.html
echo                    ^<span class="icon-bar"^>^</span^>>>source.html
echo                    ^<span class="icon-bar"^>^</span^>>>source.html
echo                    ^<span class="icon-bar"^>^</span^>>>source.html
echo                ^</button^>>>source.html
echo                ^<a class="navbar-brand" href="index.html"^>H-AAT^</a^>>>source.html
echo            ^</div^>>>source.html
echo            ^<ul class="nav navbar-right top-nav"^>>>source.html
echo                ^<li class="dropdown"^>>>source.html
echo                    ^<a href="#" class="dropdown-toggle" data-toggle="dropdown"^>^<i class="fa fa-gear"^>^</i^> Team 5 ^<b class="caret"^>^</b^>^</a^>>>source.html
echo                    ^<ul class="dropdown-menu"^>>>source.html
echo                        ^<li^>>>source.html
echo                            ^<a href="#"^>^<i class="fa fa-fw fa-user"^>^</i^> 김유철^</a^>>>source.html
echo                        ^</li^>>>source.html
echo                        ^<li^>>>source.html
echo                            ^<a href="#"^>^<i class="fa fa-fw fa-user"^>^</i^> 성중곤^</a^>>>source.html
echo                        ^</li^>>>source.html
echo                        ^<li^>>>source.html
echo                            ^<a href="#"^>^<i class="fa fa-fw fa-user"^>^</i^> 홍수빈^</a^>>>source.html
echo                        ^</li^>>>source.html
echo                    ^</ul^>>>source.html
echo                ^</li^>>>source.html
echo            ^</ul^>>>source.html
echo            ^<div class="collapse navbar-collapse navbar-ex1-collapse"^>>>source.html
echo                ^<ul class="nav navbar-nav side-nav"^>>>source.html
echo                    ^<li^>>>source.html
echo                    	^<a href="index.html"^>Main^</a^>>>source.html
echo                    ^</li^>>>source.html
echo                    ^<li^>>>source.html
echo                        ^<a href="javascript:;" data-toggle="collapse" data-target="#regDown"^>^<i class="fa fa-fw fa-arrows-v"^>^</i^> Registry ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        ^<ul id="regDown" class="collapse"^>>>source.html
echo                           	^<li^>>>source.html
echo		                   		^<a target="myFrame" href="Analyze\system.txt" ^> ^<i class="fa fa-fw fa-file"^>^</i^>HKLM:SYSTEM^</a^>>>source.html
echo			                ^</li^>>>source.html
echo.>>source.html
echo			                ^<li^>>>source.html
echo			                   	^<a target="myFrame" href="Analyze\sam.txt" ^>^<i class="fa fa-fw fa-file"^>^</i^> HKLM:SAM^</a^>>>source.html
echo			                ^</li^>>>source.html  
echo.>>source.html
echo			               	^<li^>>>source.html
echo			                	^<a target="myFrame" href="Analyze\security.txt" ^>^<i class="fa fa-fw fa-file"^>^</i^> HKLM:SECURITY^</a^>>>source.html
echo			               	^</li^> >>source.html
echo.>>source.html
echo			               	^<li^>>>source.html
echo			                   	^<a target="myFrame" href="Analyze\hkcu.txt" ^>^<i class="fa fa-fw fa-file"^>^</i^> HKCU^</a^>>>source.html
echo			               	^</li^>>>source.html
echo			               	^<li^>>>source.html
echo			                   	^<a target="myFrame" href="Analyze\software.txt" ^>^<i class="fa fa-fw fa-file"^>^</i^> HKCU:SOFTWARE^</a^>>>source.html
echo			               	^</li^>>>source.html
echo				^<li^>>>source.html
echo                        	^<a href="javascript:;" data-toggle="collapse" data-target="#regDown2"^>^<i class="fa fa-fw fa fa-fw"^>^</i^> Web Browser ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        	^<ul id="regDown2" class="collapse"^>>>source.html
echo.>>source.html
echo	                   			^<li^>>>source.html
echo			                   		^<a target="myFrame" href="Analyze\Registry\Web Browser\typedURL.txt" ^> ^<i class="fa fa-fw"^>^</i^>Typed URL^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Registry\Web Browser\ieVersion.txt"^> ^<i class="fa fa-fw"^>^</i^>IE Version^</a^>>>source.html
echo				                ^</li^>>>source.html
echo			                ^</ul^>>>source.html
echo				^</li^>>>source.html
echo				^<li^>>>source.html
echo                        	^<a href="javascript:;" data-toggle="collapse" data-target="#regDown3"^>^<i class="fa fa-fw fa fa-fw"^>^</i^> USB Activity ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        	^<ul id="regDown3" class="collapse"^>>>source.html
echo.>>source.html
echo	                   			^<li^>>>source.html
echo			                   		^<a target="myFrame" href="Analyze\Registry\USB Activity\mountedDev.txt" ^> ^<i class="fa fa-fw"^>^</i^>Mounted Devices^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Registry\USB Activity\usbStor.txt"^> ^<i class="fa fa-fw"^>^</i^>USBSTOR^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Registry\USB Activity\currConDiv.txt"^> ^<i class="fa fa-fw"^>^</i^>Current Connected Devices  ^</a^>>>source.html
echo				                ^</li^>>>source.html
echo			                ^</ul^>>>source.html
echo				^</li^>>>source.html
echo				^<li^>>>source.html
echo                        	^<a href="javascript:;" data-toggle="collapse" data-target="#regDown4"^>^<i class="fa fa-fw fa fa-fw"^>^</i^> MRU ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        	^<ul id="regDown4" class="collapse"^>>>source.html
echo.>>source.html
echo	                   			^<li^>>>source.html
echo			                   		^<a target="myFrame" href="Analyze\Registry\MRU\openSaveMRU.txt" ^> ^<i class="fa fa-fw"^>^</i^>OpenSaveMRU^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Registry\MRU\lastVisitedMRU.txt"^> ^<i class="fa fa-fw"^>^</i^>LastVisitedMRU^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Registry\MRU\recentDocs.txt"^> ^<i class="fa fa-fw"^>^</i^>RecentDocs^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Registry\MRU\runMRU.txt"^> ^<i class="fa fa-fw"^>^</i^>RunMRU^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Registry\MRU\cidSizeMRU.txt"^> ^<i class="fa fa-fw"^>^</i^>CIDSizeMRU^</a^>>>source.html
echo				                ^</li^>>>source.html
echo			                ^</ul^>>>source.html
echo				^</li^>>>source.html
echo				^<li^>>>source.html
echo                        	^<a href="javascript:;" data-toggle="collapse" data-target="#regDown5"^>^<i class="fa fa-fw fa fa-fw"^>^</i^> Autorun Location ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        	^<ul id="regDown5" class="collapse"^>>>source.html
echo.>>source.html
echo	                   			^<li^>>>source.html
echo			                   		^<a target="myFrame" href="Analyze\Registry\Autorun Location\run.txt" ^> ^<i class="fa fa-fw"^>^</i^>Run^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Registry\Autorun Location\runOnce.txt"^> ^<i class="fa fa-fw"^>^</i^>RunOnce^</a^>>>source.html
echo				                ^</li^>>>source.html
echo			                ^</ul^>>>source.html
echo				^</li^>>>source.html
echo                        ^</ul^>>>source.html
echo                    ^</li^>>>source.html
echo                    ^<li^>>>source.html
echo                ^<a href="javascript:;" data-toggle="collapse" data-target="#appDown1"^>^<i class="fa fa-fw fa-arrows-v"^>^</i^> Application ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        ^<ul id="appDown1" class="collapse"^>>>source.html
echo.>>source.html
echo				^<li^>>>source.html
echo                        	^<a href="javascript:;" data-toggle="collapse" data-target="#appDown2"^>^<i class="fa fa-fw fa fa-fw"^>^</i^> Internet Explorer ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        	^<ul id="appDown2" class="collapse"^>>>source.html
echo.>>source.html
echo	                   			^<li^>>>source.html
echo			                   		^<a target="myFrame" href="Analyze\Application\Internet Explorer\inetcache.txt" ^> ^<i class="fa fa-fw"^>^</i^>iNetCache^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Application\Internet Explorer\inetcookie.txt"^> ^<i class="fa fa-fw"^>^</i^>iNetCookie^</a^>>>source.html
echo				                ^</li^>>>source.html
echo			                ^</ul^>>>source.html
echo				^</li^>>>source.html
echo				^</li^>>>source.html
echo.>>source.html
echo				^<li^>>>source.html
echo			             ^<a href="javascript:;" data-toggle="collapse" data-target="#appDown3"^>^<i class="fa fa-fw fa fa-fw"^>^</i^> Edge Browser ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        	^<ul id="appDown3" class="collapse"^>>>source.html
echo.>>source.html
echo	                   			^<li^>>>source.html
echo			                   		^<a target="myFrame" href="Analyze\Application\Edge Browser\edgeSetting.txt"^> ^<i class="fa fa-fw"^>^</i^>Edge Setting^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Application\Edge Browser\edgeCache.txt"^> ^<i class="fa fa-fw"^>^</i^>Edge Cache^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Application\Edge Browser\edgeSession.txt"^> ^<i class="fa fa-fw"^>^</i^>Edge Session^</a^>>>source.html
echo				                ^</li^>>>source.html
echo			                ^</ul^>>>source.html
echo				^</li^>>>source.html
echo                    ^<li^>>>source.html
echo                    	^<a target="myFrame" href="Analyze\maps.txt"^>Maps App^</a^>>>source.html
echo                    ^</li^>>>source.html
echo                   ^</li^>>>source.html
echo                   ^</ul^>>>source.html
echo                    ^<li^>>>source.html
echo                ^<a href="javascript:;" data-toggle="collapse" data-target="#memDown"^>^<i class="fa fa-fw fa-arrows-v"^>^</i^> Memory ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        ^<ul id="memDown" class="collapse"^>>>source.html
echo.>>source.html
echo                    ^<li^>>>source.html
echo                    	^<a target="myFrame" href="Analyze\Memory\Prefetch\prefetch.txt"^>Prefetch^</a^>>>source.html
echo                    ^</li^>>>source.html
echo                    ^<li^>>>source.html
echo                    	^<a target="myFrame" href="Analyze\Memory\Prefetch\superfetch.txt"^>Superfetch^</a^>>>source.html
echo                    ^</li^>>>source.html
echo                   ^</ul^>>>source.html
echo                    ^</li^>>>source.html
echo                    ^<li^>>>source.html
echo                ^<a href="javascript:;" data-toggle="collapse" data-target="#wfDown"^>^<i class="fa fa-fw fa-arrows-v"^>^</i^> Windows Files ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        ^<ul id="wfDown" class="collapse"^>>>source.html
echo.>>source.html
echo				^<li^>>>source.html
echo			             ^<a href="javascript:;" data-toggle="collapse" data-target="#wfDown1"^>^<i class="fa fa-fw fa fa-fw"^>^</i^> Shellbag ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        	^<ul id="wfDown1" class="collapse"^>>>source.html
echo.>>source.html
echo	                   			^<li^>>>source.html
echo			                   		^<a target="myFrame" href="Analyze\Windows File\Shell bag\userClass.txt"^> ^<i class="fa fa-fw"^>^</i^>Userclass.dat Location^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Windows File\Shell bag\shellBag.txt"^> ^<i class="fa fa-fw"^>^</i^>Shellbag Registry^</a^>>>source.html
echo				                ^</li^>>>source.html
echo			                ^</ul^>>>source.html
echo				^</li^>>>source.html   
echo				^<li^>>>source.html
echo			             ^<a href="javascript:;" data-toggle="collapse" data-target="#wfDown2"^>^<i class="fa fa-fw fa fa-fw"^>^</i^> Cortana ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        	^<ul id="wfDown2" class="collapse"^>>>source.html
echo.>>source.html
echo	                   			^<li^>>>source.html
echo			                   		^<a target="myFrame" href="Analyze\Windows File\Cortana\coreDB.txt"^> ^<i class="fa fa-fw"^>^</i^>Cortana Core DB^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Windows File\Cortana\indexDB.txt"^> ^<i class="fa fa-fw"^>^</i^>Cortana Index DB^</a^>>>source.html
echo				                ^</li^>>>source.html
echo			                ^</ul^>>>source.html
echo				^</li^>>>source.html
echo				^<li^>>>source.html
echo			             ^<a href="javascript:;" data-toggle="collapse" data-target="#wfDown3"^>^<i class="fa fa-fw fa fa-fw"^>^</i^> Picture Password ^<i class="fa fa-fw fa-caret-down"^>^</i^>^</a^>>>source.html
echo                        	^<ul id="wfDown3" class="collapse"^>>>source.html
echo.>>source.html
echo	                   			^<li^>>>source.html
echo			                   		^<a target="myFrame" href="Analyze\Windows File\Picture Password\picpassReg.txt"^> ^<i class="fa fa-fw"^>^</i^>Picture Passwd Reg Location^</a^>>>source.html
echo				                ^</li^>>>source.html
echo				                ^<li^>>>source.html
echo				                	^<a target="myFrame" href="Analyze\Windows File\Picture Password\picpassImg.txt"^> ^<i class="fa fa-fw"^>^</i^>Picture Passwd Image Location^</a^>>>source.html
echo				                ^</li^>>>source.html
echo			                ^</ul^>>>source.html
echo				^</li^>>>source.html
echo                    ^<li^>>>source.html
echo                    	^<a target="myFrame" href="Analyze\Windows File\Event Logs\eventLogs.txt"^>EventLogs^</a^>>>source.html
echo                    ^</li^>>>source.html
echo                    ^<li^>>>source.html
echo                    	^<a target="myFrame" href="Analyze\Windows File\LNK Files\lnkFiles.txt"^>LNK Files^</a^>>>source.html
echo                    ^</li^>>>source.html
echo                    ^<li^>>>source.html
echo                    	^<a target="myFrame" href="Analyze\Windows File\Thumbcaches\\thumbCaches.txt"^>Thumbcaches^</a^>>>source.html
echo                    ^</li^>>>source.html
echo                    ^<li^>>>source.html
echo                    	^<a target="myFrame" href="Analyze\Windows File\Recycle bin\reCycle.txt"^>Recycle.bin^</a^>>>source.html
echo                    ^</li^>>>source.html
echo                    ^<li^>>>source.html
echo                    	^<a target="myFrame" href="Analyze\Windows File\Windows Indexing Service\WIS.txt"^>Windows Indexing Service^</a^>>>source.html
echo                    ^</li^>>>source.html
echo                    ^<li^>>>source.html
echo                    	^<a target="myFrame" href="Analyze\Windows File\Notification Center\NotiCen.txt"^>Notification Center^</a^>>>source.html
echo                    ^</li^>>>source.html
echo                   ^</ul^>>>source.html
echo                    ^</li^>>>source.html
echo            ^</div^>>>source.html
echo        ^</nav^>>>source.html
echo.>>source.html
echo        ^<div id="page-wrapper"^>>>source.html
echo.>>source.html
echo            ^<div class="container-fluid"^>>>source.html
echo.>>source.html
echo.>>source.html
echo.>>source.html
echo                ^<div class="row"^>>>source.html
echo                    ^<div class="col-lg-40"^>>>source.html
echo                        ^<div class="panel panel-default"^>>>source.html
echo                            ^<div class="panel-heading"^>>>source.html
echo.>>source.html
echo                            ^</div^>>>source.html
echo                            ^<div style=overflow:hidden; class="panel-body" ^>>>source.html
echo.>>source.html
echo.>>source.html
echo								  ^<iframe name="myFrame" src="Analyze\system.txt"  height="829" width="1675"  frameborder="0"^>^</iframe^>>>source.html
echo                            ^</div^>>>source.html
echo                        ^</div^>>>source.html
echo                    ^</div^>>>source.html
echo                ^</div^>>>source.html
echo.>>source.html
echo.>>source.html
echo.>>source.html
echo            ^</div^>>>source.html
echo.>>source.html
echo        ^</div^>>>source.html
echo.>>source.html
echo    ^</div^>>>source.html
echo.>>source.html
echo    ^<script src="../bootstrap/js/jquery.js"^>^</script^>>>source.html
echo.>>source.html
echo    ^<script src="../bootstrap/js/bootstrap.min.js"^>^</script^>>>source.html
echo.>>source.html
echo    ^<script src="../bootstrap/js/plugins/morris/raphael.min.js"^>^</script^>>>source.html
echo    ^<script src="../bootstrap/js/plugins/morris/morris.min.js"^>^</script^>>>source.html
echo    ^<script src="../bootstrap/js/plugins/morris/morris-data.js"^>^</script^>>>source.html
echo.>>source.html
echo ^</body^>>>source.html
echo.>>source.html
echo ^</html^>>>source.html


pause
index.html