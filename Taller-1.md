## 1. Creo los dos archivos txt:

	notepad uno.txt
	notepad dos.txt

PS C:\Users\Nelson L> type .\uno.txt
Myfiles, name, property
channel

PS C:\Users\Nelson L> type .\dos.txt
file
channel

Comparo los dos archivos con el comando diff
	Compare-Object (Get-Content uno.txt) -DifferenceObject (Get-Content dos.txt)

Resultado:

InputObject            	  | SideIndicator
--------------------------|-------------------   
file                      | =>           
Myfiles, name, property   | <=           
channel                   | <=  


## 2. 

PS C:\Users\Nelson L> Get-Service | Export-Csv servicios.csv | Out-File 
Out-File : Cannot process argument because the value of argument "path" is null. Change the value 
of argument "path" to a non-null value.
At line:1 char:42
+ Get-Service | Export-Csv servicios.csv | Out-File
     CategoryInfo          : InvalidArgument: (:) [Out-File], PSArgumentNullException
     FullyQualifiedErrorId : ArgumentNull,Microsoft.PowerShell.Commands.OutFileCommand

##### Lo que ocurre es que el comaando out-file requiere de un parametro que indique la ruta del archivo en donde se mostrara el archivo inicial .csv


## 3.

##### Get-Process | export-csv prueba.csv -Delimiter ";"


## 4. 
El comando Set-ItemProperty mio.txt -name IsReadOnly -value $true coloca el archivo especificado en modo read only, por
tanto no se puede sobreescribir. Aunque existe un parametro especifico que impide que el archivo especificado pueda sobreescribirse (-NoClobber): 
Get-Process | Out-File -FilePath .\ejer1.txt -NoClobber

El parametro que permite que el comando pregunte antes de sobreescribir es -confirm
Ejemplo: Get-content .\uno.txt | Set-Content .\dos.txt -Confirm

## 5. 

Get-Process |Export-Csv prueba.csv -Delimiter ((Get-Culture).TextInfo.ListSeparator)

## 6. 
get-random

## 7. 
get-date

## 8. 

El cmdlet get-date produce un objeto de tipo DateTime

## 9. 
Get-Date | Select-Object -Property DayOfWeek

## 10.
Get-HotFix

## 11. Lista de parches instalados:

Source        Description      HotFixID      InstalledBy          InstalledOn        
------        -----------      --------      -----------          -----------        
DESKTOP-SJ... Update           KB4534131     AUTORIDADE NT\SIS... 2/12/2020 12:00:...
DESKTOP-SJ... Update           KB4465065     AUTORIDADE NT\SIS... 6/30/2019 12:00:...
DESKTOP-SJ... Security Update  KB4470788     AUTORIDADE NT\SIS... 1/28/2019 12:00:...
DESKTOP-SJ... Update           KB4480056     AUTORIDADE NT\SIS... 1/29/2019 12:00:...
DESKTOP-SJ... Update           KB4486153     AUTORIDADE NT\SIS... 9/13/2019 12:00:...
DESKTOP-SJ... Update           KB4486172     AUTORIDADE NT\SIS... 10/5/2019 12:00:...
DESKTOP-SJ... Security Update  KB4493510     AUTORIDADE NT\SIS... 4/11/2019 12:00:...
DESKTOP-SJ... Security Update  KB4499728     AUTORIDADE NT\SIS... 5/17/2019 12:00:...
DESKTOP-SJ... Security Update  KB4504369     AUTORIDADE NT\SIS... 6/14/2019 12:00:...
DESKTOP-SJ... Security Update  KB4509095     AUTORIDADE NT\SIS... 7/17/2019 12:00:...
DESKTOP-SJ... Security Update  KB4512577     AUTORIDADE NT\SIS... 9/11/2019 12:00:...
DESKTOP-SJ... Security Update  KB4512937     AUTORIDADE NT\SIS... 8/15/2019 12:00:...
DESKTOP-SJ... Security Update  KB4516115     AUTORIDADE NT\SIS... 9/12/2019 12:00:...
DESKTOP-SJ... Security Update  KB4521862     AUTORIDADE NT\SIS... 10/9/2019 12:00:...
DESKTOP-SJ... Security Update  KB4523204     AUTORIDADE NT\SIS... 11/13/2019 12:00...
DESKTOP-SJ... Security Update  KB4537759     AUTORIDADE NT\SIS... 2/12/2020 12:00:...
DESKTOP-SJ... Security Update  KB4532691     AUTORIDADE NT\SIS... 2/12/2020 12:00:...


##### Comando para ordenar la lista por fecha de instalacion y que solo muestre la fecha de instalacion
##### el usuario que instalo el parche y el ID del parche.

Get-HotFix | Select-Object -Property InstalledOn, InstalledBy, HotfixID | Sort-Object -Property InstalledOn


InstalledOn           | InstalledBy          | HotfixID 
-----------	      |------------	     |-----------
1/28/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4470788
1/29/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4480056
4/11/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4493510
5/17/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4499728
6/14/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4504369
6/30/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4465065
7/17/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4509095
8/15/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4512937
9/11/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4512577
9/12/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4516115
9/13/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4486153
10/5/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4486172
10/9/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4521862
11/13/2019 12:00:00 AM| AUTORIDADE NT\SISTEMA| KB4523204
2/12/2020 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4534131
2/12/2020 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4537759
2/12/2020 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4532691

## 12. 

Get-HotFix | Select-Object -Property InstalledOn, InstalledBy, HotfixID | Sort-Object -Property InstalledOn

InstalledOn           | InstalledBy          | HotfixID 
-----------           | -----------          | -------- 
1/28/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4470788
1/29/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4480056
4/11/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4493510
5/17/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4499728
6/14/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4504369
6/30/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4465065
7/17/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4509095
8/15/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4512937
9/11/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4512577
9/12/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4516115
9/13/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4486153
10/5/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4486172
10/9/2019 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4521862
11/13/2019 12:00:00 AM| AUTORIDADE NT\SISTEMA| KB4523204
2/12/2020 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4534131
2/12/2020 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4537759
2/12/2020 12:00:00 AM | AUTORIDADE NT\SISTEMA| KB4532691



## 13. 

Get-EventLog -LogName System -Newest 50 | Select-Object -Property Index, TimeGenerated, Source | Sort-Object -Property TimeGenerated, Index > trece.txt





