##
# @Author: Ed Ardolino
# @Version 1.0
# @Creation Date: 1-18-2023
##

##
# WinUtil is a powershell script package loaded with multiple utilities. (Filler Line)
##

# Initiate GUI addon, add ability to add buttons
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create new GUI
$GUI = New-Object system.Windows.Forms.Form

# Set GUI dimensions, text box title, and the color os the background
$GUI.ClientSize = '500,300'
$GUI.text = "WinUtil"
$GUI.BackColor = "#ffffff"

# Add 'Download Windows Update' Button to GUI
# Still working on the script behind it
$WinUpdateButton = New-Object System.Windows.Forms.Button
$WinUpdateButton.BackColor = "#FF0000"
$WinUpdateButton.Text = "Download Windows Updates"
$WinUpdateButton.Width = '75'
$WinUpdateButton.Height = '75'
$WinUpdateButton.Location = New-Object System.Drawing.Point(200,125)
$WinUpdateButton.Font = 'Microsoft Sans Serif,10'
$WinUpdateButton.ForeColor = "#000000"
$WinUpdateButton.Add_Click{Write-Host "Work in progress"}
$GUI.Controls.Add($WinUpdateButton)

# Add 'WinGet Update' Button
$WinGetButton = New-Object System.Windows.Forms.Button
$WinGetButton.BackColor = "#FF0000"
$WinGetButton.Text = "Update programs with winget"
$WinGetButton.Width = '75'
$WinGetButton.Height = '75'
$WinGetButton.Location = New-Object System.Drawing.Point(125,225)
$WinGetButton.Font = 'Microsoft Sans Serif,10'
$WinGetButton.ForeColor = "#000000"
$WinGetButton.Add_Click({WinGetUpdate})
$GUI.Controls.Add($WinGetButton)

# Add 'Dark Mode/ Light Mode' Button (System)
$DarkLightToggleButton = New-Object System.Windows.Forms.Button
$DarkLightToggleButton.BackColor = "#FF0000"
$DarkLightToggleButton.Text = "Toggle Dark Mode (System)"
$DarkLightToggleButton.Width = '75'
$DarkLightToggleButton.Height = '75'
$DarkLightToggleButton.Location = New-Object System.Drawing.Point(150,25)
$DarkLightToggleButton.Font = 'Microsoft Sans Serif,10'
$DarkLightToggleButton.ForeColor = "#000000"
$DarkLightToggleButton.Add_Click({ThemeToggle})
$GUI.Controls.Add($DarkLightToggleButton)

# Script for WinGet Button
function WinGetUpdate() {
    Start-Process powershell -verb runas -ArgumentList "-file fullpathofthescript"
    #winget upgrade --all
}

# Script for Dark/ Light Mode Toggle
function ThemeToggle() {
    $GetProperty = (Get-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize).AppsUseLightTheme

    if ($GetProperty -eq 0) {
        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 1
        #Write-Host "Light Mode Enabled"
    }else {
        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0
        #Write-Host "Dark Mode Enabled"
    }
}


# Display GUI
[void]$GUI.ShowDialog()