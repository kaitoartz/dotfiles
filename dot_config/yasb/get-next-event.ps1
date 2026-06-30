# get-next-event.ps1
# Reemplaza esta URL con la dirección privada en formato iCal de tu Google Calendar
$icalUrl = "https://calendar.google.com/calendar/ical/kaitoartz.personal%40gmail.com/private-1c3310f03d137e8a930f765c443136a6/basic.ics"

if ($icalUrl -eq "https://calendar.google.com/calendar/ical/kaitoartz.personal%40gmail.com/private-1c3310f03d137e8a930f765c443136a6/basic.ics" -or -not $icalUrl) {
    return "Configurar iCal"
}

try {
    $ics = Invoke-RestMethod -Uri $icalUrl -TimeoutSec 10
    $events = @()

    # Dividir el archivo ICS en bloques de eventos
    $blocks = $ics -split "BEGIN:VEVENT"
    foreach ($block in $blocks) {
        $summary = $null
        $dtstartRaw = $null

        # Quitar retornos de carro para evitar problemas en búsquedas regex multilínea
        $cleanBlock = $block -replace "`r", ""

        # Extraer SUMMARY y DTSTART usando expresiones regulares tolerantes a parámetros (como TZID o VALUE)
        if ($cleanBlock -match "SUMMARY[^:]*:(.*)") {
            $summary = $Matches[1].Split("`n")[0].Trim()
        }
        if ($cleanBlock -match "DTSTART[^:]*:(.*)") {
            $dtstartRaw = $Matches[1].Split("`n")[0].Trim()
        }

        if ($summary -and $dtstartRaw) {
            # Parsear formato de fecha y hora: YYYYMMDDTHHMMSS
            if ($dtstartRaw -match "(\d{4})(\d{2})(\d{2})T(\d{2})(\d{2})(\d{2})") {
                $year = [int]$Matches[1]
                $month = [int]$Matches[2]
                $day = [int]$Matches[3]
                $hour = [int]$Matches[4]
                $minute = [int]$Matches[5]
                $second = [int]$Matches[6]
                
                # Asumimos UTC si termina en Z
                $kind = if ($dtstartRaw.EndsWith("Z")) { [DateTimeKind]::Utc } else { [DateTimeKind]::Local }
                $dt = New-Object DateTime($year, $month, $day, $hour, $minute, $second, $kind)
                
                $dtLocal = if ($kind -eq [DateTimeKind]::Utc) { $dt.ToLocalTime() } else { $dt }
                
                if ($dtLocal -gt (Get-Date)) {
                    $events += [PSCustomObject]@{
                        Summary = $summary
                        Start = $dtLocal
                    }
                }
            }
            # Parsear formato de fecha (Todo el día): YYYYMMDD
            elseif ($dtstartRaw -match "(\d{4})(\d{2})(\d{2})") {
                $year = [int]$Matches[1]
                $month = [int]$Matches[2]
                $day = [int]$Matches[3]
                
                $dtLocal = New-Object DateTime($year, $month, $day, 0, 0, 0)
                
                if ($dtLocal -gt (Get-Date)) {
                    $events += [PSCustomObject]@{
                        Summary = $summary
                        Start = $dtLocal
                    }
                }
            }
        }
    }

    if ($events.Count -gt 0) {
        # Ordenar por fecha de inicio y tomar el primero (más cercano en el futuro)
        $next = $events | Sort-Object Start | Select-Object -First 1
        $timeFormatted = $next.Start.ToString("dd/MM HH:mm")
        $outputText = "$($next.Summary) ($timeFormatted)"
    } else {
        $outputText = "Sin eventos"
    }

     $outputText | Out-File -FilePath "{{ .chezmoi.homeDir }}\.config\yasb\next-event.txt" -Encoding utf8 -Force
    return $outputText
} catch {
    "Error Calendario" | Out-File -FilePath "{{ .chezmoi.homeDir }}\.config\yasb\next-event.txt" -Encoding utf8 -Force
    return "Error Calendario"
}
