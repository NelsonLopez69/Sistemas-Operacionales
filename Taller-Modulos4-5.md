# Modulo 4

## 1. 
**Comando:** Get-Process | ft name, Id, Responding -Wrap
Se usa el comando Get-Process para obtener todos los procesos que se estén ejecutando en el computador en ese momento, luego se usa el pipeline para organizar la información en una tabla organizada por columnas con los atributos de name, Id y Responding. Por ultimo se usa el parámetro -wrap para especificar que las largas lineas de información mostradas en pantalla, puedan verse de manera adecuada haciendo que puedan imprimirse subdividiendose en varias lineas si es el caso.


## 2. 
**Comando:** Get-Process | ft name, Id, @{n='VM (MB)' ;e={$_.VM / 1MB}}, @{n='PM (MB)';e={$_.PM / 1MB}}

Este comando llama a todos los procesos que se esten ejecutandp actualmente y luego los muestra en una tabla con los atributos de nombre, Id, memoria virtual y memoria fisica. Estos dos ultimos atributos se editan para cambiar su nombre por defecto y ademas, se muestra el valor de los mismos expresado en MB, usando la constante MB que acepta Powershell.

## 3. 
**Comando:**  Get-EventLog -List | ft @{n='NombreLog';e={$_.LogDisplayName}}, @{n='Per-Retencion';e={$_.MinimumRetentionDays}}

Buscando en la herramienta de ayuda de Powershell se encontró que el parámetro -List del comando Get-EventLog proporciona una lista de los Log de eventos disponibles. Dicha lista se organiza en una tabla con los atributos de Nombre y periodo de retención, cuyos nombres fueron editados. 

## 4. 
**Comando:**  Get-Service | sort Status -Descending | fl -GroupBy Status

El comando Get-Service proporciona  todos los servicios disponibles. Luego mediante el pipeline, se organiza esta informacion por Estado y se le agrega el atributo -Descending para que se organice de manera contraria a la original, es decir, que aparezcan  primero los servicios en estado "Running" y luego los que se encuentran en estado "Stopped"

## 5. 
**Comando:**  Get-ChildItem -Path C:\ | Format-Wide -Column 4

El comando Get-ChildItem retorna todos los directorios de la ruta especificada con el parámetro -Path. Luego, mediante el pipeline se muestra una lista de dichos directorios dividida en 4 columnas, como se especificó en el parámetro -Column del comando Format-Wide

## 6. 
**Comando:**  =Get-ChildItem -Path C:\Windows | where -filter {$_.Name -like "*.exe"} | fl  Name,VersionInfo, @{n='Tamano';e={$_.Length}}

El comando Get-ChildItem proporciona todos los archivos del directorio especificado en el parámetro -Path. Luego mediante el pipeline se seleccionan solo los archivos de formato .exe y por ultimo se muestran los archivos en una lista que contiene el nombre, la información de la versión y el tamaño, a este ultimo se le modifica su nombre original.

## 7. 
**Comando:** Get-NetAdapter | where -filter {$_.Virtual -eq $false}

El comando Get-NetAdapter muestra una lista de adaptadores. Mediante el pipeline se filtra esta lista de adaptadores para que se muestren solamente los adaptadores cuyo atributo "Virtual" sea false, es decir que sea un adaptador no virtual.

## 8. 
**Comando:** Get-DnsClientCache -Type A, AAA | fl

El comando Get-DnsClientCache muestra los registros que se encuentren en la cache. El parametro -Type permite filtrar dichos registros por su tipo y por ultimo se utiliza el pipeline para crear una lsita con los registros previamente filtrados.

## 9. 
**Comando:** Get-ChildItem -Path C:\Windows\System32 | where -filter {$_.Name -like "*.exe" -and $_.Length -gt 5MB } | fl Name, Length

El comando Get-ChildItem retorna una lista  de todos los archivos que se encuentren el la ruta especificada por el parámetro -Path. Mediante el pipeline se filtran todos los archivos de formato .exe y cuyo tamano sea mayor (-gt) a 5MB.

## 10. 
**Comando:** Get-HotFix | where -filter {$_.Description -eq "Security Update"}

El comando Get-hotFix retorna todos los parches del sistema. Mediante el pipeline  el atributo -filter se tomaron solo los parches que fueran actualizaciones de seguridad, equiparando el resultado mediante el parámetro -eq.

## 11. 
**Comando:** Get-HotFix | where -filter {$_.Description -eq "Update" -and $_.InstalledBy -like "*sistema"}

Mediante el cmdlet "where" se filtran los parches por su descripción y por quien lo instaló usando el parametro filter y -eq.

## 12. 
**Comando:** Get-Process | where -filter {$_.Name -eq "Conhost" -or $_.Name -eq "Svchost"}

Mediante el cmdlet "where" se filtran los procesos cuyos nombres correspondan a "Conhost" o "Svchost"


# Modulo 5

## 1. 
**Comando:** Get-WmiObject -Namespace root\CIMv2 -list | where name -like '*adapter*'

Para encontrar una clase relacionada con la direccion IP de un adapatador de red se hizo uso del comando WmiObject del namespace especificado y cuyo resultado se filtra usando el cmdlet "where" y buscando una clase que contenga la palabra "adapter". Haciendo esta búsqueda se encontró que la clase que se requeria era Win32_NetworkAdapterConfiguration. En dicha clase se muestra el atributo NetworkAddres que muestrala direccion IP de cada adaptador de red. Mediante el comando Get-WmiObject Win32_NetworkAdapterConfiguration | gm, se descubrip que existe un metodo llamado releaseDHCPLease que permite liberar un lease DHCP.

## 2. 
**Comando:** Get-WmiObject -Namespace root\CIMv2 -list | where name -like '*fix*'

Usando el comando get-WmiObject -Namespace root\CIMv2 -list | where name -like '*fix*, el cual permitía buscar una clase que tuviera en su nombre la palabra "fix", se encontró la clase Win32_QuickFixEngineering. Para desplegar la lista de parches se utilizo el comando Get-WmiObject Win32_QuickfixEngineering. Usando el comando anterior y el comando Get-HotFix se comprobó que arrojan el mismo resultado.

## 3. 
**Comando:** Get-WmiObject Win32_Service | fl Status, startMode, startName

Empleando la clase Win32_Service, se muestran todos los servicios del sistema. Haciendo uso del pipeline se muestran dichos servicios en una lista con los atributos de Status, startMode y startName que corresponde a las cuentas empleadas para hacer login.

## 4. 
**Comando:** Get-CimClass -Namespace root/SecurityCenter2 | where cimclassname -Like "*product*"

Para seleccionar todas las clases del namespace especificado que tengan en su nombre la palabra "product", se hace uso del pipeline que se encarga de filtrar el atributo cimclassname y arrojar coincidencias de acuerdo a lo que se especifica en el parámetro -Like.

## 5. 
**Comando:** Get-CimInstance -Namespace root/SecurityCenter2 -ClassName "AntiSpywareProduct"

Teniendo en cuenta que en el comando del punto anterior se msotraba una tabla con las diferentes clases en cuyo nombre se encontraba la palabra "product", se identificó la clase AntiSpywareProduct. Para identificar los nombres de las aplicaciones antispyware instaladas en el sistema se muestran las instancias que pueda tener la clase en cuestión.






