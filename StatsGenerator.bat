@echo off
set creator=Fernand
set basecolor=0F
color %basecolor%
if "%start%"=="1" goto generator
set version=2019.02.09.15.12
set serverplc=C:\wamp64\www\aventures
set e2=‚
set e7=Š
set c9=‡
set a0=…
set ac=ƒ
set ec=ˆ
set ic=Œ
set oc=“
set uc=–
set it=‹
set nm=ø
set temp=R
set /a start = 1
if not "%nom%"=="" set /a start2 = 1 & goto reset
set nom=R
:reset
cls
echo StatsGenerator %version%
if "%start2%"=="1" echo Stats de %nom%.
if "%start2%"=="1" if not "%colorval%"=="" color %colorval%
if "%start3%"=="1" set /a vig = 0 & call :save & del "zStats_%nom%".bat & set start2=& set /a start3 = 2 & call "Statsz de %nom%".bat
echo Chargement ...
set /a cdm = 0
if exist StatsGeneratorCondmodif.bat call StatsGeneratorCondmodif.bat
set /a lvl = 0
set /a dlvl = 1
set /a augmdesvie = 0
set /a augmdesmana = 0
set /a augmbonvie = 0
set /a augmbonmana = 0
set /a nsavephy = 0
set /a nsavemag = 0
set /a nsavesor = 0
set /a nsavesoi = 0
set /a gtatt1 = 0
set /a gtatt2 = 0
set /a gtatt3 = 0
set /a gtatt31 = 0
set /a gtatt4 = 0
set /a degsuphy = 0
set /a degsumag = 0
set /a degsupr = 0
set /a nbrdegsu = 0
set /a recup = 0
set /a soinin = 0
set /a deginphy = 0
set /a deginmag = 0
set /a deginsor = 0
set /a gtdeg1 = 0
set /a gtdeg2 = 0
set /a gtdeg3 = 0
set /a manaus = 0
set /a vigus = 0
set /a nbrdeads = 0
set /a don1bon = 0
set /a don3 = 0
set /a don3bon = 0
set /a don4 = 0
set /a don5 = 0
set /a donmana = 0
set /a donvig = 0
set /a don6 = 0
set /a cmpmana = 0
set /a cmpvig = 0
set /a nbrmods = 0
set /a mod = 0
set /a conddead = 0
set /a begin = 1
set /a beenres = 0
set /a condnatar = 0
set /a condar = 0
set /a nbrbars = 0
set /a nbrweps = 0
set /a nbdonwp = 0
set /a mxnbrbars = 9
set /a mxnbrweps = 9
set /a mxnbdonwp = 5
set /a prcboss = 0
set /a vsboss = 1
set /a clone = 0
call :resetfois
set tpfoisatt=1
set tpfoismag=1
set tpfoismana=1
set tpfoisvig=1
set /a fatg = 25
set /a modif = 0
set /a instat = 0
set /a instat2 = 0
set /a bydegs = 0
set /a menu = 0
set /a tempw = 0
set /a tempb0 = 0
set /a tempb = 0
set /a afn = 0
set /a temps = 0
set /a icmp = 3
set /a idon = 4
set /a cmpspe = 0
set /a cmpint = 0
set /a tempt = 0
set /a infm = 0
set /a maj = 0
set /a maj2 = 0
set /a lup = 0
set /a chtst = 1
set /a lssmana = 0
set /a sha = 0
set /a shnb = 0
set /a shn = 0
set /a bontal = 0
set /a prctal = 0
set /a clfc = 0
if "%start2%"=="1" if exist "zStats_%nom%".bat set /a start3 = 1 & set start=& call "zStats_%nom%".bat
if "%start2%"=="1" call "Statsz de %nom%".bat
cls
echo StatsGenerator %version%
echo Retour arri%e7%re: saisir "R"
echo Saisir "ALL" pour afficher la liste de tous les personnages poss%e2%dants des stats.
:debsof
set /a menu = 0
echo Modes de fonctionnement:
echo C-Commencer une partie      M-Modification des stats   W-Web All
echo J-Mettre %a0% jour des stats   F-Remise des jauges principales au maximum
choice /c CMJFW /n /m "Mode :"
set /a cdm = %errorlevel%
set /a cdm -= 1
if %cdm%==0 call :savecondmodif
if %cdm%==1 call :savecondmodif
:debsof2
if %cdm%==2 goto strlist
if %cdm%==3 goto strlist
if %cdm%==4 goto strlist
set nmtp=%nom%
set /p "nmtp=Nom du personnage (%nmtp%):"
if "%nmtp%"=="R" goto debsof
if "%nmtp%"=="ALL" goto echlist
set nom=%nmtp%
set vic=N
if exist StatsGeneratorVIC.bat call StatsGeneratorVIC.bat
if %vic%==O goto debsof2
if not exist "Statsz de %nom%".bat start StatsGenerator.bat & goto debsof2
if exist "Statsz de %nom%".lnk start "" "Statsz de %nom%".lnk & goto debsof2
start "Statz de %nom%" "Statsz de %nom%".bat
goto debsof2
:savecondmodif
if not %USERNAME%==%creator% goto :eof
if not exist StatsGeneratorCondmodif.bat goto :eof
(
 echo set /a cdm = %cdm%
)>StatsGeneratorCondmodif.bat
goto :eof

:echlist
setlocal enabledelayedexpansion
for %%i in ("Statsz de "*.bat) do set p1=%%~ni&echo !p1:~10!
endlocal
set /a cdm = 0
goto debsof2
:strlist
choice /n /m "D%e2%marrer tous les stats ? (O/N) (O):"
if %errorlevel%==2 set /a cdm = 0 & goto debsof
for %%i in ("Statsz de "*.bat) do start "" "%%~ni".bat
if not %cdm%==2 set /a cdm = 0 & goto debsof
set /a start3 = 1
set start=
for %%i in ("zStats_"*.bat) do start "" "%%~ni".bat
set /a start3 = 0
set /a start = 1
set /a cdm = 0
goto debsof

:maj
:: if "%stversion%"=="" set stversion=0.00.000
:: set /a nbstversion = %stversion:~0,1%%stversion:~2,2%%stversion:~5%
if %basevigmod0%==0 set /a maj = 1 & echo Mise %a0% jour de la vigueur. & goto maj1
if not "%don1%"=="" set /a maj = 1 & echo Mise %a0% jour des dons d'arme ... & goto maj2
if not "%don2%"=="" set /a maj = 1 & echo Mise %a0% jour des dons d'arme ... & goto maj2
if %cmpspe%==0 set /a maj = 1 & echo Mise %a0% jour des dons. & goto doncmp
if "%start3%"=="2" set /a maj = 1 & echo Mise %a0% jour des d%e2%g%ac%ts. & goto maj3
set /a maj2 = 1
if %maj%==0 goto generator
if %nbrmods% gtr 0 call :majmod0
call :save
call "Statsz de %nom%".bat
:maj1
set /a vig = 100
:maj1r
set /a cal = 100
set /p "cal=Vigueur (100):"
set /a calr = %cal%
if %calr% lss 1 echo La vigueur doit d%e2%passer 0. & goto maj1r
set /a vig = calr
set /a ct = -1
:maj1b
set /a ct += 1
set /a basevigmod%ct% = vig
if not %ct%==%nbrmods% goto maj1b
goto maj
:maj2
set /a nbdonwp = 1
set donwp1=Arme de base
set /a donwp1pr = don1
set /a donwp1sp = don2
set don1=
set don2=
if "%wep0idon2mod0%"=="" goto maj
set /a ct = -1
:maj2b
set /a ct += 1
set /a wep0idonmod%ct% = wep0idon2mod%ct%
if not %ct%==%nbrmods% goto maj2b
goto maj
:maj3
choice /n /m "Prendre en compte les bonus de niveau pour les attaques physiques ? (O/N) (O):"
set /a temp = %errorlevel%
choice /n /m "Prendre en compte les bonus de niveau pour la magie ? (O/N) (O):"
set /a temp2 = %errorlevel%
set /a ct = -1
:maj3b
set /a ct += 1
if %temp%==1 if %lvl% geq 30 set /a inbonphymod%ct% = 1
if %temp%==1 if %lvl% geq 20 set /a inprcphymod%ct% = 1
if %temp2%==1 if %lvl% geq 30 set /a inbonmagmod%ct% = 1
if %temp2%==1 if %lvl% geq 20 set /a inprcmagmod%ct% = 1
if not %ct%==%nbrmods% goto maj3b
set /a start3 = 3
goto maj



:generator
if %cdm%==2 exit
if %cdm%==4 if not exist "%serverplc%\persos\fonds\%nom%".jpg exit
if not exist "Statsz de %nom%".bat echo StatsGenerator %version% & set /a menu = 1 & goto createchar
color %colorval%
if %maj2%==0 goto maj
set /a maj = 0
if %clone%==1 set affnom=Clone de %affnom%
if %menu%==1 goto setstatsl0
cls
echo StatsGenerator %version%
set /a menu = 1
if %cdm%==3 set /a mod = 0 & set /a vie = baseviemod0*(100+don5)/100 & set /a mana = (basemanamod0+cmpmana)*(100+donmana)/100 & set /a vig = (basevigmod0+cmpvig)*(100+donvig)/100
if %cdm%==3 if %shnb% gtr 0 set /a shn = shnbmod0
if %cdm%==3 call :save & exit
if %cdm%==0 set /a instat = 1
set /a basevieret = baseviemod%mod%*(100+don5)/100
set /a basemanaret = (basemanamod%mod%+cmpmana)*(100+donmana)/100
set /a basevigret = (basevigmod%mod%+cmpvig)*(100+donvig)/100
if %cdm%==1 if %mod% gtr 0 set /a mod = 0 & call :rsattst & goto :eof
if not %cdm%==0 goto setstatsl0
set chma=
set chma2=
set chma3=
set /a chma4 = 0
if %nbrbars% gtr 0 set chma=   J-Jauges secondaires& set chma2=J& set /a chma4 = 1
if exist ".\pageweb\%nom%".html set chma=%chma%   C-Fiche perso& set chma2=%chma2%C& set /a chma4 += 1
if %chma4% gtr 1 set chma3=         
set chmods2=
if %nbrmods%==0 goto setstatsl0
set chmods=
set chmods2=0
set /a ct = 0
:mnmodsb
set /a ct += 1
call :namemodtemp
set chmods=%chmods%   %ct%-%namemod%
set chmods2=%chmods2%%ct%
if not %ct%==%nbrmods% goto mnmodsb
:setstatsl0
set /a l1basevie = baseviemod%mod%*(100+don5)/100
set /a l1basemana = (basemanamod%mod%+cmpmana)*(100+donmana)/100
set /a l1basevig = (basevigmod%mod%+cmpvig)*(100+donvig)/100
if %tempb%==1 set /a l1vie = vie & set /a l1mana = mana & set /a l1vig = vig & goto setstatsl02
if not exist "Statsz de %nom%".bat if %tempb0%==1 set /a l1vie = l1basevie & set /a l1mana = l1basemana & set /a l1vig = l1basevig & goto :eof
set /a l1vie = %vie%*%l1basevie%/%basevieret%
set /a l1mana = %mana%*%l1basemana%/%basemanaret%
set /a l1vig = %vig%*%l1basevig%/%basevigret%
:setstatsl02
if %tempb0%==1 goto :eof
set /a temp = regenviemod%mod%
if %cdm%==0 if %mod% gtr 0 if %temp%==1 if %begin%==0 set /a l1vie = l1basevie
set /a temp = regenmanamod%mod%
if %cdm%==0 if %mod% gtr 0 if %temp%==1 if %begin%==0 set /a l1mana = l1basemana
set /a temp = regenvigmod%mod%
if %cdm%==0 if %mod% gtr 0 if %temp%==1 if %begin%==0 set /a l1vig = l1basevig
if %cdm%==0 if %mod% gtr 0 set /a sha = 0
set /a temp = shadmod%mod%
if %cdm%==0 if %mod% gtr 0 if %temp%==1 if %begin%==0 set /a sha = 1
if %cdm%==0 if %begin%==0 set /a shn = shnb
set /a begin = 0
:setstatsl01
set /a l1natarmurephy = natarmurephy*(100+don6)/100
set /a l1natarmuremag = natarmuremag*(100+don6)/100
set /a l1armurephy = armurephy*(100+don6)/100
set /a l1armuremag = armuremag*(100+don6)/100
:setstatsl1
set /a l2basevie = l1basevie*%foisvie%*%foisst%
set /a l2basemana = l1basemana*%foismana%*%foisst%
set /a l2basevig = l1basevig*%foisvig%*%foisst%
set /a l2vie = l1vie*%foisvie%*%foisst%
set /a l2mana = l1mana*%foismana%*%foisst%
set /a l2vig = l1vig*%foisvig%*%foisst%
set /a l2natarmurephy = l1natarmurephy*%foisnatar%*%foisst%
set /a l2natarmuremag = l1natarmuremag*%foisnatar%*%foisst%
set /a l2armurephy = l1armurephy*%foisar%*%foisst%
set /a l2armuremag = l1armuremag*%foisar%*%foisst%
set /a l2shnb = shnb*%foisst%
set /a l2shn = shn*%foisst%
:bosset
set /a l3basevie = l2basevie+(l2basevie*prcboss/100)*(vsboss-1)
set /a l3basemana = l2basemana+(l2basemana*prcboss/100)*(vsboss-1)
set /a l3basevig = l2basevig+(l2basevig*prcboss/100)*(vsboss-1)
set /a l3vie = l2vie+(l2vie*prcboss/100)*(vsboss-1)
set /a l3mana = l2mana+(l2mana*prcboss/100)*(vsboss-1)
set /a l3vig = l2vig+(l2vig*prcboss/100)*(vsboss-1)
set /a l3natarmurephy = l2natarmurephy+(l2natarmurephy*prcboss/100)*(vsboss-1)
set /a l3natarmuremag = l2natarmuremag+(l2natarmuremag*prcboss/100)*(vsboss-1)
set /a l3armurephy = l2armurephy+(l2armurephy*prcboss/100)*(vsboss-1)
set /a l3armuremag = l2armuremag+(l2armuremag*prcboss/100)*(vsboss-1)
set /a l3shnb = l2shnb+(l2shnb*prcboss/100)*(vsboss-1)
set /a l3shn = l2shn+(l2shn*prcboss/100)*(vsboss-1)
set /a nb = 0
set /a magatt = 0
set /a afn = 1
call :affminmax
if %instat%==1 if %instat2%==1 goto :fin2
set /a instat2 = 1

