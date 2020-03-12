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

El comandoGet-NetAdapter muestra una lista de adaptadores. Mediante el pipeline se filtra esta lista de adaptadores para que se muestren solamente los adaptadores cuyo atributo "Virtual" sea false, es decir que sea un adaptador no virtual.

## 8. 
**Comando:**

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

