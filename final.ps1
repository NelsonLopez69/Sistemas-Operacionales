<#
.SYNOPSIS
Este script  permite la administración de un Data Center mediante un menu desplegado por consola
.DESCRIPTION
El script final.ps1 utiliza los comandos 
-get-ChildItem: para obtener los archivos que se encuentran en una ruta ingresada por parámetro para obtener los archivos que se encuentran en una ruta especifica.
-get-process: Para obtener la lista de los procesos activos en la computadora.
-Get-CimInstance: Para obtener las instancias de las clases de los archivos del computador.
-[System.IO.DriveInfo]::GetDrives(): GetDrives() es un método que  retorna todos las unidades lógicas conectadas a la máquina
-get-NetTCPConnection: Obtiene las conexiones TCP actuales
.PARAMETER Directory
La ruta de la que se desean obtener todos los archivos
.EXAMPLE
.\final.ps1 -dir C:\Users
#>
param (
  [Parameter(Mandatory=$True)]
  [Alias('Directory')]
  [string]$dir
)
get-childItem -Path $dir
function menu-ayuda
{
param (
  [string]$Title = 'Menu de administracion del data center'
)

  Write-Host "================ $Title ================"
    
     Write-Host "Digite el numero de acuerdo con la opcion requerida."
     Write-Host "1. Mostrar los cinco procesos que mas CPU están consumiendo en este momento"
     Write-Host "2. Mostrar  los filesystems o discos conectados a la máquina"
     Write-Host "3. Desplegar el nombre y el tamaño del archivo más grande almacenado en un disco o
filesystem que el usuario deberá especificar."
     Write-Host "4. Mostrar la cantidad de memoria libre y cantidad del espacio de swap en uso"
     Write-Host "5. Mostrar el número de conexiones de red activas actualmente"	
     Write-Host "0. Salir del menu"

}


do
{
     menu-ayuda
     $input = Read-Host "Digite la opcion requerida"
     switch ($input)
     {
           '1' {
		        cls
		     get-process | select -property Name, CPU | sort CPU -desc | select -First 5
          
	   } '2' {
		        cls
                [System.IO.DriveInfo]::GetDrives() | Format-Table -Property Name, TotalSize, TotalFreeSpace

           } '3' {
		        cls

	
                Get-ChildItem $dir | sort Length -Descending |Select-Object -First 1 | ft Name, Length,DirectoryName
           } '4' {
                cls
		        Write-Host "Uso actual de swap: " $(Get-CimInstance -ClassName 'Win32_PageFileUsage'| Select-Object -Property CurrentUsage)
                	Write-Host "Memoria física libre: "$(Get-CimInstance Win32_OperatingSystem | Select FreePhysicalMemory)
                 

           } '5' {
                cls

			    get-NetTCPConnection –State Established | measure | Select -ExpandProperty count			
           
           } '0' {
                return
           }
     }
     pause
}
until ($input -eq '0')