:vis
if %cdm%==4 goto createwebpage
echo(
echo(
echo(
echo %affnom%
echo Niveau: %lvl%
echo Physique:%phystat% Social:%socstat% Mental:%menstat%
set /a prcvie = l3vie*100/l3basevie
if %foisvie%==1 echo Sant%e2%: %l3vie% /%l3basevie%  %prcvie%%%
if not %foisvie%==1 echo Sant%e2%: %l3vie% /%l3basevie% (x%foisvie%)  %prcvie%%%
set /a prc = l3mana*100/l3basemana
if %foismana%==1 echo Mana: %l3mana% /%l3basemana%  %prc%%%
if not %foismana%==1 echo Mana: %l3mana% /%l3basemana% (x%foismana%)  %prc%%%
set /a prc = l3vig*100/l3basevig
if %foisvig%==1 echo Vigueur: %l3vig% /%l3basevig%  %prc%%%
if not %foisvig%==1 echo Vigueur: %l3vig% /%l3basevig% (x%foisvig%)  %prc%%%
if %foisnatar%==1 if %foisar%==1 echo Armure naturelle: (%l3natarmurephy%/%l3natarmuremag%) ; mat%e2%rielle: (%l3armurephy%/%l3armuremag%)
if %foisnatar%==1 if not %foisar%==1 echo Armure naturelle: (%l3natarmurephy%/%l3natarmuremag%) ; mat%e2%rielle: (%l3armurephy%/%l3armuremag%) (x%foisar%)
if not %foisnatar%==1 if %foisar%==1 echo Armure naturelle: (%l3natarmurephy%/%l3natarmuremag%) (x%foisnatar%) ; mat%e2%rielle: (%l3armurephy%/%l3armuremag%)
if not %foisnatar%==1 if not %foisar%==1 echo Armure naturelle: (%l3natarmurephy%/%l3natarmuremag%) (x%foisnatar%) ; mat%e2%rielle: (%l3armurephy%/%l3armuremag%) (x%foisar%)
if %foisatt%==1 echo D%e2%g%ac%ts physiques: %wep0bas%+%wep0bon%
if not %foisatt%==1 echo D%e2%g%ac%ts physiques: %wep0bas%+%wep0bon% (x%foisatt%)
echo Apog%e2%e: %min% ; %moy% ; %max%
if "%wep0att%"=="1" echo D%e2%g%ac%ts %a0% attribut magique.
if not %foismag%==1 echo Multiplication des effets magiques par %foismag%.
if %shnb%==0 if %shn% gtr 0 if %sha%==0 echo Protection: %shn%  (inactive)
if %shnb%==0 if %shn% gtr 0 if %sha%==1 echo Protection: %shn%  (active)
if %shnb% gtr 0 set /a prc = l3shn*100/l3shnb
if %shnb% gtr 0 if %sha%==0 if %foisatt%==1 echo Protection: %l3shn% /%l3shnb%  %prc%%%  (inactive)
if %shnb% gtr 0 if %sha%==0 if not %foisatt%==1 echo Protection: %l3shn% /%l3shnb%  %prc%%%  (inactive)
if %shnb% gtr 0 if %sha%==1 if %foisatt%==1 echo Protection: %l3shn% /%l3shnb%  %prc%%%  (active)
if %shnb% gtr 0 if %sha%==1 if not %foisatt%==1 echo Protection: %l3shn% /%l3shnb%  %prc%%%  (active)
set /a vsboss1 = vsboss -1
if %vsboss% gtr 1 echo Nombre de personnes contre le boss: %vsboss% (+%vsboss1%x%prcboss%%%)
if %instat%==0 call :info
if %tempb%==1 set /a tempb = 0 & goto endmodif_2
if %cdm%==1 goto createchar
if not "%foisst%"=="1" echo Multiplication des stats par %foisst%.
if %instat%==1 if %nbrbars% gtr 0 if %nbrbars% lss 4 call :affbars
if not "%tpfoisatt%"=="1" echo Multiplication temporaire des d%e2%g%ac%ts par %tpfoisatt%.
if not "%tpfoismag%"=="1" echo Multiplication temporaire de la magie par %tpfoismag%.
if not "%tpfoismana%"=="1" echo Multiplication temporaire de l'utilisation de la mana par %tpfoismana%.
if not "%tpfoisvig%"=="1" echo Multiplication temporaire de l'utilisation de la vigueur par %tpfoisvig%.
echo(

if %nbrmods% gtr 0 if %beenres%==0 if %l3vie%==0 if %bydegs%==1 goto resbymodbf0
goto act
:resbymodbf0
set /a ct = 0
set /a ct2 = 0
set temp1=d'un des mods
:resbymodbf0b
set /a ct += 1
set /a temp = nodeadmod%ct%
if %temp%==1 set /a temp3 = ct & set /a ct2 += 1
if not %ct%==%nbrmods% goto resbymodbf0b
if %ct2%==0 goto act
if %ct2% gtr 1 goto resbymod0
set /a ct = temp3
call :namemodtemp
set temp1=du mod %namemod%
:resbymod0
choice /c ONR /n /m "Autoriser la reprise de conscience par l'activation %temp1% ? (O/N):"
if %errorlevel%==2 goto act
if %errorlevel%==3 goto resbfor
set chm=
set chm2=
set /a ct = 0
set /a ct2 = 0
:resbymodb
set /a ct += 1
set /a temp2 = nodeadmod%ct%
if %temp2%==0 goto resbymodb2
set /a temp3 = ct
set /a ct2 += 1
set /a temp0%ct2% = ct
call :namemodtemp
set chm2=%chm2%%ct%(%namemod%)
set chm=%chm%%ct%
:resbymodb2
if not %ct%==%nbrmods% set chm2=%chm2%/& goto resbymodb
if %ct2%==1 set /a mod = temp3 & goto resbymodend
:resbymod2
choice /c R%chm% /n /m "N%nm% du mod (%chm2%):"
if %errorlevel%==1 goto vis
set /a temp = %errorlevel%
set /a temp -= 1
set /a mod = temp0%temp%
:resbymodend
set /a beenres = 1
set /a l3vie = 1
goto :eof

:act
echo(
set /a jet = 0
set /a bydegs = 0
:choiceb
echo Actions disponibles:
echo A-Attaque            D-D%e2%g%ac%ts subis   S-Soin           T-Test        %chma3%F-Full/G-Reset
echo V-Vie/Mana/Vigueur   P-Pourcentages   B-Protection     L-Recharger   %chma3%M-Modification temporaire
echo N-Clone              O-Boss           I-Informations%chma%
if %nbrmods% gtr 0 echo Activation de mods: & echo 0-Stats de base%chmods%
:choice2
choice /c RILDAVSBFTPOMNG%chma2%%chmods2% /n /m "Action:"
set /a temp = %errorlevel%
if %errorlevel%==1 goto resbfor
if %errorlevel%==2 call :info & goto choiceb
if %nbrbars%==0 if exist ".\pageweb\%nom%".html if %errorlevel%==16 start "GoogleChrome" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" ".\pageweb\%nom%".html & goto choice2
if %nbrbars% gtr 0 if exist ".\pageweb\%nom%".html if %errorlevel%==17 start "GoogleChrome" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" ".\pageweb\%nom%".html & goto choice2
if %errorlevel%==3 start /i "Statz de %nom%" "Statsz de %nom%".bat & exit
set /a vieret = l3vie
set /a manaret = l3mana
set /a vigret = l3vig
if %errorlevel%==4 echo D%e2%g%ac%ts inflig%e2%s %a0% %affnom%: & goto deg
if %errorlevel%==5 echo Attaque de %affnom%: & goto att
if %errorlevel%==6 goto mana
if %errorlevel%==7 echo R%e2%alisation de soin: & goto lifehad
if %errorlevel%==8 echo Param%e2%trage de la protection: & goto shieldset
if %errorlevel%==9 goto full
if %errorlevel%==10 echo Enregistrement d'un test. & goto test
if %errorlevel%==11 echo Modification par pourcentage: & goto prcset
if %errorlevel%==12 echo Modification des stats en tant que boss: & goto multiforboss
if %errorlevel%==13 echo Modification temporaire des stats: & goto inmdtemp
if %errorlevel%==14 set /a clone = 1 & set /a menu = 0 & echo Clone de %affnom% cr%e2%%e2%. & start "" "Statsz de %nom%".bat & set /a menu = 1 & set /a clone = 0 & goto choiceb
if %errorlevel%==15 goto rsjg100
if %nbrbars% gtr 0 if %errorlevel%==16 echo Ajustement d'une jauge secondaire: & goto barr
set /a basevieret = l3basevie
set /a basemanaret = l3basemana
set /a basevigret = l3basevig
set /a temp -= chma4
set /a mod = temp -16
call :resetfois
goto :eof

:deg
if %l3vie% leq 0 echo Le personnage est d%e2%j%a0% inconscient. & goto choice2
choice /c 123R /n /m "Type de d%e2%g%ac%ts (1-Physiques / 2-Magiques / 3-Purs):"
if %errorlevel%==1 set /a magdeg = 0
if %errorlevel%==2 set /a magdeg = 1
if %errorlevel%==3 set /a magdeg = 2 & goto degb3
if %errorlevel%==4 goto fin
:degar
choice /c 123R /n /m "Type de protection (1-Armure naturelle et mat%e2%rielle / 2-Armure naturelle / 3-Armure mat%e2%rielle):"
if %errorlevel%==1 set /a condnatar = 1 & set /a condar = 1
if %errorlevel%==2 set /a condnatar = 1 & set /a condar = 0
if %errorlevel%==3 set /a condnatar = 0 & set /a condar = 1
if %errorlevel%==4 goto deg
:degb2
set /a cal = 1
set /p "cal=Nombre d'attaques subies (1):"
if "%cal%"=="R" goto degar
set /a calr = %cal%
if %calr% lss 1 echo Le nombre d'attaques subies doit d%e2%passer 0. & goto degb2
:degb3
set /a cal = 0
set /p "cal=Points de d%e2%g%ac%ts:"
if "%cal%"=="A" goto fin
if "%cal%"=="R" goto degb2
set /a tempdeg = %cal%
if %tempdeg% lss 0 echo Les points de d%e2%g%ac%ts ne peuvent %ec%tre n%e2%gatifs. & goto degb3
set /a deg = %cal%
set /a deg2 = %cal%
set /a ct = 0
:degb
set /a ct += 1
if %sha%==0 goto degb4
if %shnb%==0 set /a l3shn = shn
if %l3shn%==0 goto degb4
if %l3shn% gtr 0 set /a l3shn -= deg
if %l3shn% gtr 0 set /a deg = 0 & echo Points de protection: %l3shn% & goto degb4
set /a deg = -l3shn & set /a l3shn = 0 & echo Protection bris%e2%e.
:degb4
if %condnatar%==1 if %magdeg%==0 set /a nb = l3natarmurephy
if %condnatar%==1 if %magdeg%==1 set /a nb = l3natarmuremag
if %magdeg% lss 2 if %condnatar%==1 set /a deg -= nb*(%random%%%100+51+lvl)/100
if %condar%==1 if %magdeg%==0 set /a deg -= l3armurephy
if %condar%==1 if %magdeg%==1 set /a deg -= l3armuremag
if %magdeg% lss 2 if not %ct%==%calr% goto degb
if %shnb%==0 set /a shn = l3shn
if %deg% gtr 0 if not "%tempdeg%"=="%deg%" echo D%e2%g%ac%ts subis: %deg%
if %deg% lss 1 set /a deg = 0 & echo Aucun d%e2%g%ac%t subi.
if %magdeg%==0 if %deg% gtr %gtdeg1% set /a gtdeg1 = deg
if %magdeg%==1 if %deg% gtr %gtdeg2% set /a gtdeg2 = deg
if %magdeg%==2 if %deg% gtr %gtdeg3% set /a gtdeg3 = deg
set /a l3vie -= deg
if %magdeg%==0 set /a degsuphy += deg
if %magdeg%==1 set /a degsumag += deg
if %magdeg%==2 set /a degsupr += deg
if %l3vie% lss 0 set /a l3vie = 0
set /a nbrdegsu += 1
set /a bydegs = 1
goto fin

:att
choice /c ASTR /n /m "Type d'attaque (A-Arme / S-Sort / T-Temporaire):"
set /a magatt = 0
set /a nb = 0
if %errorlevel%==2 if exist ".\pageweb\%nom%".html echo Saisir "C" pour voir la fiche du personnage.
if %errorlevel%==2 goto attmana
if %errorlevel%==3 set /a tempt = 1 & goto attvig
if %errorlevel%==4 goto fin
if %nbrweps%==0 goto attvig
echo (0) Arme de base: %wep0bas%+%wep0bon%
set chm=
set /a ct = 0
:attwepb
set /a ct += 1
set chm=%chm%%ct%
call :wepstemp
echo (%ct%) %wep%: %temp1%+%temp2%
if not %ct%==%nbrweps% goto attwepb
choice /c R0%chm% /n /m "N%nm% de l'arme %a0% utiliser:"
if %errorlevel%==1 goto att
set /a nb = %errorlevel%
set /a nb -= 2
set /a ct = nb
call :wepstemp
if %nb% gtr 0 echo Utilisation de l'arme secondaire %wep%.
:attvig
set /a cal = 0
set /p "cal=Vigueur utilis%e2%e pour l'attaque (0):"
if "%cal%"=="R" goto att
set /a calr = %cal%
if %calr% lss 0 echo L'utilisation de la vigueur ne peut %ec%tre n%e2%gative. & goto attvig
set /a temp5 = l3vig-calr
if %temp5% lss 0 echo La vigueur (%l3vig%) n'est pas suffisante pour cette utilisation. & goto attvig
set /a lssvig = calr
goto attjet
:attmana
set /a magatt = 1
set /a cal = 0
if %temps%==0 set /p "cal=Co%uc%t normal du sort (I):"
if %temps%==1 set /p "cal=Co%uc%t normal du soin (I):"
if %temps%==1 if "%cal%"=="R" goto fin
if "%cal%"=="R" goto att
if exist ".\pageweb\%nom%".html if "%cal%"=="C" start "GoogleChrome" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" ".\pageweb\%nom%".html & goto attmana
set /a calr = %cal%
if %calr%==0 set /a lssmana = 0 & echo Utilisation de la mana ignor%e2%e. & goto attjet
if %calr% lss 1 echo L'utilisation de la mana ne peut %ec%tre n%e2%gative. & goto attmana
set /a cout = calr
set /a temp3 = calr
:attmana2
set /a cal = cout
if %temps%==0 set /p "cal=Mana utilis%e2%e pour le sort (%cal%):"
if %temps%==1 set /p "cal=Mana utilis%e2%e pour le soin (%cal%):"
if "%cal%"=="R" goto attmana
if exist ".\pageweb\%nom%".html if "%cal%"=="C" start "GoogleChrome" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" ".\pageweb\%nom%".html & goto attmana2
set /a calr = %cal%
if %calr% lss 1 echo L'utilisation de la mana ne peut %ec%tre n%e2%gative ou nulle. & goto attmana2
set /a temp5 = l3mana-calr
if %temp5% lss 0 echo La mana (%l3mana%) n'est pas suffisante pour cette utilisation. & goto attmana2
set /a lssmana = calr
:attjet
echo Saisir "P" pour ignorer le test.
set cal=P
if %magatt%==0 set /p "cal=R%e2%sultat du jet de physique (%cal%):"
if %magatt%==1 set /p "cal=R%e2%sultat du jet de mental (%cal%):"
if %magatt%==0 if "%cal%"=="R" goto attvig
if %magatt%==1 if "%cal%"=="R" goto attmana
if "%cal%"=="P" set /a jet = 100 & goto attpass
set /a jet = %cal%
if %jet% gtr 95 if %magatt%==0 set /a crtech1 += 1
if %jet% gtr 95 if %magatt%==1 if %temps%==0 set /a crtech2 += 1
if %jet% gtr 95 if %temps%==1 set /a crtech3 += 1
if %jet% gtr 95 echo Echec critique. & timeout /t 01>nul & goto fin
if %jet% lss 6 if %magatt%==0 set /a crtreu1 += 1
if %jet% lss 6 if %magatt%==1 if %temps%==0 set /a crtreu2 += 1
if %jet% lss 6 if %temps%==1 set /a crtreu3 += 1
if %jet% lss 6 echo R%e2%ussite critique.
if %jet% lss 2 set /a jet = 1 & echo Les points seront multipli%e2%s par 2.
if %jet%==2 echo Les points seront multipli%e2%s par 1,8.
if %jet%==3 echo Les points seront multipli%e2%s par 1,6.
if %jet%==4 echo Les points seront multipli%e2%s par 1,4.
if %jet%==5 echo Les points seront multipli%e2%s par 1,2.
if %jet% lss 6 if %magatt%==0 if %tempt%==0 goto attnb
if %jet% lss 6 goto attmagbas
set /a cal = 0
if %magatt%==0 set /p "cal=Bonus/malus du jet de physique (0):"
if %magatt%==1 set /p "cal=Bonus/malus du jet de mental (0):"
set /a bonjet = %cal%
if %magatt%==0 set /a temp1 = wep%nb%idon
if %magatt%==0 set /a temp = phystat+donwp%temp1%pr+don1bon+bonjet
if %magatt%==1 set /a temp = menstat+don3+don3bon+bonjet
if %jet% gtr %temp% if %magatt%==0 set /a l3vig -= lssvig*%tpfoisvig% & set /a vigus += lssvig*%tpfoisvig%
if %jet% gtr %temp% if %magatt%==1 set /a l3mana -= lssmana*%tpfoismana% & set /a manaus += lssmana*%tpfoismana%
if %jet% gtr %temp% if %magatt%==0 set /a ech1 += 1
if %jet% gtr %temp% if %magatt%==1 if %temps%==0 set /a ech2 += 1
if %jet% gtr %temp% if %temps%==1 set /a ech3 += 1
if %jet% gtr %temp% echo Echec. & timeout /t 01>nul & goto fin
if %jet% leq %temp% if %magatt%==0 set /a reu1 += 1
if %jet% leq %temp% if %magatt%==1 if %temps%==0 set /a reu2 += 1
if %jet% leq %temp% if %temps%==1 set /a reu3 += 1
if %jet% leq %temp% echo R%e2%ussite.
:attpass
if %tempt%==1 goto attmagbas
if %magatt%==0 goto attnb
:attmagbas
if "%tempaff%"=="1" if %ct% gtr 1 goto attdegs
set /a cal = 0
if %temps%==0 set /p "cal=Base de d%e2%g%ac%ts (0):"
if %temps%==1 set /p "cal=Base de soin (0):"
if "%tempaff%"=="1" if "%cal%"=="R" goto ret20end
if "%cal%"=="R" goto attjet
set /a calr = %cal%
if %calr% lss 0 echo La base doit d%e2%passer 0. & goto attmagbas
set /a bas = calr
:attmagbon
set /a cal = 0
if %temps%==0 set /p "cal=Am%e2%lioration de d%e2%g%ac%ts (0):"
if %temps%==1 set /p "cal=Am%e2%lioration de soin (0):"
if "%cal%"=="R" goto attmagbas
set /a calr = %cal%
if %calr% lss 0 echo L'am%e2%lioration doit d%e2%passer 0. & goto attmagbon
set /a bon = calr
if "%tempaff%"=="1" goto attdegs
if %tempt%==0 goto attnb
set /a tpdon = 0
set /a temp4 = 0
if %nbdonwp%==0 goto attnb
set chm=
set chm2=
set /a ct = 0
:attdegstb
set /a ct += 1
call :donwptemp
set chm=%chm%%ct%
set chm2=%chm2%/%ct%(%donwp%)
if not %ct%==%nbdonwp% goto attdegstb
choice /c R0%chm% /n /m "Type d'arme (0(Aucun)%chm2%):"
if %errorlevel%==1 goto attmagbon
set /a temp = %errorlevel%
set /a temp -= 2
set /a temp4 = donwp%temp%sp
:attnb
set /a cal = 1
set /p "cal=Nombre d'attaques effectu%e2%es (1):"
if "%cal%"=="R" goto att
set /a calr = %cal%
if %calr% lss 1 echo Le nombre d'attaques doit d%e2%passer 0. & goto 
set /a nb2 = calr
if %magatt%==0 set /a cal = lssvig*nb2
if %magatt%==1 set /a cal = lssmana*nb2
if %magatt%==0 if %cal% gtr %l3vig% echo /!\ La vigeur ne sera pas suffisante pour toutes les attaques.
if %magatt%==1 if %cal% gtr %l3mana% echo /!\ La mana ne sera pas suffisante pour toutes les attaques.
set /a ct = 0
:attbc
set /a ct += 1
:attd100
if %jet% lss 6 set /a att = 100 & goto attdegs
set /a cal = %random%%%100+1
if %temps%==0 set /p "cal=R%e2%sultat du jet d'attaque N%nm%%ct% (%cal%):"
if %temps%==1 set /p "cal=R%e2%sultat du jet de soin N%nm%%ct% (%cal%):"
if "%cal%"=="R" goto attjet
set /a calr = %cal%
if %calr% lss 1 echo Le jet doit d%e2%passer 0. & goto attd100
set /a att = calr
:attdegs
set /a temp1 = wep%nb%idon
set /a tpdon = donwp%temp1%sp
if %tempt%==1 set /a tpdon = temp4
if %magatt%==1 set /a tpdon = don4
if %magatt%==0 if %tempt%==0 set /a bas = wep%nb%bas & set /a bon = wep%nb%bon
if %magatt%==0 set /a bontal2 = wep%nb%bontal
if %magatt%==0 if %lvl% gtr 29 set /a bontal = (lvl-20)*10*inbonphy
if %magatt%==0 if %lvl% gtr 19 set /a prctal = (lvl-10)*inprcphy
if %magatt%==1 set /a bontal2 = magbontal
if %magatt%==1 if %lvl% gtr 29 set /a bontal = (lvl-20)*10*inbonmag
if %magatt%==1 if %lvl% gtr 19 set /a prctal = (lvl-10)*inprcmag
if %tempt%==1 set /a bontal2 = 0
rem @echo on
set /a nbdeg = (%bon%*(%att%+%lvl%)/100)*(%prctal%+%tpdon%+100)/100
if %prcvie% lss %fatg% set /a nbdeg = %nbdeg%*%prcvie%/%fatg%
set /a nbdeg += %bas%+%bontal%+%bontal2%
rem @echo off
if %magatt%==0 set /a nbdeg = nbdeg*%foisatt%*%tpfoisatt%*%foisst%
if %magatt%==1 set /a nbdeg = nbdeg*%foismag%*%tpfoismag%*%foisst%
if "%tempaff%"=="1" goto :eof
if %magatt%==0 if %l3vig% lss %lssvig% set /a lssvig = l3vig
if %magatt%==1 if %l3mana% lss %lssmana% set /a lssmana = l3mana
if %magatt%==0 set /a nbdeg = %nbdeg%*(%lssvig%+75)/100
if %magatt%==1 if %lssmana% gtr 0 set /a nbdeg = %nbdeg%*%lssmana%/%temp3%
if %jet% lss 6 set /a nbdeg = nbdeg*(11-jet)/5
set cal=
set /p "cal=Calcul: %nbdeg%"
if "%cal%"=="R" goto attd100
if "%cal%"=="A" goto fin
set /a nbdeg = nbdeg%cal%
if %temps%==1 if %nbdeg% gtr %gtatt31% set /a gtatt31 = nbdeg
if %temps%==1 goto :eof
if %nb2%==1 echo(
echo D%e2%g%ac%ts inflig%e2%s: %nbdeg%
set /a degttx += nbdeg
echo(
if %magatt%==1 set /a l3mana -= lssmana*%tpfoismana% & set /a manaus += lssmana*%tpfoismana%
if %magatt%==0 set /a l3vig -= lssvig*%tpfoisvig% & set /a vigus += lssvig*%tpfoisvig%
if %magatt%==0 set /a temp = wep%nb%att
if %magatt%==0 if %temp%==0 set /a nsavephy += 1
if %magatt%==0 if %temp%==1 set /a nsavemag += 1
if %magatt%==1 set /a nsavesor += 1
if %magatt%==0 if %temp%==0 set /a deginphy += nbdeg
if %magatt%==0 if %temp%==1 set /a deginmag += nbdeg
if %magatt%==1 set /a deginsor += nbdeg
if %magatt%==0 if %temp%==0 if %nbdeg% gtr %gtatt1% set /a gtatt1 = nbdeg
if %magatt%==0 if %temp%==1 if %nbdeg% gtr %gtatt2% set /a gtatt2 = nbdeg
if %magatt%==1 if %nbdeg% gtr %gtatt3% set /a gtatt3 = nbdeg
if not %ct%==%nb2% goto attbc
set /a tempt = 0
if %nb2% gtr 1 echo D%e2%g%ac%ts totaux: %degttx%
set /a degttx = 0
timeout /t 03>nul
goto fin

:mana
echo Changement des jauges principales par calcul(s).
set /a temp = l3mana
set /a temp1 = l3vig
:mana1
set cal=
set /p "cal=Calcul de la vie: %l3vie%"
if "%cal%"=="R" goto fin
set /a l3vie = l3vie%cal%
if %l3vie% lss 0 set /a l3vie = 0
echo Vie: %l3vie%
:mana2
set cal=
set /p "cal=Calcul de la mana: %l3mana%"
if "%cal%"=="R" goto mana1
set /a l3mana = l3mana%cal%
if %l3mana% lss 0 set /a l3mana = 0
echo Mana: %l3mana%
set cal=
set /p "cal=Calcul de la vigueur: %l3vig%"
if "%cal%"=="R" goto mana2
set /a l3vig = l3vig%cal%
if %l3vig% lss 0 set /a l3vig = 0
echo Vigueur: %l3vig%
if %temp% gtr %l3mana% set /a manaus += temp-l3mana
if %temp1% gtr %l3vig% set /a vigus += temp1-l3vig
goto fin

:lifehad
set /a temps = 1
call :attmana
set /a temps = 0
set /a nsavesoi += 1
set /a soinin += nbdeg
echo Soins %e2%mis: %nbdeg%
set /a temp = l3vie
choice /c ONR /n /m "Utiliser ce soin pour se r%e2%g%e2%n%e2%rer (O/N) (O):"
if %errorlevel%==1 set /a l3vie += nbdeg
if %temp% lss %l3basevie% if %l3vie% gtr %l3basevie% set /a l3vie = l3basevie
if %errorlevel%==1 set /a recup += l3vie-temp
goto fin

:test
choice /c PMSAR /n /m "Type de test (P-Physique / S-Social / M-Mental / A-Autre):"
if %errorlevel%==5 goto fin
set /a temp = %errorlevel%
set /a temp += 3
choice /c 1234R  /n /m "Issue du test (1-R%e2%ussite critique / 2-R%e2%ussite / 3-Echec / 4-Echec critique):"
if %errorlevel%==5 goto test
set /a temp2 = %errorlevel%
if %temp2%==1 set /a crtreu%temp% += 1
if %temp2%==2 set /a reu%temp% += 1
if %temp2%==3 set /a ech%temp% += 1
if %temp2%==4 set /a crtech%temp% += 1
goto fin

:shieldset
if %sha%==0 set rep=I
if %sha%==1 set rep=A
choice /c AIR /n /m "Etat de la protection (A-Active / I-Inactive) (%rep%):"
if %errorlevel%==1 set /a sha = 1
if %errorlevel%==2 set /a sha = 0
if %errorlevel%==3 goto fin
set /a cal = l3shnb
if %shnb%==0 set /a cal = shn
set /p "cal=Points de protection (%cal%):"
if "%cal%"=="R" goto fin
set /a calr = %cal%
if %calr% lss 0 echo Les point de protection ne peuvent %ec%tre n%e2%gatifs. & goto shieldset
if not "%calr%"=="%cal%" echo Points de protection:%calr%
set /a l3shn = calr
if %shnb%==0 set /a shn = calr
goto fin

:prcset
set /a cal = 0
set /p "cal=Ajout en pourcentage de vie (0):"
if "%cal%"=="R" goto fin
set /a calr = %cal%
set /a l3vie += calr*l3basevie/100
:prcset2
set /a cal = 0
set /p "cal=Ajout en pourcentage de mana (0):"
if "%cal%"=="R" goto prcset
set /a calr = %cal%
set /a l3mana += calr*l3basemana/100
set /a cal = 0
set /p "cal=Ajout en pourcentage de vigueur (0):"
if "%cal%"=="R" goto prcset2
set /a calr = %cal%
set /a l3vig += calr*l3basevig/100
goto fin

:multiforboss
set /a cal = vsboss
set /p "cal=Nombre de personnes contre le boss (%vsboss%):"
if "%cal%"=="R" goto fin
set /a calr = %cal%
if %calr% lss 1 echo Le nombre de personnes contre le boss doit d%e2%passer 0. & goto multiforboss
set /a vsboss = calr
:multiforboss2
set /a cal = prcboss
set /p "cal=Pourcentage (%prcboss%):"
if "%cal%"=="R" goto multiforboss
set /a calr = %cal%
if %calr% lss 0 echo Le pourcentage doit d%e2%passer -1. & goto multiforboss2
set /a prcboss = calr
goto bosset

:inmdtemp
choice /c VMADR /n /m "Modification (V-Vie/Mana/Vigueur / M-Multiplications / A-Armures / D-D%e2%g%ac%ts):"
if %errorlevel%==1 goto jst
if %errorlevel%==3 goto ret10
if %errorlevel%==4 goto ret15
if %errorlevel%==5 goto fin
echo Multiplication temporaire des stats.
echo Si il s'agit d'un nombre %a0% d%e2%cimale, entrer le nombre sous forme de fraction avec un "/".
:tmpmulti
set cal=%tpfoisatt%
set /p "cal=Multiplication des d%e2%g%ac%ts (%cal%):"
if "%cal%"=="R" goto fin
set /a calr = %cal%
if %calr% lss 1 echo La multplication de d%e2%s doit d%e2%passer 0. & goto tmpmulti
set tpfoisatt=%cal%
:tmpmulti2
set cal=%tpfoismag%
set /p "cal=Multiplication de la magie (%cal%):"
if "%cal%"=="R" goto tmpmulti
set /a calr = %cal%
if %calr% lss 1 echo La multplication des d%e2%g%ac%ts des sorts doit d%e2%passer 0. & goto tmpmulti2
set tpfoismag=%cal%
:tmpmulti3
set cal=%tpfoismana%
set /p "cal=Multiplication de l'utilisation de la mana (%cal%):"
if "%cal%"=="R" goto tmpmulti2
set /a calr = %cal%
if %calr% lss 1 echo La multplication doit d%e2%passer 0. & goto tmpmulti3
set tpfoismana=%cal%
:tmpmulti4
set cal=%tpfoisvig%
set /p "cal=Multiplication de l'utilisation de la vigueur (%cal%):"
if "%cal%"=="R" goto tmpmulti3
set /a calr = %cal%
if %calr% lss 1 echo La multplication doit d%e2%passer 0. & goto tmpmulti4
set tpfoisvig=%cal%
goto fin
:jst
echo Changement des jauges:
echo Les bonus seront ensuite appliqu%e2%s aux jauges saisies.
:jst_bv
set /a cal = l1basevie
set /p "cal=Sant%e2% maximale (%l1basevie%):"
if "%cal%"=="R" goto fin
set /a calr = %cal%
if %calr% lss 1 echo La jauge doit d%e2%passer 0. & goto jst_bv
if not "%calr%"=="%cal%" echo Sant%e2% maximale: %calr%
set /a l1basevie = calr
:jst_v
set /a cal = l1vie
set /p "cal=Sant%e2% (%l1vie%):"
if "%cal%"=="R" goto jst_bv
set /a calr = %cal%
if %calr% lss 0 echo Les points ne peuvent %ec%tre n%e2%gatifs. & goto jst_v
if not "%calr%"=="%cal%" echo Sant%e2%: %calr%
set /a l1vie = calr
:jst_bm
set /a cal = l1basemana
set /p "cal=Mana maximale (%l1basemana%):"
if "%cal%"=="R" goto jst_v
set /a calr = %cal%
if %calr% lss 1 echo La jauge doit d%e2%passer 0. & goto jst_bm
if not "%calr%"=="%cal%" echo Mana maximale: %calr%
set /a l1basemana = calr
:jst_m
set /a cal = l1mana
set /p "cal=Mana (%l1mana%):"
if "%cal%"=="R" goto jst_bm
set /a calr = %cal%
if %calr% lss 0 echo Les points ne peuvent %ec%tre n%e2%gatifs. & goto jst_m
if not "%calr%"=="%cal%" echo Mana: %calr%
set /a l1mana = calr
:jstbg
set /a cal = l1basevig
set /p "cal=Vigueur maximale (%l1basevig%):"
if "%cal%"=="R" goto jst_m
set /a calr = %cal%
if %calr% lss 1 echo La jauge doit d%e2%passer 0. & goto jstbg
if not "%calr%"=="%cal%" echo Vigueur maximale: %calr%
set /a l1basevig = calr
set /a cal = l1vig
set /p "cal=Vigueur (%l1vig%):"
if "%cal%"=="R" goto jstbg
set /a calr = %cal%
if %calr% lss 0 echo Les points ne peuvent %ec%tre n%e2%gatifs. & goto jstbg
if not "%calr%"=="%cal%" echo Vigueur: %calr%
set /a l1vig = calr
goto setstatsl1

:info
echo(
echo(
echo Autres informations:
if %augmdesvie% gtr 0 echo Augmentation de la sant%e2%: 1d%augmdesvie%+%augmbonvie% & echo Augmentation de la mana: 1d%augmdesmana%+%augmbonmana%
echo(
if %cmpspe%==1 echo Type de sp%e2%cialisation: Mana
if %cmpspe%==2 echo Type de sp%e2%cialisation: Vigueur
if %cmpint% gtr 0 echo Intensit%e2% de la sp%e2%cialisation: %cmpint%
if %cmpmana% gtr 0 echo Bonus de mana principal: %cmpmana%
if %cmpvig% gtr 0 echo Bonus de vigueur principal: %cmpvig%
if %nbdonwp% gtr 0 call :affdonwp
if %don3% gtr 0 echo Affinit%e2% magique +%don3%%%
if %don4% gtr 0 echo Magie de guerre +%don4%%%
if %don5% gtr 0 echo Robustesse +%don5%%%
if %don6% gtr 0 echo R%e2%sistance +%don6%%%
set /a temp = donmana
if %donmana% gtr 0 echo Mise en point de mana +%temp%%%
set /a temp = donvig
if %donvig% gtr 0 echo Mise en point de vigueur +%temp%%%
echo(
echo Stats secondaires du mod de base.
set /a cal = wep0idon
if %cal% gtr 0 echo Prise en compte de la sp%e2%cialisation martialle N%nm%%wep0idon%.
set /a cal = inbonphy
if %cal%==1 echo Prise en compte du bonus de base en attaque physique activ%e2%e.
set /a cal = wep0bontal
if %cal% gtr 0 echo Bonus secondaire de base en attaque physique: %wep0bontal%
set /a cal = inprcphy
if %cal%==1 echo Prise en compte du bonus de pourcentage en attaque physique activ%e2%e.
set /a cal = inbonmag
if %cal%==1 echo Prise en compte du bonus de base en magie activ%e2%e.
set /a cal = magbontal
if %cal% gtr 0 echo Bonus secondaire de base en magie: %magbontal%
set /a cal = inprcmag
if %cal%==1 echo Prise en compte du bonus de pourcentage en magie activ%e2%e.
if not "%foisst%"=="1" echo Multiplication des stats par %foisst%.
if not "%foisatt%"=="1" echo Multiplication du jet de d%e2%g%ac%t par %foisatt%.
if not "%foisvie%"=="1" echo Multiplication de la sant%e2% par %foisvie%.
if not "%foismana%"=="1" echo Multiplication de la mana par %foismana%.
if not "%foisvig%"=="1" echo Multiplication de la vigueur par %foisvig%.
if not "%foisnatar%"=="1" echo Multiplication de l'armure naturelle par %foisnatar%.
if not "%foisar%"=="1" echo Multiplication de l'armure par %foisar%.
if not "%foismag%"=="1" echo Multiplication des d%e2%g%ac%ts magiques par %foismag%.
if %nbrmods%==0 goto info1
set /a infm = 1
set /a mnd = 1
set /a ct = 0
:info0b
set /a ct += 1
echo(
call :infoformods
if not %ct%==%nbrmods% goto info0b
set /a infm = 0
:info1
if %nbrbars% gtr 0 echo(&echo Jauges secondaires: & call :affbars
if %nbrweps% gtr 0 echo(&echo Armes secondaires: & call :affweps
if %instat%==0 goto :eof
if %chtst%==0 goto info2
:infoforweb
set /a ct = 0
set /a temp1 = 0
set /a temp2 = 0
set /a temp3 = 0
set /a temp4 = 0
:info1b
set /a ct += 1
set /a temp1 += reu%ct%
set /a temp2 += ech%ct%
set /a temp3 += crtreu%ct%
set /a temp4 += crtech%ct%
if not %ct%==7 goto info1b
if %clfc%==1 goto :eof
set /a temp = temp1+temp2+temp3+temp4
if %temp%==0 goto info2
echo(
echo R%e2%capitulatif des jets de d%e2%s lors de tests:
set /a ct = 0
:info1b2
set /a ct += 1
set /a nb = temp%ct%*100/temp
if %ct%==1 if %temp1% gtr 0 echo R%e2%ussites: %temp1%  %nb%%%
if %ct%==2 if %temp2% gtr 0 echo Echecs: %temp2%  %nb%%%
if %ct%==3 if %temp3% gtr 0 echo R%e2%ussites critiques: %temp3%  %nb%%%
if %ct%==4 if %temp4% gtr 0 echo Echecs critiques: %temp4%  %nb%%%
set /a ct2 = 0
:info1b3
set /a ct2 += 1
set /a nb = temp%ct%
if %nb%==0 goto info1b3e
if %ct%==1 set /a nb = reu%ct2%
if %ct%==2 set /a nb = ech%ct2%
if %ct%==3 set /a nb = crtreu%ct2%
if %ct%==4 set /a nb = crtech%ct2%
set /a temp02 = %nb%*100/temp%ct%
if %nb% gtr 0 if %ct2%==1 echo    Attaque physique: %nb%  %temp02%%%%
if %nb% gtr 0 if %ct2%==2 echo    Attaque en sort: %nb%  %temp02%%%%
if %nb% gtr 0 if %ct2%==3 echo    Soin: %nb%  %temp02%%%%
if %nb% gtr 0 if %ct2%==4 echo    Physique: %nb%  %temp02%%%%
if %nb% gtr 0 if %ct2%==5 echo    Mental: %nb%  %temp02%%%%
if %nb% gtr 0 if %ct2%==6 echo    Social: %nb%  %temp02%%%%
if %nb% gtr 0 if %ct2%==7 echo    Autre: %nb%  %temp02%%%%
:info1b3e
if not %ct2%==7 goto info1b3
if not %ct%==4 goto info1b2
:info2
echo(
if %nbrdegsu% gtr 0 echo Attaques subies: %nbrdegsu%
if %degsuphy% gtr 0 echo D%e2%gats physiques subis: %degsuphy%
if %degsumag% gtr 0 echo D%e2%gats magiques subis: %degsumag%
if %degsupr% gtr 0 echo D%e2%gats purs subis: %degsupr%
if %gtdeg1% gtr 0 echo Plus grands points de d%e2%g%ac%ts physiques subis: %gtdeg1%
if %gtdeg2% gtr 0 echo Plus grands points de d%e2%g%ac%ts magiques subis: %gtdeg2%
if %gtdeg3% gtr 0 echo Plus grands points de d%e2%g%ac%ts purs subis: %gtdeg3%
if %recup% gtr 0 echo Sant%e2% soign%e2%e: %recup%
if %nsavephy% gtr 0 echo Attaques physiques effectu%e2%es: %nsavephy%
if %nsavemag% gtr 0 echo Attaques magiques effectu%e2%es: %nsavemag%
if %nsavesor% gtr 0 echo Attaques en sort effectu%e2%es: %nsavesor%
if %nsavesoi% gtr 0 echo Soins effectu%e2%es: %nsavesoi%
if %deginphy% gtr 0 echo D%e2%gats physiques inflig%e2%s: %deginphy%
if %deginmag% gtr 0 echo D%e2%gats magiques inflig%e2%s: %deginmag%
if %deginsor% gtr 0 echo D%e2%gats de sort inflig%e2%s: %deginsor%
if %soinin% gtr 0 echo Soins %e2%mis: %soinin%
if %gtatt1% gtr 0 echo Plus grands points de d%e2%g%ac%ts physiques inflig%e2%s: %gtatt1%
if %gtatt2% gtr 0 echo Plus grands points de d%e2%g%ac%ts magiques inflig%e2%s: %gtatt2%
if %gtatt3% gtr 0 echo Plus grands points de d%e2%g%ac%ts de sort inflig%e2%s: %gtatt3%
if %gtatt31% gtr 0 echo Plus grands soins %e2%mis: %gtatt31%
if %gtatt4% gtr 0 echo Plus grands points de d%e2%g%ac%ts purs inflig%e2%s: %gtatt4%
if %manaus% gtr 0 echo Mana utilis%e2%e: %manaus%
if %vigus% gtr 0 echo Vigueur utilis%e2%e: %vigus%
echo Inconsciences: %nbrdeads%
echo(
goto :eof

:barr
if %nbrbars%==1 set /a ct = 1 & goto barr2
set /a afn = 1 & call :affbars
set /a ct = 0
set chm=
:barrb
set /a ct += 1
set chm=%chm%%ct%
:barr1
choice /c R%chm% /n /m "N%nm% de la jauge secondaire:"
if %errorlevel%==1 goto fin
set /a ct = %errorlevel%
set /a ct -= 1
:barr2
call :barstemp
set /a cal = 0
set /p "cal=%bar%: %temp1% +"
if %nbrbars%==1 if "%cal%"=="R" goto fin
if "%cal%"=="R" goto barr1
set /a calr = %cal%
set /a temp = 0
if %calr% lss 0 set /a calr += temp5 & set /a temp = 1
if %temp%==1 if %calr% gtr 0 set /a calr = 0
if %calr% lss 0 if %temp2%==1 set /a calr = 0
set /a calr += bar%ct%pts
if %calr% gtr %temp3% if %temp4%==1 set /a calr = temp3
set /a bar%ct%pts = calr
call :barstemp
echo %baraf1%%temp1%%baraf2%
timeout /t 01>nul
goto fin

:full
if %l3vie% lss %l3basevie% set /a l3vie = l3basevie & echo Vie remise au maximum.
if %l3mana% lss %l3basemana% set /a l3mana = l3basemana & echo Mana remise au maximum.
if %l3vig% lss %l3basevig% set /a l3vig = l3basevig & echo Vigueur remise au maximum.
if %shnb% gtr 0 if %l3shn% lss %l3shnb% set /a l3shn = l3shnb & echo Protection remise au maximum.
goto fin

:rsjg100
set /a l3vie = l3basevie
set /a l3mana = l3basemana
set /a l3vig = l3basevig
if %shnb% gtr 0 set /a l3shn = l3shnb
goto fin

:resbfor
set /a l3vie = vieret
set /a l3mana = manaret
set /a l3vig = vigret

:fin
if %l3vie% gtr 0 set /a conddead = 1 & set /a beenres = 0
if %conddead%==1 if %l3vie%==0 set /a nbrdeads += 1 & set /a conddead = 0
:fin2
set /a cal = baseviemod%mod%*(100+don5)/100
set /a cal1 = (basemanamod%mod%+cmpmana)*(100+donmana)/100
set /a cal2 = (basevigmod%mod%+cmpvig)*(100+donvig)/100
set /a cal3 = shnbmod%mod%
set /a vie = %l3vie%*%cal%/%l3basevie%
set /a mana = %l3mana%*%cal1%/%l3basemana%
set /a vig = %l3vig%*%cal2%/%l3basevig%
if %shnb% gtr 0 set /a shn = %l3shn%*%cal3%/%l3shnb%
call :save
goto vis


:createchar
echo(
if not exist "Statsz de %nom%".bat set /a mnd = 0 & set /a maj2 = 0 & set /a dlvl = 1 & set /a cmpspe = 1 & echo Cr%e2%ation de %nom%. & goto retlvl
echo Modification de %nom%.
:createchar2
set /a modif = 1
set /a dlvl = lvl
:createchar3
if not "%colorvalmod0%"=="" color %colorvalmod0%
choice /c LDMAWF /n /m "Modification (L-LvlUp / D-Dons / M-Mods / A-Ajouts / W-Page Web / F-Fin):"
if %errorlevel%==1 set /a lup = 1 & call :retlvl & set /a lup = 0 & goto createchar3
if %errorlevel%==2 call :don2 & goto createchar3
if %errorlevel%==4 goto adds
if %errorlevel%==5 call :createwebpage & goto createchar3
if %errorlevel%==6 goto endmodif
set chm=0
set chm2=0-Stats de base
set /a ct = 0
if %nbrmods%==0 goto mdmenubend
:mdmenub
set /a ct += 1
set chm=%chm%%ct%
call :namemodtemp
set chm2=%chm2% / %ct%-%namemod%
if not %ct%==%nbrmods% goto mdmenub
if %nbrmods% gtr 0 set chm2=S-Supprimer un mod / %chm2%& set chm=S%chm%
:mdmenubend
if %nbrmods%==5 goto mdmenubend2
set /a ct += 1
set chm=%chm%%ct%
set chm2=%chm2% / %ct%-Nouveau mod
:mdmenubend2
choice /c R%chm% /n /m "N%nm% du mod %a0% ajouter ou modifier (%chm2%):"
if %errorlevel%==1 goto createchar3
if %nbrmods% gtr 0 if %errorlevel%==2 goto delmodds
set /a mnd = %errorlevel%
set /a mnd -= 2
if %nbrmods% gtr 0 set /a mnd -= 1
if %mnd% gtr %nbrmods% set /a nbrmods = mnd & goto ret01
goto debmodif

:delmodds
if %nbrmods% gtr 1 goto delmodds2
set temp=%namemod1%
choice /c ONR /n /m "Supprimer le mod %temp% ? (O/N):"
if %errorlevel%==2 goto mdmenubend2
if %errorlevel%==3 goto mdmenubend2
set /a nb = 1
goto delmoddsend
:delmodds2
set /a ct = 0
set chm=
set chm2=
:mdmenubdel
set /a ct += 1
set chm=%chm%%ct%
call :namemodtemp
set chm2=%chm2%%ct%-%namemod%
if not %ct%==%nbrmods% set chm2=%chm2% / & goto mdmenubdel
choice /c R%chm% /n /m "N%nm% du mod %a0% supprimer (%chm2%):"
if %errorlevel%==1 goto createchar3
set /a nb = %errorlevel%
set /a nb -= 1
if %nb%==%nbrmods% set namemod%nb%=& goto delmoddsend
call :namemodtemp
set temp=%namemod%
set /a ct = nbrmods
call :namemodtemp
set namemod%nb%=%namemod%
set /a nodeadmod%nb% = nodeadmod%nbrmods%
set /a regenviemod%nb% = regenviemod%nbrmods%
set /a regenmanamod%nb% = regenmanamod%nbrmods%
set /a regenvigmod%nb% = regenvigmod%nbrmods%
set /a shadmod%nb% = shadmod%nbrmods%
set /a shnbmod%nb% = shnbmod%nbrmods%
call :foistemp
set foisst%nb%=%temp040%
set foisatt%nb%=%temp04%
set foisvie%nb%=%temp05%
set foismana%nb%=%temp06%
set foisvig%nb%=%temp061%
set foisnatar%nb%=%temp07%
set foisar%nb%=%temp08%
set foismag%nb%=%temp09%
set /a phystatmod%nb% = phystatmod%nbrmods%
set /a socstatmod%nb% = socstatmod%nbrmods%
set /a menstatmod%nb% = menstatmod%nbrmods%
set /a baseviemod%nb% = baseviemod%nbrmods%
set /a basemanamod%nb% = basemanamod%nbrmods%
set /a basevigmod%nb% = basevigmod%nbrmods%
set /a natarmurephymod%nb% = natarmurephymod%nbrmods%
set /a natarmuremagmod%nb% = natarmuremagmod%nbrmods%
set /a armurephymod%nb% = armurephymod%nbrmods%
set /a armuremagmod%nb% = armuremagmod%nbrmods%
set /a wep0basmod%nb% = wep0basmod%nbrmods%
set /a wep0bonmod%nb% = wep0bonmod%nbrmods%
set /a wep0attmod%nb% = wep0attmod%nbrmods%
set /a inbonphymod%nb% = inbonphymod%nbrmods%
set /a wep0bontalmod%nb% = wep0bontalmod%nbrmods%
set /a inprcphymod%nb% = inprcphymod%nbrmods%
set /a inbonmagmod%nb% = inbonmagmod%nbrmods%
set /a magbontalmod%nb% = magbontalmod%nbrmods%
set /a inprcmagmod%nb% = inprcmagmod%nbrmods%
:delmoddsend
set namemod%nb%=
set /a nbrmods -= 1
echo Mod %temp% supprim%e2%.
goto createchar3

:debmodif
if %mnd%==0 goto debmodif2
:debmodif0
set /a ct = mnd
call :colortemp
if not "%temp010%"=="" color %temp010%
echo(
:infoformods
call :modstemp
if %mnd%==0 echo Modification(s) apport%e2%e(s):
if %mnd% gtr 0 echo Modification(s) apport%e2%e(s) par le mod %namemod%:
if %temp01%==1 echo R%e2%surection par le mod activ%e2%e.
if %temp02%==1 echo R%e2%g%e2%n%e2%ration de la vie par l'activation du mod activ%e2%e.
if %temp03%==1 echo R%e2%g%e2%n%e2%ration de la mana par l'activation du mod activ%e2%e.
if %temp031%==1 echo R%e2%g%e2%n%e2%ration de la vigueur par l'activation du mod activ%e2%e.
if %mnd%==0 set /a cal = phystat
if %mnd% gtr 0 set /a cal = phystatmod0
if %temp1% neq %cal% echo Physique: %cal% - %temp1%
if %mnd%==0 set /a cal = socstat
if %mnd% gtr 0 set /a cal = socstatmod0
if %temp2% neq %cal% echo Social: %cal% - %temp2%
if %mnd%==0 set /a cal = menstat
if %mnd% gtr 0 set /a cal = menstatmod0
if %temp3% neq %cal% echo Mental: %cal% - %temp3%
if %mnd%==0 set /a cal = basevie
if %mnd% gtr 0 set /a cal = baseviemod0
if %temp4% neq %cal% echo Sant%e2%: %cal% - %temp4%
if %mnd%==0 set /a cal = basemana
if %mnd% gtr 0 set /a cal = basemanamod0
if %temp5% neq %cal% echo Mana: %cal% - %temp5%
if %mnd%==0 set /a cal = basevig
if %mnd% gtr 0 set /a cal = basevigmod0
if %temp51% neq %cal% echo Vigueur: %cal% - %temp51%
if %mnd%==0 set /a cal = natarmurephy
if %mnd% gtr 0 set /a cal = natarmurephymod0
if %temp6% neq %cal% echo Armure physique naturelle: %cal% - %temp6%
if %mnd%==0 set /a cal = natarmuremag
if %mnd% gtr 0 set /a cal = natarmuremagmod0
if %temp7% neq %cal% echo Armure magique naturelle: %cal% - %temp7%
if %mnd%==0 set /a cal = armurephy
if %mnd% gtr 0 set /a cal = armurephymod0
if %temp8% neq %cal% echo Armure physique: %cal% - %temp8%
if %mnd%==0 set /a cal = armuremag
if %mnd% gtr 0 set /a cal = armuremagmod0
if %temp9% neq %cal% echo Armure magique: %cal% - %temp9%
if %mnd%==0 set /a cal = wep0bas
if %mnd% gtr 0 set /a cal = wep0basmod0
if %temp10% neq %cal% echo D%e2%g%ac%ts de base: %cal% - %temp10%
if %mnd%==0 set /a cal = wep0bon
if %mnd% gtr 0 set /a cal = wep0bonmod0
if %temp11% neq %cal% echo Am%e2%lioration de d%e2%g%ac%ts: %cal% - %temp11%
if %mnd%==0 set /a cal = wep0att
if %mnd% gtr 0 set /a cal = wep0attmod0
if %temp120% neq %cal% if %temp120%==1 echo Attribut des d%e2%g%ac%ts magique activ%e2%.
if %temp120% neq %cal% if %temp120%==0 Attribut des d%e2%g%ac%ts magique d%e2%sactiv%e2%e.
if %mnd%==0 set /a cal = wep0idon
if %mnd% gtr 0 set /a cal = wep0idonmod0
if %temp12% neq %cal% if %temp12% gtr 0 echo Prise en compte de la sp%e2%cialisation martialle N%nm%%temp12%.
if %temp12% neq %cal% if %temp12%==0 echo Prise en compte de la sp%e2%cialisation martialle d%e2%sactiv%e2%e.
if %mnd%==0 set /a cal = inbonphy
if %mnd% gtr 0 set /a cal = inbonphymod0
if %temp130% neq %cal% if %temp130%==1 echo Prise en compte du bonus de base en attaque physique activ%e2%e.
if %temp130% neq %cal% if %temp130%==0 echo Prise en compte du bonus de base en attaque physique d%e2%sactiv%e2%e.
if %mnd%==0 set /a cal = wep0bontal
if %mnd% gtr 0 set /a cal = wep0bontalmod0
if %temp13% neq %cal% echo Am%e2%lioration de d%e2%g%ac%ts des talents: %cal% - %temp13%
if %mnd%==0 set /a cal = inprcphy
if %mnd% gtr 0 set /a cal = inprcphymod0
if %temp14% neq %cal% if %temp14%==1 echo Prise en compte du bonus de pourcentage en attaque physique activ%e2%e.
if %temp14% neq %cal% if %temp14%==0 echo Prise en compte du bonus de pourcentage en attaque physique d%e2%sactiv%e2%e.
if %mnd%==0 set /a cal = inbonmag
if %mnd% gtr 0 set /a cal = inbonmagmod0
if %temp150% neq %cal% if %temp150%==1 echo Prise en compte du bonus de base en magie activ%e2%e.
if %temp150% neq %cal% if %temp150%==0 echo Prise en compte du bonus de base en magie d%e2%sactiv%e2%e.
if %mnd%==0 set /a cal = magbontal
if %mnd% gtr 0 set /a cal = magbontalmod0
if %temp15% neq %cal% echo Am%e2%lioration de d%e2%g%ac%ts des sorts: %cal% - %temp15%
if %mnd%==0 set /a cal = inprcmag
if %mnd% gtr 0 set /a cal = inprcmagmod0
if %temp16% neq %cal% if %temp16%==1 echo Prise en compte du bonus de pourcentage en magie activ%e2%e.
if %temp16% neq %cal% if %temp16%==0 echo Prise en compte du bonus de pourcentage en magie d%e2%sactiv%e2%e.
if not "%temp040%"=="" if not "%temp040%"=="1" echo Multiplication des stats par %temp040%.
if not "%temp04%"=="" if not "%temp04%"=="1" echo Multiplication du jet de d%e2%g%ac%t par %temp04%.
if not "%temp05%"=="" if not "%temp05%"=="1" echo Multiplication de la sant%e2% par %temp05%.
if not "%temp06%"=="" if not "%temp06%"=="1" echo Multiplication de la mana par %temp06%.
if not "%temp061%"=="" if not "%temp061%"=="1" echo Multiplication de la vigueur par %temp061%.
if not "%temp07%"=="" if not "%temp07%"=="1" echo Multiplication de l'armure naturelle par %temp07%.
if not "%temp08%"=="" if not "%temp08%"=="1" echo Multiplication de l'armure par %temp08%.
if not "%temp09%"=="" if not "%temp09%"=="1" echo Multiplication des d%e2%g%ac%ts magiques par %temp09%.
if %temp041%==1 echo Activation de protection par l'activation du mod activ%e2%e (%temp042%).
if %mnd%==0 set /a cal = shnb
if %mnd% gtr 0 set /a cal = shnbmod0
if %temp042% neq %cal% echo Points de protection: %cal% - %temp042%
if %infm%==1 goto :eof
:debmodif2
set temp=
if %mnd% gtr 0 set temp=       
echo 1-Sant%e2%/Mana/Vigueur   2-Physique/Social/Mental      %temp%3-Armures
echo 4-D%e2%g%ac%ts globaux       5-Multiplications des stats   %temp%6-Couleur de la fen%ec%tre
if %mnd%==0 echo 7-Protection           F-Fin
if %mnd% gtr 0 echo 7-Protection           8-R%e2%actions %a0% l'utilisation du mod   9-Nom du mod & echo F-Fin
if %mnd%==0 set chm=
if %mnd% gtr 0 set chm=89
choice /c RF1234567%chm% /n /m "Modification:"
if %errorlevel%==3 goto ret05
if %errorlevel%==4 goto ret07
if %errorlevel%==5 goto ret10
if %errorlevel%==6 goto ret15
if %errorlevel%==7 goto alwmulti
if %errorlevel%==8 goto colors
if %errorlevel%==9 goto shcr
if %errorlevel%==10 goto ret02
if %errorlevel%==11 goto ret01
if %mnd%==0 call :majmod0
goto createchar3
:majmod0
if %nbrmods%==0 goto :eof
set /a ct = 0
:majmod0b
set /a ct += 1
call :modstemp
echo Mise %a0% jour du mod %namemod% ...
if %temp1%==%phystat% set /a phystatmod%ct% = phystatmod0
if %temp2%==%socstat% set /a socstatmod%ct% = socstatmod0
if %temp3%==%menstat% set /a menstatmod%ct% = menstatmod0
if %temp4%==%basevie% set /a baseviemod%ct% = baseviemod0
if %temp5%==%basemana% set /a basemanamod%ct% = basemanamod0
if %temp51%==%basevig% set /a basevigmod%ct% = basevigmod0
if %temp6%==%natarmurephy% set /a natarmurephymod%ct% = natarmurephymod0
if %temp7%==%natarmuremag% set /a natarmuremagmod%ct% = natarmuremagmod0
if %temp8%==%armurephy% set /a armurephymod%ct% = armurephymod0
if %temp9%==%armuremag% set /a armuremagmod%ct% = armuremagmod0
set /a cal = wep0bas
if %temp10%==%cal% set /a wep0basmod%ct% = wep0basmod0
if %temp11%==%wep0bon% set /a wep0bonmod%ct% = wep0bonmod0
set /a cal = wep0att
if %temp120%==%cal% set /a wep0attmod%ct% = wep0attmod0
set /a cal = wep0idon
if %temp12%==%cal% set /a wep0idonmod%ct% = wep0idonmod0
set /a cal = inbonphy
if %temp130%==%cal% set /a inbonphymod%ct% = inbonphymod0
set /a cal = wep0bontal
if %temp13%==%cal% set /a wep0bontalmod%ct% = wep0bontalmod0
set /a cal = inprcphy
if %temp14%==%cal% set /a inprcphymod%ct% = inprcphymod0
set /a cal = inbonmag
if %temp150%==%cal% set /a inbonmagmod%ct% = inbonmagmod0
set /a cal = magbontal
if %temp15%==%cal% set /a magbontalmod%ct% = magbontalmod0
set /a cal = inprcmag
if %temp16%==%cal% set /a inprcmagmod%ct% = inprcmagmod0
if not %ct%==%nbrmods% goto majmod0b
goto :eof

:debmodifsame
set /a phystatmod%mnd% = phystatmod0
set /a socstatmod%mnd% = socstatmod0
set /a menstatmod%mnd% = menstatmod0
set /a baseviemod%mnd% = baseviemod0
set /a basemanamod%mnd% = basemanamod0
set /a basevigmod%mnd% = basevigmod0
set /a natarmurephymod%mnd% = natarmurephymod0
set /a natarmuremagmod%mnd% = natarmuremagmod0
set /a armurephymod%mnd% = armurephymod0
set /a armuremagmod%mnd% = armuremagmod0
set /a wep0basmod%mnd% = wep0basmod0
set /a wep0bonmod%mnd% = wep0bonmod0
set /a wep0attmod%mnd% = wep0attmod0
set /a wep0idonmod%mnd% = wep0idonmod0
set /a inbonphymod%mnd% = inbonphymod0
set /a wep0bontalmod%mnd% = wep0bontalmod0
set /a inprcphymod%mnd% = inprcphymod0
set /a inbonmagmod%mnd% = inbonmagmod0
set /a magbontalmod%mnd% = magbontalmod0
set /a inprcmagmod%mnd% = inprcmagmod0
set /a shnbmod%mnd% = shnbmod0
echo Aucune modification encore apport%e2%e par le mod %namemod%.
goto debmodif2

:ret01
set /a ct = mnd
call :namemodtemp
set temp=%namemod%
set temp2=%temp%
if "%temp%"=="" set temp=Non d%e2%fini
set /p "namemod=Nom du mod %mnd% (%temp%):
if "%temp2%"=="" if "%namemod%"=="R" set /a nbrmods -= 1 & goto mdmenubend2
if "%namemod%"=="R" goto debmodif2
if "%namemod%"=="" goto ret01
set namemod%mnd%=%namemod%
if "%temp2%"=="" goto debmodifsame
goto debmodif0

:ret02
set /a temp = nodeadmod%mnd%
if %temp%==0 set rep=N
if %temp%==1 set rep=O
choice /c ONR /n /m "Activer le mod lors de l'inconscience ? (O/N) (%rep%):"
if %errorlevel%==1 set /a nodeadmod%mnd% = 1
if %errorlevel%==2 set /a nodeadmod%mnd% = 0
if %errorlevel%==3 goto debmodif2

:ret03
set /a temp = regenviemod%mnd%
if %temp%==0 set rep=N
if %temp%==1 set rep=O
choice /c ONR /n /m "R%e2%g%e2%n%e2%rer la sant%e2% lors de l'activation ? (O/N) (%rep%):"
if %errorlevel%==1 set /a regenviemod%mnd% = 1
if %errorlevel%==2 set /a regenviemod%mnd% = 0
if %errorlevel%==3 goto ret02

:ret04
set /a temp = regenmanamod%mnd%
if %temp%==0 set rep=N
if %temp%==1 set rep=O
choice /c ONR /n /m "R%e2%g%e2%n%e2%rer la mana lors de l'activation ? (O/N) (%rep%):"
if %errorlevel%==1 set /a regenmanamod%mnd% = 1
if %errorlevel%==2 set /a regenmanamod%mnd% = 0
if %errorlevel%==3 goto ret03

set /a temp = regenvigmod%mnd%
if %temp%==0 set rep=N
if %temp%==1 set rep=O
choice /c ONR /n /m "R%e2%g%e2%n%e2%rer la vigueur lors de l'activation ? (O/N) (%rep%):"
if %errorlevel%==1 set /a regenvigmod%mnd% = 1
if %errorlevel%==2 set /a regenvigmod%mnd% = 0
if %errorlevel%==3 goto ret04
goto debmodif0

:shcr
if %mnd%==0 goto shcr2
set /a temp = shadmod%mnd%
if %temp%==0 set rep=N
if %temp%==1 set rep=O
choice /c ONR /n /m "Activer le bouclier lors de l'activation ? (O/N) (%rep%):"
if %errorlevel%==1 set /a shadmod%mnd% = 1
if %errorlevel%==2 set /a shadmod%mnd% = 0
if %errorlevel%==3 goto debmodif2
:shcr2
set /a cal = shnbmod%mnd%
set /p "cal=Points de protection (%cal%):"
if %mnd%==0 if "%cal%"=="R" goto debmodif2
if "%cal%"=="R" goto shcr
set /a calr = %cal%
if %calr% lss 0 echo Les point de protection ne peuvent %ec%tre n%e2%gatifs. & goto shcr2
if not "%calr%"=="%cal%" echo Points de protection:%calr%
set /a shnbmod%mnd% = calr
goto debmodif0

:retlvl
set /a cal = lvl
if %lvl%==0 set /a cal = 1
if %lvl%==0 set /p "cal=Niveau (%cal%):"
if %lvl% gtr 0 set /p "cal=Du niveau %dlvl% jusqu'au niveau (%cal%):"
if %lup%==1 if "%cal%"=="R" goto :eof
if "%cal%"=="R" goto retlvl
set /a calr = %cal%
if %calr% lss 1 echo Le niveau ne peut %ec%tre n%e2%gatif ou nul. & goto retlvl
if %calr% leq %dlvl% if %calr% gtr 1 set /a dlvl = 1 & echo Remise du niveau de base %a0% 1. & echo L'augmentation sera alors refaite jusqu'au niveau %calr%.
if not "%calr%"=="%cal%" echo Niveau:%calr%
set /a lvl = calr
if %modif%==1 goto augm

:augmviemana
echo(
choice /c ONR /n /m "Saisir la sant%e2% et la mana avec le niveau ? (O/N):"
if %errorlevel%==2 goto ret05
if %errorlevel%==3 goto retlvl
:augm
set /a life = 1
echo Les jets de d%e2%s sont effectu%e2%s par l'ordinateur.
:augm_des0
if %life%==1 echo Augmentation de la sant%e2%.
if %life%==0 echo Augmentation de la mana.
:augm_des
if %life%==1 set /a augmdes = augmdesvie
if %life%==0 set /a augmdes = augmdesmana
set /a cal = augmdes
set /p "cal=D%e2%s (%augmdes%):"
if "%cal%"=="R" if %life%==0 set /a life = 1 & goto augm_bon
if "%cal%"=="R" goto augmviemana
set /a calr = %cal%
if %calr% lss 1 echo La valeur du d%e2%s doit d%e2%passer 0. & goto augm_des
set /a augmdes = calr
if %life%==1 set /a augmdesvie = augmdes
if %life%==0 set /a augmdesmana = augmdes
:augm_bon
if %life%==1 set /a augmbon = augmbonvie
if %life%==0 set /a augmbon = augmbonmana
set /a cal = augmbon
set /p "cal=Bonus (%augmbon%):"
if "%cal%"=="R" goto augm_des
set /a calr = %cal%
set /a augmbon = calr
if %life%==1 set /a augmbonvie = augmbon
if %life%==0 set /a augmbonmana = augmbon
if %dlvl%==1 set /a temp = augmdes+augmbon & goto augm_bdeb
if %life%==1 if %baseviemod0% gtr 0 set /a temp = baseviemod0
if %life%==0 if %basemanamod0% gtr 0 set /a temp = basemanamod0
:augm_bdeb
if %lvl%==1 if %life%==1 set /a baseviemod0 = temp & echo Sant%e2%: %temp% & set /a life = 0 & goto augm_des0
if %lvl%==1 set /a basemanamod0 = temp & echo Mana: %temp% & goto augm_end
echo Chargement ...
set /a ct = dlvl
set /a min = temp
set /a moy = temp
set /a max = temp
:augm_b
set /a ct += 1
set /a nb = %random%%%%augmdes%+1+augmbon
if %life%==0 goto augm_b2
set /a nb = nb*((1+ct/10)*(1+ct/10))
set /a min += (1+augmbon)*((1+ct/10)*(1+ct/10))
set /a moy += (augmdes/2+augmbon)*((1+ct/10)*(1+ct/10))
set /a max += (augmdes+augmbon)*((1+ct/10)*(1+ct/10))
:augm_b2
if %nb% gtr 0 set /a temp += nb
if not %ct%==%lvl% goto augm_b
if %life%==1 set /a baseviemod0 = temp & echo Sant%e2%: %temp%
if %life%==0 set /a basemanamod0 = temp & echo Mana: %temp%
if %life%==0 set /a min += (1+augmbon)*(lvl-dlvl) & set /a moy += (augmdes/2+augmbon)*(lvl-dlvl) & set /a max += (augmdes+augmbon)*(lvl-dlvl)
echo Minimum: %min% - Moyenne: %moy% - Maximum: %max%
choice /c ONR /n /m "Relancer l'al%e2%atoire ? (O/N):"
if %errorlevel%==1 goto augm_des0
if %errorlevel%==3 goto augm_des0
if %life%==1 set /a life = 0 & goto augm_des0
:augm_end
echo(
if %lup%==1 goto don
if %modif%==1 goto debmodif0
choice /c ONR /n /m "Resaisir manuellement la vie et la mana ? (O/N):"
if %errorlevel%==2 goto ret061
if %errorlevel%==3 goto augmviemana

:ret05
set /a cal = baseviemod%mnd%
set /p "cal=Sant%e2% (%cal%):"
if %modif%==1 if "%cal%"=="R" goto debmodif2
if "%cal%"=="R" goto augmviemana
set /a calr = %cal%
if %calr% lss 1 echo La vie doit d%e2%passer 0. & goto ret05
if not "%calr%"=="%cal%" echo Sant%e2%:%calr%
set /a baseviemod%mnd% = calr

:ret06
set /a cal = basemanamod%mnd%
set /p "cal=Mana (%cal%):"
if "%cal%"=="R" goto ret05
set /a calr = %cal%
if %calr% lss 1 echo La mana doit d%e2%passer 0. & goto ret06
if not "%calr%"=="%cal%" echo Mana:%calr%
set /a basemanamod%mnd% = calr

:ret061
set /a cal = basevigmod%mnd%
if %cal%==0 set /a cal = 100
set /p "cal=Vigueur (%cal%):"
if "%cal%"=="R" goto augmviemana
set /a calr = %cal%
if %calr% lss 1 echo La vigueur doit d%e2%passer 0. & goto ret061
if not "%calr%"=="%cal%" echo Vigueur:%calr%
set /a basevigmod%mnd% = calr
if %modif%==1 goto debmodif0
echo(

:ret07
set /a cal = phystatmod%mnd%
set /p "cal=Physique (%cal%):"
if %modif%==1 if "%cal%"=="R" goto debmodif2
if "%cal%"=="R" goto ret061
set /a calr = %cal%
if %calr% lss 1 echo Le physique doit d%e2%passer 0. & goto ret07
if %calr% gtr 95 echo Le physique ne doit pas d%e2%passer 95. & goto ret07
if not "%calr%"=="%cal%" echo Physique:%calr%
set /a phystatmod%mnd% = calr

:ret08
set /a cal = socstatmod%mnd%
set /p "cal=Social (%cal%):"
if "%cal%"=="R" goto ret07
set /a calr = %cal%
if not "%calr%"=="%cal%" echo Social:%calr%
set /a socstatmod%mnd% = calr

:ret09
set /a cal = menstatmod%mnd%
set /p "cal=Mental (%cal%):"
if "%cal%"=="R" goto ret08
set /a calr = %cal%
if %calr% lss 1 echo Le mental doit d%e2%passer 0. & goto ret09
if %calr% gtr 95 echo Le mental ne doit pas d%e2%passer 95. & goto ret09
if not "%calr%"=="%cal%" echo Mental:%calr%
set /a menstatmod%mnd% = calr
if %modif%==1 goto debmodif0

:don
if %cmpspe%==0 set /a cmpspe = 1
echo(
set rep=N
if %lvl% gtr 0 set rep=O
choice /c ONR /n /m "Saisir les dons ? (O/N) (%rep%):"
if %modif%==1 if %errorlevel%==2 goto :eof
if %modif%==1 if %errorlevel%==3 goto :eof
if %errorlevel%==2 goto ret10
if %errorlevel%==3 goto ret09
:don2
echo Saisie des dons.
:doncmp
if %maj%==1 echo Saisir "I" pour ignorer la mise %a0% jour.
set /a cal = icmp
set /p "cal=Intervalle d'obtention de bonus de mana/vigueur (en niveau): (%cal%):"
if %maj%==1 if "%cal%"=="R" goto doncmp
if %maj%==1 if "%cal%"=="I" set /a cmpspe = 1 & set /a cmpint = 100 & goto donend
if %modif%==1 if %lup%==0 if "%cal%"=="R" goto :eof
if "%cal%"=="R" goto don
set /a calr = %cal%
if not "%calr%"=="%cal%" echo Intervalle:%calr%
set /a icmp = calr
:doni
set /a cal = idon
set /p "cal=Intervalle d'obtention de dons (en niveau): (%cal%):"
if "%cal%"=="R" goto doncmp
set /a calr = %cal%
if not "%calr%"=="%cal%" echo Intervalle:%calr%
set /a idon = calr
set /a tempcmp = (3+lvl/icmp)*5
echo Bonus de mana ou de vigueur principal: %tempcmp%
:don0f
if %cmpspe%==0 set rep=M
if %cmpspe%==1 set rep=M
if %cmpspe%==2 set rep=V
choice /c MVR /n /m "Type de sp%e2%cialisation (M(Mana)/V(Vigueur)) (%rep%):"
if %errorlevel%==1 set /a cmpspe = 1
if %errorlevel%==2 set /a cmpspe = 2
if %errorlevel%==3 goto doni
:don0f2
set /a cal = cmpint
if %cal%==0 set /a cal = 50
set /p "cal=Intensit%e2% de la sp%e2%cialisation (en %%) (%cal%):"
if "%cal%"=="R" goto don0f
set /a calr = %cal%
if %calr% lss 50 echo L'intensit%e2% doit %ec%tre comprise entre 50 et 100. & goto don0f2
if %calr% gtr 100 echo L'intensit%e2% doit %ec%tre comprise entre 50 et 100. & goto don0f2
if not "%calr%"=="%cal%" echo Intensit%e2%:%calr%
set /a cmpint = calr
if %cmpspe%==1 set /a cmpmana = tempcmp*cmpint/100/5*5 & set /a cmpvig = tempcmp-cmpmana
if %cmpspe%==2 set /a cmpvig = tempcmp*cmpint/100/5*5 & set /a cmpmana = tempcmp-cmpvig
if %cmpspe%==1 set /a temp = cmpvig-cmpmana
if %cmpspe%==2 set /a temp = cmpmana-cmpvig
if %temp% gtr 0 if %cmpspe%==1 set /a cmpmana += temp & set /a cmpvig -= temp
if %temp% gtr 0 if %cmpspe%==2 set /a cmpmana -= temp & set /a cmpvig += temp
set /a don = 2+lvl/idon
set /a donbf = 2+dlvl/idon
if %dlvl%==1 set /a donbf = 0
set /a temp2 = don-donbf
if %dlvl%==1 if %temp2% gtr 0 echo Nombre de dons: %temp2%
if %dlvl% gtr 1 if %temp2% gtr 0 echo Nombre de dons suppl%e2%mentaires: %temp2%
if %temp2%==0 echo Aucun don suppl%e2%mentaire.
:donb3_2
echo Saisir les stats en pourcentage de 5 en 5 (5%% = 1 don).
echo Ajouts de pourcentages aux dons (saisir "M" pour entrer le maximum).
set /a max = lvl/5*5
:donb3_3
set /a ct2 = 0
:don_stats
set /a ct2 += 1
set /a cal = don%ct2%
if %ct2%==3 set temp=Affinit%e2% magique
if %ct2%==4 set temp=Magie de guerre
if %ct2%==5 set temp=Robustesse
if %ct2%==6 set temp=R%e2%sistance
if %ct2% gtr 2 goto don_stats2
echo Saisie des dons d'arme de pr%e2%dilection et de sp%e2%cialisation martiale.
echo Saisir "1" au mon de l'arme pour terminer.
set /a ct = 0
set /a temp3 = 0
:don_stats1
set /a ct += 1
:domwpnm
call :donwptemp
set temp=%donwp%
if "%temp%"=="" set temp=Non d%e2%fini
if %ct%==1 if not exist "Statsz de %nom%".bat if "%temp%"=="Non d%e2%fini" set temp=Arme de base
set /p "temp=Nom du don d'arme N%nm%%ct% (%temp%):"
if "%temp%"=="Non d%e2%fini" set temp=1
if %ct%==1 if "%temp%"=="R" goto don0f2
if "%temp%"=="R" set /a ct -= 1 & goto domwpsp
if %ct%==1 if "%temp%"=="1" set /a ct2 = 2 & echo Aucun don d'arme saisi. & goto don_stats
if "%temp%"=="1" set /a ct2 = 2 & set /a nbdonwp = ct -1 & goto don_stats
if not "%temp%"=="DEL" goto domwpnmend
if "%donwp%"=="" echo L'arme n'est m%ec%me par cr%e2%e. & goto domwpnm
if %ct% lss %nbdonwp% goto domwpnmdel
set donwp%ct%=
set /a donwp%ct%pr = 0
set /a donwp%ct%sp = 0
goto domwpnmdelend
:domwpnmdel
set /a nb = nbdonwp
call :donwptemp
set donwp%ct%=%donwp%
set /a donwp%ct%pr = temp1
set /a donwp%ct%sp = temp2
:domwpnmdelend
set /a nbdonwp -= 1
set /a ct3 = 0
:domwpnmdelendb
set /a ct3 += 1
set /a temp = wep0idonmod%ct3%
if %temp%==%ct% set /a wep0idonmod%ct3% = 0
if not %ct3%==5 goto domwpnmdelendb
set /a ct3 = 0
:domwpnmdelendb2
set /a ct3 += 1
set /a temp = wep%ct3%idon
if %temp%==%ct% set /a wep%ct3%idon = 0
if not %ct3%==%mxnbrweps% goto domwpnmdelendb2
echo Don d'arme supprim%e2%.
goto domwpnm
:domwpnmend
set donwp%ct%=%temp%
:domwppr
call :donwptemp
set /a cal = temp1
set /p "cal=Pr%e2%dilection de %donwp% (%cal%):"
if "%cal%"=="R" goto domwpnm
set /a calr = %cal%
if %calr% lss 0 echo Les dons ne peuvent %ec%tre des malus. & goto domwppr
set /a temp3 = 1 & set /a ct2 = 1 & call :don_stats3 & set /a temp3 = 0
if not "%calr%"=="%cal%" echo Pr%e2%dilection de %donwp%:%calr%
set /a donwp%ct%pr = calr
:domwpsp
call :donwptemp
set /a cal = temp2
set /p "cal=Sp%e2%cialisation martiale de %donwp% (%cal%):"
if "%cal%"=="R" goto domwppr
set /a calr = %cal%
if %calr% lss 0 echo Les dons ne peuvent %ec%tre des malus. & goto domwpsp
set /a temp3 = 1 & set /a ct2 = 2 & call :don_stats3 & set /a temp3 = 0
if not "%calr%"=="%cal%" echo Sp%e2%cialisation martiale de %donwp%:%calr%
set /a donwp%ct%sp = calr
call :donwptemp
if %temp1%==0 if %temp2%==0 echo Le don d'arme n'a aucun bonus. & goto domwpnm
if %ct%==%mxnbdonwp% echo Nombre maximal de dons d'arme atteint. & set /a nbdonwp = mxnbdonwp & goto don_stats
goto don_stats1
:don_stats2
set /a cal = don%ct2%
set /p "cal=%temp% (%cal%):"
if %ct2%==1 if "%cal%"=="R" goto donb2
if "%cal%"=="R" set /a ct2 -= 2 & goto don_stats
set /a calr = %cal%
if %calr% lss 0 echo Les dons ne peuvent %ec%tre des malus. & goto don_stats
:don_stats3
if "%cal%"=="M" set /a calr = max
if %lvl% gtr 4 if %calr% gtr %max% set /a calr = max & echo Pourcantage du don remis au maximum.
if %ct2%==1 set /a max2 = 95-phystatmod0
if %ct2%==3 set /a max2 = 95-menstatmod0
if %ct2%==1 if %max2% lss %calr% set /a calr = max2 & echo Don remis en coh%e2%rence avec la stat li%e2%e.
if %ct2%==3 if %max2% lss %calr% set /a calr = max2 & echo Don remis en coh%e2%rence avec la stat li%e2%e.
if %temp3%==1 goto :eof
if not "%calr%"=="%cal%" echo %temp%:%calr%
if %calr% lss %temp3% echo Les pourcentages ne peuvent normalement pas diminuer.
set /a don%ct2% = calr
if not %ct2%==6 goto don_stats
set /a donus = don3+don4+don5+don6
if %nbdonwp%==0 set /a donus = donus/5 & goto don_stats5
set /a ct = 0
:don_stats4
set /a ct += 1
call :donwptemp
set /a donus = donus+temp1+temp2
if not %ct%==%nbdonwp% goto don_stats4
set /a donus = donus/5
:don_stats5
set /a temp = donus-don
if %donus% gtr %don% echo Dons utilis%e2%s en trop: %temp% & goto donb3_3
set /a temp = don-donus
if %donus% lss %don% choice /c ONR /n /m "Il reste %temp% don(s) %a0% utiliser, laisser le reste en bonus de mana/vigueur ? (O/N):"
if %errorlevel%==2 goto donb3_3
if %errorlevel%==3 goto donb3_3
if %cmpspe%==1 set /a donmana = temp*cmpint/100 & set /a donvig = temp-donmana
if %cmpspe%==2 set /a donvig = temp*cmpint/100 & set /a donmana = temp-donvig
if %cmpspe%==1 set /a temp = donvig-donmana
if %cmpspe%==2 set /a temp = donmana-donvig
if %temp% gtr 0 if %cmpspe%==1 set /a donmana += temp & set /a donvig -= temp
if %temp% gtr 0 if %cmpspe%==2 set /a donmana -= temp & set /a donvig += temp
set /a donmana = donmana*5
set /a donvig = donvig*5
:donend
if %maj%==1 set /a mana = (basemanamod0+cmpmana)*(100+donmana)/100 & set /a vig = (basevigmod0+cmpvig)*(100+donvig)/100 & goto maj
echo(
if %lup%==1 call :majmod0 & goto :eof
if %modif%==1 goto :eof

:ret10
set /a cal = natarmurephymod%mnd%
set /p "cal=Armure physique naturelle (%cal%):"
if %instat%==1 if "%cal%"=="R" goto fin
if %modif%==1 if "%cal%"=="R" goto debmodif2
if "%cal%"=="R" goto ret09
set /a calr = %cal%
if %calr% lss 0 echo L'armure ne peut %ec%tre n%e2%gative. & goto ret10
if not "%calr%"=="%cal%" echo Armure physique naturelle:%calr%
if %instat%==1 set /a natarmurephy = calr & goto ret11
set /a natarmurephymod%mnd% = calr

:ret11
set /a cal = natarmuremagmod%mnd%
if %modif%==0 set /a cal = natarmurephymod0
set /p "cal=Armure magique naturelle (%cal%):"
if "%cal%"=="R" goto ret07
set /a calr = %cal%
if %calr% lss 0 echo L'armure ne peut %ec%tre n%e2%gative. & goto ret11
if not "%calr%"=="%cal%" echo Armure magique naturelle:%calr%
if %instat%==1 set /a natarmuremag = calr & goto ret12
set /a natarmuremagmod%mnd% = calr

:ret12
set /a cal = armurephymod%mnd%
set /p "cal=Armure physique (%cal%):"
if "%cal%"=="R" goto ret11
set /a calr = %cal%
if %calr% lss 0 echo L'armure ne peut %ec%tre n%e2%gative. & goto ret12
if not "%calr%"=="%cal%" echo Armure physique:%calr%
if %instat%==1 set /a armurephy = calr & goto ret14
set /a armurephymod%mnd% = calr

:ret14
set /a cal = armuremagmod%mnd%
if %modif%==0 set /a cal = armurephymod0
set /p "cal=Armure magique (%cal%):"
if "%cal%"=="R" goto ret12
set /a calr = %cal%
if %calr% lss 0 echo L'armure ne peut %ec%tre n%e2%gative. & goto ret14
if not "%calr%"=="%cal%" echo Armure magique:%calr%
if %instat%==1 set /a armuremag = calr & goto setstatsl01
set /a armuremagmod%mnd% = calr
if %modif%==1 goto debmodif0

:ret15
echo D%e2%g%ac%ts globaux:
:ret15_0
echo D%e2%g%ac%ts de l'arme de base:
:ret15_1
if %tempw%==0 set /a cal = wep0basmod%mnd%
if %tempw%==1 set /a cal = wep%ct%bas
set /p "cal=D%e2%g%ac%ts de base (%cal%):"
if %instat%==1 if "%cal%"=="R" goto fin
if %modif%==1 if "%cal%"=="R" goto debmodif2
if "%cal%"=="R" goto ret14
set /a calr = %cal%
if %calr% lss 0 echo Les d%e2%g%ac%ts de base doivent d%e2%passer 0. & goto ret15_1
if not "%calr%"=="%cal%" echo D%e2%g%ac%ts de base:%calr%
if %instat%==1 set /a wep0bas = calr & goto ret16
if %tempw%==0 set /a wep0basmod%mnd% = calr
if %tempw%==1 set /a wep%ct%bas = calr

:ret16
if %tempw%==0 set /a cal = wep0bonmod%mnd%
if %tempw%==1 set /a cal = wep%ct%bon
set /p "cal=Am%e2%lioration de d%e2%g%ac%ts (%cal%):"
if "%cal%"=="R" goto ret15_1
set /a calr = %cal%
if %calr% lss 0 echo L'am%e2%lioration de d%e2%g%ac%ts doit d%e2%passer 0. & goto ret16
if not "%calr%"=="%cal%" echo Am%e2%lioration de d%e2%g%ac%ts:%calr%
if %instat%==1 set /a wep0bon = calr & goto ret161
if %tempw%==0 set /a wep0bonmod%mnd% = calr
if %tempw%==1 set /a wep%ct%bon = calr

:ret161
if not %USERNAME%==%creator% if not exist "Statsz de %nom%".bat goto ret18
if %tempw%==0 set /a cal = wep0attmod%mnd%
if %tempw%==1 set /a cal = wep%ct%att
if %cal%==0 set rep=P
if %cal%==1 set rep=M
choice /c PMR /n /m "Attribut des d%e2%g%ac%ts (P-Physique / M-Magique) (%rep%):"
if %errorlevel%==3 goto ret16
if %instat%==1 if %errorlevel%==1 set /a wep0att = 0 & goto ret18
if %instat%==1 if %errorlevel%==2 set /a wep0att = 1 & goto ret18
if %tempw%==0 if %errorlevel%==1 set /a wep0attmod%mnd% = 0
if %tempw%==0 if %errorlevel%==2 set /a wep0attmod%mnd% = 1
if %tempw%==1 if %errorlevel%==1 set /a wep%ct%att = 0
if %tempw%==1 if %errorlevel%==2 set /a wep%ct%att = 1

:ret18
if %nbdonwp%==0 echo Auncun don d'arme disponible. & goto ret19
if %tempw%==0 set /a temp = wep0idonmod%mnd%
if %tempw%==1 set /a temp = wep%ct%idon
set chm=
set chm2=
set /a ct = 0
:ret18_01
set /a ct += 1
call :donwptemp
set chm=%chm%%ct%
set chm2=%chm2% / %ct%-%donwp%
if not %ct%==%nbdonwp% goto ret18_01
choice /c R0%chm% /n /m "Type d'arme (0-Aucun%chm2%) (%temp%):"
if %errorlevel%==1 goto ret16
set /a temp = %errorlevel%
set /a temp -= 2
if %instat%==1 set /a wep0idon = temp & goto ret19
if %tempw%==0 set /a wep0idonmod%mnd% = temp
if %tempw%==1 set /a wep%ct%idon = temp

:ret19
if %tempw%==1 goto ret19_2
set /a cal = inbonphymod%mnd%
if %cal%==0 set rep=N
if %cal%==1 set rep=O
choice /c ONR /n /m "Prendre en compte les bonus de niveau pour les attaques physiques ? (O/N) (%rep%):"
if %errorlevel%==3 goto ret16
if %instat%==1 if %errorlevel%==1 set /a inbonphy = 1 & set /a inprcphy = 1 & goto ret19_2
if %instat%==1 if %errorlevel%==2 set /a inbonphy = 0 & set /a inprcphy = 0 & goto ret19_2
if %errorlevel%==1 set /a inbonphymod%mnd% = 1 & set /a inprcphymod%mnd% = 1
if %errorlevel%==2 set /a inbonphymod%mnd% = 0 & set /a inprcphymod%mnd% = 0

:ret19_2
if %tempw%==0 set /a cal = wep0bontalmod%mnd%
if %tempw%==1 set /a cal = wep%ct%bontal
set /p "cal=Bonus secondaire de base en attaque physique (%cal%):"
if %tempw%==1 if "%cal%"=="R" goto ret16
if %lvl% gtr 29 if "%cal%"=="R" goto ret19
if "%cal%"=="R" goto ret16
set /a calr = %cal%
if %calr% lss 0 echo Ce bonus ne peut %ec%tre n%e2%gatif. & goto ret19_2
if not "%calr%"=="%cal%" echo Bonus secondaire de base en attaque physique:%calr%
if %instat%==1 set /a wep0bontal = calr & goto ret20end
if %tempw%==0 set /a wep0bontalmod%mnd% = calr
if %tempw%==1 set /a wep%ct%bontal = calr & goto ret20end

:ret20_1
set /a nb = 0
set /a wep0bas = wep0basmod%mnd%
set /a wep0bon = wep0bonmod%mnd%
set /a wep0idon = wep0idonmod%mnd%
set /a inbonphy = inbonphymod%mnd%
set /a wep0bontal = wep0bontalmod%mnd%
set /a inprcphy = inprcphymod%mnd%
set /a magatt = 0
goto ret20end

:ret20_2
set /a cal = inbonmagmod%mnd%
if %cal%==0 set rep=N
if %cal%==1 set rep=O
choice /c ONR /n /m "Prendre en compte les bonus de niveau pour la magie ? (O/N) (%rep%):"
if %errorlevel%==3 goto ret19_2
if %errorlevel%==1 set /a inbonmagmod%mnd% = 1 & set /a inprcmagmod%mnd% = 1
if %errorlevel%==2 set /a inbonmagmod%mnd% = 0 & set /a inprcmagmod%mnd% = 0

:ret20_22
set /a cal = magbontalmod%mnd%
set /p "cal=Bonus secondaire de base en magie (%cal%):"
if %lvl% gtr 29 if "%cal%"=="R" goto ret20_2
if "%cal%"=="R" goto ret16
set /a calr = %cal%
if %calr% lss 0 echo Ce bonus ne peut %ec%tre n%e2%gatif. & goto ret20_22
if not "%calr%"=="%cal%" echo Bonus secondaire de base en magie:%calr%
set /a magbontalmod%mnd% = calr
if not %USERNAME%==%creator% goto ret20end2

choice /c ONR /n /m "Faire un exemple de d%e2%g%ac%ts de sort ? (O/N):"
if %errorlevel%==2 goto ret20end2
if %errorlevel%==3 goto ret16
set /a magatt = 1
set /a inbonmag = inbonmagmod%mnd%
set /a magbontal = magbontalmod%mnd%
set /a inprcmag = inprcmagmod%mnd%

:ret20end
if %tempw%==1 set /a nb = ct
call :affminmax
choice /c ONR /n /m "Les d%e2%g%ac%ts sont corrects ? (O/N):"
if %errorlevel%==2 goto ret15_1
if %errorlevel%==3 goto ret20
if %tempw%==1 goto :eof
if %magatt%==0 echo D%e2%g%ac%ts de sort:& goto ret20_2
:ret20end2
if %instat%==1 goto fin
if %modif%==1 goto debmodif0
goto endmodif

:alwmulti
if %mnd%==0 echo Multiplication des stats de base.
if %mnd% gtr 0 echo Modification du mod %mnd% par multiplication des stats.
echo Si il s'agit d'un nombre sous forme d%e2%cimale, entrer le nombre sous forme de fraction avec un "/".
set /a ct = mnd
:alwmulti_st
call :foistemp
set cal=%temp040%
if "%cal%"=="" set cal=1
set /p "cal=Multiplication des stats (%cal%):"
if "%cal%"=="R" goto debmodif2
set /a calr = %cal%
if %calr% lss 1 echo La multplication doit d%e2%passer 0. & goto alwmulti_st
set foisstmod%mnd%=%cal%
:alwmulti_att
call :foistemp
set cal=%temp04%
if "%cal%"=="" set cal=1
set /p "cal=Multiplication des d%e2%g%ac%ts (%cal%):"
if "%cal%"=="R" goto alwmulti_st
set /a calr = %cal%
if %calr% lss 1 echo La multplication doit d%e2%passer 0. & goto alwmulti_att
set foisattmod%mnd%=%cal%
:alwmulti_vie
call :foistemp
set cal=%temp05%
if "%cal%"=="" set cal=1
set /p "cal=Multiplication de la vie (%cal%):"
if "%cal%"=="R" goto alwmulti
set /a calr = %cal%
if %calr% lss 1 echo La multplication doit d%e2%passer 0. & goto alwmulti_vie
set foisviemod%mnd%=%cal%
:alwmulti_mana
call :foistemp
set cal=%temp06%
if "%cal%"=="" set cal=1
set /p "cal=Multiplication de la mana (%cal%):"
if "%cal%"=="R" goto alwmulti_vie
set /a calr = %cal%
if %calr% lss 1 echo La multplication doit d%e2%passer 0. & goto alwmulti_mana
set foismanamod%mnd%=%cal%
:alwmulti_vig
call :foistemp
set cal=%temp061%
if "%cal%"=="" set cal=1
set /p "cal=Multiplication de la vigueur (%cal%):"
if "%cal%"=="R" goto alwmulti_mana
set /a calr = %cal%
if %calr% lss 1 echo La multplication doit d%e2%passer 0. & goto alwmulti_vig
set foisvigmod%mnd%=%cal%
:alwmulti_natar
call :foistemp
set cal=%temp07%
if "%cal%"=="" set cal=1
set /p "cal=Multiplication de l'armure naturelle (%cal%):"
if "%cal%"=="R" alwmulti_vig
set /a calr = %cal%
if %calr% lss 1 echo La multplication doit d%e2%passer 0. & goto alwmulti_natar
set foisnatarmod%mnd%=%cal%
:alwmulti_ar
call :foistemp
set cal=%temp08%
if "%cal%"=="" set cal=1
set /p "cal=Multiplication de l'armure (%cal%):"
if "%cal%"=="R" goto alwmulti_natar
set /a calr = %cal%
if %calr% lss 1 echo La multplication doit d%e2%passer 0. & goto alwmulti_ar
set foisarmod%mnd%=%cal%
:alwmulti_mag
call :foistemp
set cal=%temp09%
if "%cal%"=="" set cal=1
set /p "cal=Multiplication de la magie (%cal%):"
if "%cal%"=="R" goto alwmulti_ar
set /a calr = %cal%
if %calr% lss 1 echo La multplication doit d%e2%passer 0. & goto alwmulti_mag
set foismagmod%mnd%=%cal%
goto debmodif0

:colors
if %mnd%==0 echo Ajustement des couleures pour %nom%.
if %mnd% gtr 0 echo Ajustement des couleures pour le mod %mnd%.
set /a ct = mnd
call :colortemp
set temp=%temp010%
if "%temp%"=="" set temp=%basecolor%
echo 0 = Noir        8 = Gris
echo 1 = Bleu fonc%e2%  9 = Bleu clair
echo 2 = Vert        A = Vert clair
echo 3 = Bleu-gris   B = Cyan
echo 4 = Marron      C = Rouge
echo 5 = Pourpre     D = Rose
echo 6 = Kaki        E = Jaune
echo 7 = Gris clair  F = Blanc
:col
color %temp%
set colorval=
choice /c 0123456789ABCDEF /n /m "Couleure de fond:"
set /a col = %errorlevel%
call :colorsaj
choice /c 0123456789ABCDEF /n /m "Couleure d'%e2%criture:"
set /a col = %errorlevel%
color %colorval%
choice /c ONR /n /m "Les couleures sont bonnes ? (O/N):"
if %errorlevel%==2 goto col
if %errorlevel%==3 goto col
set colorvalmod%mnd%=%colorval%
goto debmodif0
:colorsaj
set /a col -= 1
if %col%==10 set col=A
if %col%==11 set col=B
if %col%==12 set col=C
if %col%==13 set col=D
if %col%==14 set col=E
if %col%==15 set col=F
set colorval=%colorval%%col%
goto :eof

:endmodif
set /a tempb0 = 1
call :setstatsl0
set /a tempb0 = 0
set /a vie = l1vie
set /a mana = l1mana
set /a vig = l1vig
set /a tempb = 1
call :rsattst
call :resetfois
call :save
call "Statsz de %nom%".bat
:endmodif_2
echo(
choice /c ONR /n /m "Ajouter d'autres fonctionnalit%e2%s %a0% %nom% ? (O/N):"
if %errorlevel%==2 exit
set /a basevieret = baseviemod0*(100+don5)/100
set /a basemanaret = (basemanamod0+cmpmana)*(100+donmana)/100
set /a basevigret = (basevigmod0+cmpvig)*(100+donvig)/100
goto createchar2

:adds
choice /c FTAJ /n /m "Ajouts %a0% %nom% (A-Armes secondaires / J-Jauges secondaires / T-Fatigue / F-Fin):"
if %errorlevel%==1 goto createchar2
if %errorlevel%==3 goto addweps
if %errorlevel%==4 goto addbars

:adds_ft
set /a cal = fatg
set /p "cal=Pourcentage de points de vie lors de la fatigue (%fatg%):"
if "%cal%"=="R" goto adds
set /a calr = %cal%
if %calr% lss 1 echo Le pourcentage de vie doit d%e2%passer 0. & goto adds_ft
if %calr% gtr 100 echo Le pourcentage de vie ne doit pas d%e2%passer 100. & goto adds_ft
set /a fatg = calr
goto adds

:addbars
echo Ajustement des jauges secondaires de %nom%.
echo Saisir "F" pour finir.
:addbars_num
if %nbrbars%==0 set chm=1& set chm2=& echo (1) Premi%e7%re jauge secondaire & goto addbars_num2
set /a afn = 1 & call :affbars
set /a ct = 0
set chm=
:addbars_numb
set /a ct += 1
set chm=%chm%%ct%
if not %ct%==%nbrbars% goto addbars_numb
set /a ct += 1
if %nbrbars% lss %mxnbrbars% set chm=%chm%%ct%& echo (%ct%) Nouvelle jauge secondaire
set chm2=
if %nbrbars% gtr 0 set chm2=S& echo Saisir "S" pour supprimer une jauge secondaire.
:addbars_num2
choice /c F%chm2%%chm% /n /m "N%nm% de l'arme secondaire:"
if %errorlevel%==1 goto adds
set /a ct = %errorlevel%
set /a ct -= 1
if %nbrbars% gtr 0 set /a ct -= 1
if %nbrbars% gtr 0 if %errorlevel%==2 goto addbars_del
if %ct% gtr %nbrbars% echo Cr%e2%ation de la jauge secondaire N%nm%%ct%.
:addbars_nom
call :barstemp
set temp=%bar%
if "%temp%"=="" set temp=Non d%e2%fini
set /p "bar=Nom de la jauge N%nm%%ct% (%temp%):"
if "%bar%"=="R" goto addbars_num2
if "%bar%"=="" goto addbars_nom
set bar%ct%=%bar%
:addbars_min
set /a cal = bar%ct%min
if %cal%==0 set rep=N
if %cal%==1 set rep=O
choice /c ONR /n /m "Bloquer %a0% 0 ? (O/N) (%rep%):"
if %errorlevel%==1 set /a bar%ct%min = 1
if %errorlevel%==2 set /a bar%ct%min = 0
if %errorlevel%==3 goto addbars_nom
:addsbar_max1
set /a cal = bar%ct%max
if %cal%==0 set rep=N
if %cal% gtr 0 set rep=O
choice /c ONR /n /m "Maximum de points pour %bar% ? (O/N) (%rep%):"
if %errorlevel%==2 set /a bar%ct%max = 0 & goto addsbar_pts
if %errorlevel%==3 goto addsbar_min
set /p "cal=Maximum (%cal%):"
set /a calr = %cal%
set /a cal = bar%ct%min
if %cal%==1 if %calr% lss 1 echo Le blocage %a0% 0 est actif, le maximum doit d%e2%passer 0. & goto addsbar_max1
set /a bar%ct%max = calr
:addsbar_max2
set /a cal = bar%ct%maxb
if %cal%==0 set rep=N
if %cal%==1 set rep=O
choice /c ONR /n /m "Bloquer au maximum ? (O/N) (%rep%):"
if %errorlevel%==1 set /a bar%ct%maxb = 1
if %errorlevel%==2 set /a bar%ct%maxb = 0
if %errorlevel%==3 goto addsbar_max1
:addsbar_pts
set /a cal = bar%ct%pts
if %ct% gtr %nbrbars% if %cal%==0 set /a cal = bar%ct%max
set /p "cal=Nombre de %bar% (%cal%):"
if "%cal%"=="R" goto addsbar_max2
set /a calr = %cal%
set /a temp = bar%ct%min
if %temp%==1 if %calr% lss 0 echo Le blocage %a0% 0 est actif, les points doivent d%e2%passer -1. & goto addsbar_pts
set /a temp = bar%ct%maxb
set /a temp2 = bar%ct%max
if %temp%==1 if %calr% gtr %temp2% echo La blocage au maximum est actif, les points ne doivent pas d%e2%passer le maximum %temp2%. & goto addsbar_pts
set /a bar%ct%pts = calr
:addsbar_arr
set /a cal = bar%ct%res
set /p "cal=Points de r%e2%sistance (%cal%):"
set /a calr = %cal%
if %calr% lss 0 echo La r%e2%sistance doit d%e2%passer -1. & goto addsbar_arr
set /a bar%ct%res = calr
:addsbar_aff
set temp=%bar%: 
set /a cal = bar%ct%min
if %cal%==1 set temp=%temp%/
set bar%ct%af1=%temp%
set temp=
if %cal%==1 set temp=/
set /a cal = bar%ct%max
if %cal% gtr 0 set temp=%temp% /
set /a cal = bar%ct%maxb
if %cal%==1 set temp=%temp%/
set /a cal = bar%ct%max
if %cal% gtr 0 set temp=%temp%%cal%
set /a cal = bar%ct%res
if %cal% gtr 0 set temp=%temp% -- R%e2%sistance: %cal%
set bar%ct%af2=%temp%
if %ct% gtr %nbrbars% echo Jauge secondaire cr%e2%%e2%e. & set /a nbrbars += 1 & goto addbars_num
echo Jauge secondaire modifi%e2%e.
goto addbars_num
:addbars_del
choice /c R%chm% /n /m "N%nm% de l'arme secondaire %a0% supprimer:"
if %errorlevel%==1 goto addbars_num2
set /a nb = %errorlevel%
set /a nb -= 1
echo Jauge secondaire supprim%e2%e.
if %ct%==%nbrbars% set bar%ct%=& set /a nbrbars -= 1 & goto addbars_num
set /a ct = nbrbars
call :barstemp
set bar%nb%=%bar%
set /a bar%nb%pts = temp
set /a bar%nb%min = temp2
set /a bar%nb%max = temp3
set /a bar%nb%maxb = temp4
set /a bar%nb%res = temp5
set /a nbrbars -= 1
goto addbars_num

:addweps
echo Ajustement des armes secondaires de %nom%.
echo Saisir "F" pour finir.
:addweps_num
if %nbrweps%==0 set chm=1& set chm2=& echo (1) Premi%e7%re arme secondaire & goto addweps_num2
set /a afn = 1 & call :affweps
set /a ct = 0
set chm=
:addweps_numb
set /a ct += 1
set chm=%chm%%ct%
if not %ct%==%nbrweps% goto addweps_numb
set /a ct += 1
if %nbrweps% lss %mxnbrweps% set chm=%chm%%ct%& echo (%ct%) Nouvelle arme secondaire
set chm2=
if %nbrweps% gtr 0 set chm2=S& echo Saisir "S" pour supprimer une arme secondaire.
:addweps_num2
choice /c F%chm2%%chm% /n /m "N%nm% de l'arme secondaire:"
if %errorlevel%==1 goto adds
set /a ct = %errorlevel%
set /a ct -= 1
if %nbrweps% gtr 0 set /a ct -= 1
if %nbrweps% gtr 0 if %errorlevel%==2 goto addweps_del
if %ct% gtr %nbrweps% echo Cr%e2%ation de l'arme secondaire N%nm%%ct%.
call :wepstemp
set temp=%wep%
if "%temp%"=="" set temp=Non d%e2%fini
:addweps_nom
set /p "wep=Nom de l'arme secondaire (%temp%):"
if "%wep%"=="R" goto addweps_num2
if "%wep%"=="" goto addweps_nom
set wep%ct%=%wep%
set /a tempw = 1 & call :ret15_1 & set /a tempw = 0
if %ct% gtr %nbrweps% set /a nbrweps += 1 & echo Arme secondaire cr%e2%e. & goto addweps_num
echo Arme secondaire modifi%e2%e.
goto addweps_num
:addweps_del
choice /c R%chm% /n /m "N%nm% de l'arme secondaire %a0% supprimer:"
if %errorlevel%==1 goto addweps_num2
set /a nb = %errorlevel%
set /a nb -= 1
echo Arme secondaire N%nm%%nb% supprim%e2%e.
if %nb%==%nbrweps% set wep%nb%=& set /a nbrweps -= 1 & goto addweps_num
set /a ct = nbrweps
call :wepstemp
set wep%nb%=%wep%
set wep%nb%aff=%wepaff%
set /a wep%nb%bas = wep%nbrweps%bas
set /a wep%nb%bon = wep%nbrweps%bon
set /a wep%nb%bontal = wep%nbrweps%bontal
set /a wep%nb%idon = wep%nbrweps%idon
set /a wep%nb%att = wep%nbrweps%att
set /a nbrweps -= 1
goto addweps_num


:save
if %clone%==1 goto :eof
echo Sauvegarde ...
(
 echo @echo off
 echo set stversion=%version%
 echo set nom=%nom%
 echo set /a lvl = %lvl%
 echo set /a vie = %vie%
 echo set /a mana = %mana%
 echo set /a vig = %vig%
 if %nbrmods% gtr 0 echo set /a nbrmods = %nbrmods%
 if %nbrmods% gtr 0 echo set /a mod = %mod%
 if %augmdesvie% gtr 0 echo set /a augmdesvie = %augmdesvie%
 if %augmbonvie% neq 0 echo set /a augmbonvie = %augmbonvie%
 if %augmdesmana% gtr 0 echo set /a augmdesmana = %augmdesmana%
 if %augmbonmana% neq 0 echo set /a augmbonmana = %augmbonmana%
 if %icmp% neq 3 echo set /a icmp = %icmp%
 if %idon% neq 4 echo set /a idon = %idon%
 if %cmpspe% neq 0 echo set /a cmpspe = %cmpspe%
 if %cmpint% neq 0 echo set /a cmpint = %cmpint%
 if %cmpmana% gtr 0 echo set /a cmpmana = %cmpmana%
 if %cmpvig% gtr 0 echo set /a cmpvig = %cmpvig%
 if %don1bon% gtr 0 echo set /a don1bon = %don1bon%
 if %don3% gtr 0 echo set /a don3 = %don3%
 if %don3bon% gtr 0 echo set /a don3bon = %don3bon%
 if %don4% gtr 0 echo set /a don4 = %don4%
 if %don5% gtr 0 echo set /a don5 = %don5%
 if %donmana% gtr 0 echo set /a donmana = %donmana%
 if %donvig% gtr 0 echo set /a donvig = %donvig%
 if %don6% gtr 0 echo set /a don6 = %don6%
 if not "%tpfoisatt%"=="1" echo set tpfoisatt=%tpfoisatt%
 if not "%tpfoismag%"=="1" echo set tpfoismag=%tpfoismag%
 if not "%tpfoismana%"=="1" echo set tpfoismana=%tpfoismana%
 if not "%tpfoisvig%"=="1" echo set tpfoisvig=%tpfoisvig%
 if %sha%==1 echo set /a sha = 1
 if %shn% gtr 0 echo set /a shn = %shn%
 if %fatg% neq 25 echo set /a fatg = %fatg%
 if %chtst%==1 echo set /a chtst = 1
 if %nbrdegsu% gtr 0 echo set /a nbrdegsu = %nbrdegsu%
 if %degsuphy% gtr 0 echo set /a degsuphy = %degsumag%
 if %degsumag% gtr 0 echo set /a degsumag = %degsuphy%
 if %degsupr% gtr 0 echo set /a degsupr = %degsupr%
 if %gtdeg1% gtr 0 echo set /a gtdeg1 = %gtdeg1%
 if %gtdeg2% gtr 0 echo set /a gtdeg2 = %gtdeg2%
 if %gtdeg3% gtr 0 echo set /a gtdeg3 = %gtdeg3%
 if %manaus% gtr 0 echo set /a manaus = %manaus%
 if %vigus% gtr 0 echo set /a vigus = %vigus%
 if %recup% gtr 0 echo set /a recup = %recup%
 if %soinin% gtr 0 echo set /a soinin = %soinin%
 if %nsavephy% gtr 0 echo set /a nsavephy = %nsavephy%
 if %nsavemag% gtr 0 echo set /a nsavemag = %nsavemag%
 if %nsavesor% gtr 0 echo set /a nsavesor = %nsavesor%
 if %nsavesoi% gtr 0 echo set /a nsavesoi = %nsavesoi%
 if %deginphy% gtr 0 echo set /a deginphy = %deginphy%
 if %deginmag% gtr 0 echo set /a deginmag = %deginmag%
 if %gtatt1% gtr 0 echo set /a gtatt1 = %gtatt1%
 if %gtatt2% gtr 0 echo set /a gtatt2 = %gtatt2%
 if %gtatt3% gtr 0 echo set /a gtatt3 = %gtatt3%
 if %gtatt31% gtr 0 echo set /a gtatt31 = %gtatt31%
 if %gtatt4% gtr 0 echo set /a gtatt4 = %gtatt4%
 if %nbrdeads% gtr 0 echo set /a nbrdeads = %nbrdeads%
 if %prcboss% neq 0 echo set /a prcboss = %prcboss%
 if %vsboss% neq 1 echo set /a vsboss = %vsboss%
)>"Statsz de %nom%".bat
if %modif%==0 if %instat%==0 goto save_002e
if %chtst%==0 goto save_002e
set /a ct = 0
:save_001b
set /a ct += 1
set /a ct2 = 0
:save_002b
set /a ct2 += 1
set /a temp1 = reu%ct2%
set /a temp2 = ech%ct2%
set /a temp3 = crtreu%ct2%
set /a temp4 = crtech%ct2%
(
 if %ct%==1 if %temp1% gtr 0 echo set /a reu%ct2% = %temp1%
 if %ct%==2 if %temp2% gtr 0 echo set /a ech%ct2% = %temp2%
 if %ct%==3 if %temp3% gtr 0 echo set /a crtreu%ct2% = %temp3%
 if %ct%==4 if %temp4% gtr 0 echo set /a crtech%ct2% = %temp4%
)>>"Statsz de %nom%".bat
if not %ct2%==7 goto save_002b
if not %ct%==4 goto save_001b
:save_002e
if %nbdonwp%==0 goto save_001
(
 echo set /a nbdonwp = %nbdonwp%
)>>"Statsz de %nom%".bat
set /a ct = 0
:save_0b
set /a ct += 1
call :donwptemp
(
 echo set donwp%ct%=%donwp%
 if %temp1% gtr 0 echo set /a donwp%ct%pr = %temp1%
 if %temp2% gtr 0 echo set /a donwp%ct%sp = %temp2%
)>>"Statsz de %nom%".bat
if not %ct%==%nbdonwp% goto save_0b
:save_001
if %nbrbars%==0 goto save_02
(
 echo set /a nbrbars = %nbrbars%
)>>"Statsz de %nom%".bat
set /a ct = 0
:save_01b
set /a ct += 1
call :barstemp
(
 echo set bar%ct%=%bar%
 echo set bar%ct%af1=%baraf1%
 echo set bar%ct%af2=%baraf2%
 echo set /a bar%ct%pts = %temp1%
 if %temp2%==1 echo set /a bar%ct%min = 1
 if %temp3% gtr 0 echo set /a bar%ct%max = %temp3%
 if %temp4%==1 echo set /a bar%ct%maxb = 1
 if %temp5% gtr 0 echo set /a bar%ct%res = %temp5%
)>>"Statsz de %nom%".bat
if not %ct%==%nbrbars% goto save_01b
:save_02
if %nbrweps%==0 goto save_03
(
 if %nbrweps% gtr 0 echo set /a nbrweps = %nbrweps%
)>>"Statsz de %nom%".bat
set /a ct = 0
:save_02b
set /a ct += 1
call :wepstemp
set /a temp3 = wep%ct%bontal
set /a temp5 = wep%ct%idon
set /a temp6 = wep%ct%att
(
 echo set wep%ct%=%wep%
 if %temp1% neq 0 echo set /a wep%ct%bas = %temp1%
 if %temp2% neq 0 echo set /a wep%ct%bon = %temp2%
 if %temp3% gtr 0 echo set /a wep%ct%bontal = %temp3%
 if %temp5% gtr 0 echo set /a wep%ct%idon = %temp5%
 if %temp6%==1 echo set /a wep%ct%att = 1
)>>"Statsz de %nom%".bat
if not %ct%==%nbrweps% goto save_02b
:save_03
set /a ct = -1
:save_03b
set /a ct += 1
call :modstemp
(
 if %ct% gtr 0 echo set namemod%ct%=%namemod%
 if %temp01%==1 echo set /a nodeadmod%ct% = 1
 if %temp02%==1 echo set /a regenviemod%ct% = 1
 if %temp03%==1 echo set /a regenmanamod%ct% = 1
 if %temp031%==1 echo set /a regenvigmod%ct% = 1
 if %temp041%==1 echo set /a shadmod%ct% = 1
 if %temp042% gtr 0 echo set /a shnbmod%ct% = %temp042%
 if not "%temp010%"=="" echo set colorvalmod%ct%=%temp010%
 if not "%temp040%"=="" if not "%temp040%"=="1" echo set foisstmod%ct%=%temp040%
 if not "%temp04%"=="" if not "%temp04%"=="1" echo set foisattmod%ct%=%temp04%
 if not "%temp05%"=="" if not "%temp05%"=="1" echo set foisviemod%ct%=%temp05%
 if not "%temp06%"=="" if not "%temp06%"=="1" echo set foismanamod%ct%=%temp06%
 if not "%temp061%"=="" if not "%temp061%"=="1" echo set foisvigmod%ct%=%temp061%
 if not "%temp07%"=="" if not "%temp07%"=="1" echo set foisnatarmod%ct%=%temp07%
 if not "%temp08%"=="" if not "%temp08%"=="1" echo set foisarmod%ct%=%temp08%
 if not "%temp09%"=="" if not "%temp09%"=="1" echo set foismagmod%ct%=%temp09%
 echo set /a phystatmod%ct% = %temp1%
 echo set /a socstatmod%ct% = %temp2%
 echo set /a menstatmod%ct% = %temp3%
 echo set /a baseviemod%ct% = %temp4%
 echo set /a basemanamod%ct% = %temp5%
 echo set /a basevigmod%ct% = %temp51%
 echo set /a natarmurephymod%ct% = %temp6%
 echo set /a natarmuremagmod%ct% = %temp7%
 echo set /a armurephymod%ct% = %temp8%
 echo set /a armuremagmod%ct% = %temp9%
 if %temp10% gtr 0 echo set /a wep0basmod%ct% = %temp10%
 echo set /a wep0bonmod%ct% = %temp11%
 if %temp120%==1 echo set /a wep0attmod%ct% = %temp120%
 if %temp12% gtr 0 echo set /a wep0idonmod%ct% = %temp12%
 if %temp130%==1 echo set /a inbonphymod%ct% = %temp130%
 if %temp13% gtr 0 echo set /a wep0bontalmod%ct% = %temp13%
 if %temp14%==1 echo set /a inprcphymod%ct% = %temp14%
 if %temp150%==1 echo set /a inbonmagmod%ct% = %temp150%
 if %temp15% gtr 0 echo set /a magbontalmod%ct% = %temp15%
 if %temp16%==1 echo set /a inprcmagmod%ct% = %temp16%
)>>"Statsz de %nom%".bat
if not %ct%==%nbrmods% goto save_03b
:save_04
set /a ct = 0
call :modstemp
(
 echo :DEF
 echo set affnom=%nom%
 if not "%colorvalmod0%"=="" echo set colorval=%colorvalmod0%
 if %temp042% gtr 0 echo set /a shnb = %temp042%
 if not "%temp040%"=="" if not "%temp040%"=="1" echo set foisst=%temp040%
 if not "%temp04%"=="" if not "%temp04%"=="1" echo set foisatt=%temp04%
 if not "%temp05%"=="" if not "%temp05%"=="1" echo set foisvie=%temp05%
 if not "%temp06%"=="" if not "%temp06%"=="1" echo set foismana=%temp06%
 if not "%temp061%"=="" if not "%temp061%"=="1" echo set foisvig=%temp061%
 if not "%temp07%"=="" if not "%temp07%"=="1" echo set foisnatar=%temp07%
 if not "%temp08%"=="" if not "%temp08%"=="1" echo set foisar=%temp08%
 if not "%temp09%"=="" if not "%temp09%"=="1" echo set foismag=%temp09%
 echo set /a phystat = %temp1%
 echo set /a socstat = %temp2%
 echo set /a menstat = %temp3%
 echo set /a basevie = %temp4%
 echo set /a basemana = %temp5%
 echo set /a basevig = %temp51%
 echo set /a natarmurephy = %temp6%
 echo set /a natarmuremag = %temp7%
 echo set /a armurephy = %temp8%
 echo set /a armuremag = %temp9%
 if %temp10% gtr 0 echo set /a wep0bas = %temp10%
 echo set /a wep0bon = %temp11%
 if %temp120%==1 echo set /a wep0att = %temp120%
 if %temp12% gtr 0 echo set /a wep0idon = %temp12%
 if %temp130%==1 echo set /a inbonphy = %temp130%
 if %temp13% gtr 0 echo set /a wep0bontal = %temp13%
 if %temp14%==1 echo set /a inprcphy = %temp14%
 if %temp150%==1 echo set /a inbonmag = %temp150%
 if %temp15% gtr 0 echo set /a magbontal = %temp15%
 if %temp16%==1 echo set /a inprcmag = %temp16%
)>>"Statsz de %nom%".bat
if %nbrmods%==0 goto save_06
(
 echo if %%mod%%==0 goto end
)>>"Statsz de %nom%".bat
if %nbrmods%==1 goto save_05
set /a ct = 1
:save_04b1
set /a ct += 1
(
 echo if %%mod%%==%ct% goto :MOD%ct%
)>>"Statsz de %nom%".bat
if not %ct%==%nbrmods% goto save_04b1
:save_05
set /a ct = 0
:save_05b
set /a ct += 1
(
 if %ct% gtr 1 echo goto end
 if %nbrmods% gtr 1 if %ct% gtr 1 echo :MOD%ct%
)>>"Statsz de %nom%".bat
call :modstemp
set /a cal = shnbmod0
(
 echo set affnom=%nom% %namemod%
 if not "%temp010%"=="" echo set colorval=%temp010%
 if %temp042% neq %cal% echo set /a shnb = %temp042%
 if not "%temp040%"=="" if not "%temp040%"=="1" echo set foisst=%temp040%
 if not "%temp04%"=="" if not "%temp04%"=="1" echo set foisatt=%temp04%
 if not "%temp05%"=="" if not "%temp05%"=="1" echo set foisvie=%temp05%
 if not "%temp06%"=="" if not "%temp06%"=="1" echo set foismana=%temp06%
 if not "%temp061%"=="" if not "%temp061%"=="1" echo set foisvig=%temp061%
 if not "%temp07%"=="" if not "%temp07%"=="1" echo set foisnatar=%temp07%
 if not "%temp08%"=="" if not "%temp08%"=="1" echo set foisar=%temp08%
 if not "%temp09%"=="" if not "%temp09%"=="1" echo set foismag=%temp09%
 if %temp1% neq %phystatmod0% echo set /a phystat = %temp1%
 if %temp2% neq %socstatmod0% echo set /a socstat = %temp2%
 if %temp3% neq %menstatmod0% echo set /a menstat = %temp3%
 if %temp4% neq %baseviemod0% echo set /a basevie = %temp4%
 if %temp5% neq %basemanamod0% echo set /a basemana = %temp5%
 if %temp51% neq %basevigmod0% echo set /a basevig = %temp51%
 if %temp6% neq %natarmurephymod0% echo set /a natarmurephy = %temp6%
 if %temp7% neq %natarmuremagmod0% echo set /a natarmuremag = %temp7%
 if %temp8% neq %armurephymod0% echo set /a armurephy = %temp8%
 if %temp9% neq %armuremagmod0% echo set /a armuremag = %temp9%
)>>"Statsz de %nom%".bat
set /a cal1 = wep0basmod0
set /a cal2 = wep0attmod0
set /a cal3 = wep0idonmod0
set /a cal4 = inbonphymod0
set /a cal5 = wep0bontalmod0
set /a cal6 = inprcphymod0
set /a cal7 = inbonmagmod0
set /a cal8 = magbontalmod0
set /a cal9 = inprcmagmod0
(
 if %temp10% neq %cal1% echo set /a wep0bas = %temp10%
 if %temp11% neq %wep0bonmod0% echo set /a wep0bon = %temp11%
 if %temp120% neq %cal2% echo set /a wep0att = %temp120%
 if %temp12% neq %cal3% echo set /a wep0idon = %temp12%
 if %temp130% neq %cal4% echo set /a inbonphy = %temp130%
 if %temp13% neq %cal5% echo set /a wep0bontal = %temp13%
 if %temp14% neq %cal6% echo set /a inprcphy = %temp14%
 if %temp150% neq %cal7% echo set /a inbonmag = %temp150%
 if %temp15% neq %cal8% echo set /a magbontal = %temp15%
 if %temp16% neq %cal9% echo set /a inprcmag = %temp16%
)>>"Statsz de %nom%".bat
if not %ct%==%nbrmods% goto save_05b
:save_06
(
 if %nbrmods% gtr 0 echo :end
 echo call StatsGenerator.bat
 echo     GOTO DEF
)>>"Statsz de %nom%".bat
goto :eof


:createwebpage
echo Exportation vers le serveur Web (%serverplc%) ...
(
echo ^<?php
echo $l3basevie = %l3basevie%;
echo $l3basemana = %l3basemana%;
echo $l3vig = %l3vig%;
echo $min = %min%;
echo $moy = %moy%;
echo $max = %max%;
echo $phystatmod0 = %phystatmod0%;
echo $menstatmod0 = %menstatmod0%;
echo $socstatmod0 = %socstatmod0%;
echo $lvl = %lvl%;
echo $augmdesvie = %augmdesvie%;
echo $augmbonvie = %augmbonvie%;
echo $augmdesmana = %augmdesmana%;
echo $augmbonmana = %augmbonmana%;
echo $basevigmod0 = %basevigmod0%;
)>"%serverplc%\persos\stats\Stats%nom%".php


if %nbrmods%==0 goto crwbmd2f
(
echo $nbrmods = %nbrmods%;
)>>"%serverplc%\persos\stats\Stats%nom%".php
set /a ct = 0
:crwbmd2b
set /a ct += 1
call :modstemp
set /a cal1 = phystatmod0
set /a cal2 = socstatmod0
set /a cal3 = menstatmod0
set /a cal4 = basevigmod0
set /a cal5 = natarmurephymod0
set /a cal6 = natarmuremagmod0
set /a cal7 = armurephymod0
set /a cal8 = armuremagmod0
set /a cal9 = wep0basmod0
set /a cal10 = wep0bonmod0

set /a temp21 = temp1
set /a temp22 = temp2
set /a cal = wep0idonmod0
set /a nb = ct
set /a ct = wep0idonmod0
call :donwptemp
set /a ct = nb
set /a cal11 = wep0bontalmod0
set /a cal12 = magbontalmod0

(
if %temp21% neq %cal1% echo $mod%ct%phy = %temp21%;
if %temp22% neq %cal2% echo $mod%ct%soc = %temp22%;
if %temp3% neq %cal3% echo $mod%ct%men = %temp3%;
if %temp51% neq %cal4% echo $mod%ct%vig = %temp51%;
if %temp6% neq %cal5% echo $mod%ct%arnatphy = %temp6%;
if %temp7% neq %cal6% echo $mod%ct%arnatmag = %temp7%;
if %temp8% neq %cal7% echo $mod%ct%arphy = %temp8%;
if %temp9% neq %cal8% echo $mod%ct%armag = %temp9%;
if %temp10% neq %cal9% echo $mod%ct%dg1 = %temp10%;$mod%ct%dg2 = %temp11%;
if %temp11% neq %cal10% echo $mod%ct%dg1 = %temp10%;$mod%ct%dg2 = %temp11%;

if %temp12% neq %cal% echo $mod%ct%spe = %temp12%;

if %temp13% neq %cal11% echo $mod%ct%bonphy = %temp13%;
if %temp15% neq %cal12% echo $mod%ct%bonmag = %temp15%;
if not "%temp040%"=="" if not "%temp040%"=="1" echo $mod%ct%must = %temp040%;
if not "%temp04%"=="" if not "%temp04%"=="1" echo $mod%ct%mudg = %temp04%;
if not "%temp05%"=="" if not "%temp05%"=="1" echo $mod%ct%muvie = %temp05%;
if not "%temp06%"=="" if not "%temp06%"=="1" echo $mod%ct%mumana = %temp06%;
if not "%temp061%"=="" if not "%temp061%"=="1" echo $mod%ct%muvig = %temp061%;
if not "%temp07%"=="" if not "%temp07%"=="1" echo $mod%ct%munatar = %temp07%;
if not "%temp08%"=="" if not "%temp08%"=="1" echo $mod%ct%muar = %temp08%;
if not "%temp09%"=="" if not "%temp09%"=="1" echo $mod%ct%mudgmag = %temp09%;

)>>"%serverplc%\persos\stats\Stats%nom%".php
if not %ct%==%nbrmods% goto crwbmd2b
:crwbmd2f
set /a cal = wep0idonmod0
set /a cal3 = wep0bontalmod0
set /a cal4 = magbontalmod0
(
 if %cmpmana% gtr 0 echo $cmpmana = %cmpmana%;
 if %cmpvig% gtr 0 echo $cmpvig = %cmpvig%;
 if %nbdonwp% gtr 0 echo $nbdonwp = %nbdonwp%; & set /a afn = 2 & call :affdonwp
 if %don3% gtr 0 echo $don3 = %don3%;
 if %don4% gtr 0 echo $don4 = %don4%;
 if %don5% gtr 0 echo $don5 = %don5%;
 if %don6% gtr 0 echo $don6 = %don6%;
 if %donmana% gtr 0 echo $donmana = %donmana%;
 if %donvig% gtr 0 echo $donvig = %donvig%;
 if %cal3% gtr 0 echo $wep0bontalmod0 = %wep0bontalmod0%;
 if %cal4% gtr 0 echo $magbontalmod0 = %magbontalmod0%;

echo $natarmurephymod0 = %natarmurephymod0%;
echo $natarmuremagmod0 = %natarmuremagmod0%;
echo $armurephymod0 = %armurephymod0%;
echo $armuremagmod0 = %armuremagmod0%;

echo $wep0basmod0 = %wep0basmod0%;
echo $wep0bonmod0 = %wep0bonmod0%;

if %nbrweps% gtr 0 echo $nbrweps = %nbrweps%; & set /a afn = 2 & call :affweps

rem HERE !!!
rem if %nbrbars% gtr 0 echo $nbrbars = %nbrbars%; & set /a afn = 2 & call :affbars

)>>"%serverplc%\persos\stats\Stats%nom%".php
set /a clfc = 1 & call :infoforweb & set /a clfc = 0
(

if %temp1% gtr 0 echo $reu = %temp1%;
if %temp2% gtr 0 echo $ech = %temp2%;
if %temp3% gtr 0 echo $crtreu = %temp3%;
if %temp4% gtr 0 echo $crtech = %temp4%;



echo ?^>
)>>"%serverplc%\persos\stats\Stats%nom%".php
echo Exportation termin%e2%e.
if %cdm%==4 exit
goto :eof


:modstemp
call :namemodtemp
set /a temp01 = nodeadmod%ct%
set /a temp02 = regenviemod%ct%
set /a temp03 = regenmanamod%ct%
set /a temp031 = regenvigmod%ct%
set /a temp041 = shadmod%ct%
set /a temp042 = shnbmod%ct%
call :foistemp
call :colortemp
set /a temp1 = phystatmod%ct%
set /a temp2 = socstatmod%ct%
set /a temp3 = menstatmod%ct%
set /a temp4 = baseviemod%ct%
set /a temp5 = basemanamod%ct%
set /a temp51 = basevigmod%ct%
set /a temp6 = natarmurephymod%ct%
set /a temp7 = natarmuremagmod%ct%
set /a temp8 = armurephymod%ct%
set /a temp9 = armuremagmod%ct%
set /a temp10 = wep0basmod%ct%
set /a temp11 = wep0bonmod%ct%
set /a temp120 = wep0attmod%ct%
set /a temp12 = wep0idonmod%ct%
set /a temp130 = inbonphymod%ct%
set /a temp13 = wep0bontalmod%ct%
set /a temp14 = inprcphymod%ct%
set /a temp150 = inbonmagmod%ct%
set /a temp15 = magbontalmod%ct%
set /a temp16 = inprcmagmod%ct%
goto :eof
:namemodtemp
if %ct%==1 set namemod=%namemod1%
if %ct%==2 set namemod=%namemod2%
if %ct%==3 set namemod=%namemod3%
if %ct%==4 set namemod=%namemod4%
if %ct%==5 set namemod=%namemod5%
goto :eof
:foistemp
if %ct%==0 set temp040=%foisstmod0%
if %ct%==1 set temp040=%foisstmod1%
if %ct%==2 set temp040=%foisstmod2%
if %ct%==3 set temp040=%foisstmod3%
if %ct%==4 set temp040=%foisstmod4%
if %ct%==5 set temp040=%foisstmod5%
if %ct%==0 set temp04=%foisattmod0%
if %ct%==1 set temp04=%foisattmod1%
if %ct%==2 set temp04=%foisattmod2%
if %ct%==3 set temp04=%foisattmod3%
if %ct%==4 set temp04=%foisattmod4%
if %ct%==5 set temp04=%foisattmod5%
if %ct%==0 set temp05=%foisviemod0%
if %ct%==1 set temp05=%foisviemod1%
if %ct%==2 set temp05=%foisviemod2%
if %ct%==3 set temp05=%foisviemod3%
if %ct%==4 set temp05=%foisviemod4%
if %ct%==5 set temp05=%foisviemod5%
if %ct%==0 set temp06=%foismanamod0%
if %ct%==1 set temp06=%foismanamod1%
if %ct%==2 set temp06=%foismanamod2%
if %ct%==3 set temp06=%foismanamod3%
if %ct%==6 set temp06=%foismanamod4%
if %ct%==6 set temp06=%foismanamod5%
if %ct%==0 set temp061=%foisvigmod0%
if %ct%==1 set temp061=%foisvigmod1%
if %ct%==2 set temp061=%foisvigmod2%
if %ct%==3 set temp061=%foisvigmod3%
if %ct%==6 set temp061=%foisvigmod4%
if %ct%==6 set temp061=%foisvigmod5%
if %ct%==0 set temp07=%foisnatarmod0%
if %ct%==1 set temp07=%foisnatarmod1%
if %ct%==2 set temp07=%foisnatarmod2%
if %ct%==3 set temp07=%foisnatarmod3%
if %ct%==7 set temp07=%foisnatarmod4%
if %ct%==5 set temp07=%foisnatarmod5%
if %ct%==0 set temp08=%foisarmod0%
if %ct%==1 set temp08=%foisarmod1%
if %ct%==2 set temp08=%foisarmod2%
if %ct%==3 set temp08=%foisarmod3%
if %ct%==4 set temp08=%foisarmod4%
if %ct%==5 set temp08=%foisarmod5%
if %ct%==0 set temp09=%foismagmod0%
if %ct%==1 set temp09=%foismagmod1%
if %ct%==2 set temp09=%foismagmod2%
if %ct%==3 set temp09=%foismagmod3%
if %ct%==4 set temp09=%foismagmod4%
if %ct%==5 set temp09=%foismagmod5%
goto :eof
:colortemp
if %ct%==0 set temp010=%colorvalmod0%
if %ct%==1 set temp010=%colorvalmod1%
if %ct%==2 set temp010=%colorvalmod2%
if %ct%==3 set temp010=%colorvalmod3%
if %ct%==4 set temp010=%colorvalmod4%
if %ct%==5 set temp010=%colorvalmod5%
goto :eof

:affminmax
set /a prcvie = 100
set /a tempaff = 1
set /a ct = 0
:affminmaxb
set /a ct += 1
if %ct%==1 set /a att = 1
if %ct%==2 set /a att = 50
if %ct%==3 set /a att = 100
if %magatt%==0 call :attdegs
if %magatt%==1 call :attmagbas
if %ct%==1 set /a min = nbdeg
if %ct%==2 set /a moy = nbdeg
if %ct%==3 set /a max = nbdeg
if not %ct%==3 goto affminmaxb
set /a tempaff = 0
if %afn%==0 echo Apog%e2%e: %min% ; %moy% ; %max%
set /a afn = 0
goto :eof

:affbars
set /a ct = 0
:affbarsb
set /a ct += 1
call :barstemp
if not "%bar%"=="" if %afn%==0 echo %baraf1%%temp1%%baraf2%
if not "%bar%"=="" if %afn%==1 echo (%ct%) %baraf1%%temp1%%baraf2%
if not "%bar%"=="" if %afn%==2 echo $bar%ct%pts = %temp1%;
if not "%bar%"=="" if %afn%==2 if %temp3% gtr 0 echo $bar%ct%max = %temp3%;
if not %ct%==%nbrbars% goto affbarsb
set /a afn = 0
goto :eof

:barstemp
if %ct%==1 set bar=%bar1%& set baraf1=%bar1af1%& set baraf2=%bar1af2%
if %ct%==2 set bar=%bar2%& set baraf1=%bar2af1%& set baraf2=%bar2af2%
if %ct%==3 set bar=%bar3%& set baraf1=%bar3af1%& set baraf2=%bar3af2%
if %ct%==4 set bar=%bar4%& set baraf1=%bar4af1%& set baraf2=%bar4af2%
if %ct%==5 set bar=%bar5%& set baraf1=%bar5af1%& set baraf2=%bar5af2%
if %ct%==6 set bar=%bar6%& set baraf1=%bar6af1%& set baraf2=%bar6af2%
if %ct%==7 set bar=%bar7%& set baraf1=%bar7af1%& set baraf2=%bar7af2%
if %ct%==8 set bar=%bar8%& set baraf1=%bar8af1%& set baraf2=%bar8af2%
if %ct%==9 set bar=%bar9%& set baraf1=%bar9af1%& set baraf2=%bar9af2%
set /a temp1 = bar%ct%pts
set /a temp2 = bar%ct%min
set /a temp3 = bar%ct%max
set /a temp4 = bar%ct%maxb
set /a temp5 = bar%ct%res
goto :eof

:affweps
set /a ct = 0
:affwepsb
set /a ct += 1
call :wepstemp
if not "%wep%"=="" if %afn%==0 echo %wep%: %temp1%+%temp2%
if not "%wep%"=="" if %afn%==1 echo (%ct%) %wep%: %temp1%+%temp2%
if not "%wep%"=="" if %afn%==2 echo $wpscb%ct% = %temp1%;
if not "%wep%"=="" if %afn%==2 echo $wpsca%ct% = %temp2%;
if not %ct%==%nbrweps% goto affwepsb
set /a afn = 0
goto :eof

:wepstemp
if %ct%==1 set wep=%wep1%
if %ct%==2 set wep=%wep2%
if %ct%==3 set wep=%wep3%
if %ct%==4 set wep=%wep4%
if %ct%==5 set wep=%wep5%
if %ct%==6 set wep=%wep6%
if %ct%==7 set wep=%wep7%
if %ct%==8 set wep=%wep8%
if %ct%==9 set wep=%wep9%
set /a temp1 = wep%ct%bas
set /a temp2 = wep%ct%bon
goto :eof

:affdonwp
set /a ct = 0
:affdonwpb
set /a ct += 1
call :donwptemp
if %afn%==0 if %temp1% gtr 0 echo Arme de pr%e2%dilection: %donwp% +%temp1%%%
if %afn%==0 if %temp2% gtr 0 echo Sp%e2%cialisation martialle: %donwp% +%temp2%%%
if %afn%==1 if %temp1% gtr 0 echo -Arme de prédilection: %donwp% +%temp1%%%
if %afn%==1 if %temp2% gtr 0 echo -Spécialisation martialle: %donwp% +%temp2%%%
rem if %afn%==2 echo $donwp%ct% = "%donwp%";
if %afn%==2 if %temp1% gtr 0 echo $pre%ct% = %temp1%;
if %afn%==2 if %temp2% gtr 0 echo $spe%ct% = %temp2%;


set /a cal = wep0idonmod0
set /a cal2 = ct -1
if %afn%==3 if %ct%==%cal% echo $weapon = %cal2%;


if not %ct%==%nbdonwp% goto affdonwpb
set /a afn = 0
goto :eof

:donwptemp
if %ct%==1 set donwp=%donwp1%
if %ct%==2 set donwp=%donwp2%
if %ct%==3 set donwp=%donwp3%
if %ct%==4 set donwp=%donwp4%
if %ct%==5 set donwp=%donwp5%
set /a temp1 = donwp%ct%pr
set /a temp2 = donwp%ct%sp
goto :eof

:rsattst
set wep0bas=
set wep0att=
set wep0idon=
set inbonphy=
set wep0bontal=
set inprcphy=
set inbonmag=
set magbontal=
set inprcmag=
goto :eof

:resetfois
set foisst=1
set foisatt=1
set foisvie=1
set foismana=1
set foisvig=1
set foisnatar=1
set foisar=1
set foismag=1
goto :eof