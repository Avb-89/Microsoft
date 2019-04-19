function New-Alarm
{
    param(
        [Parameter(Mandatory=$true,HelpMessage="Enter a time in HH:MM format (e.g. 23:00)")]
        [String]
        $time,

        [Parameter(Mandatory=$true,HelpMessage="Enter the alert box title (e.g. Alert!).")]
        [String]
        $alertBoxTitle,

        [Parameter(Mandatory=$true,HelpMessage="Enter the alert message.")]
        [String]
        $alertBoxMessage
    )

    do
    {
        Start-Sleep -Seconds 1
    }
    until((get-date) -ge (get-date $time))
    # Play system sound:
    [system.media.systemsounds]::Exclamation.play()
    # Display message
    [System.Windows.Forms.MessageBox]::Show($alertBoxMessage,$alertBoxTitle,
    [System.Windows.Forms.MessageBoxButtons]::YesNo,
    [System.Windows.Forms.MessageBoxIcon]::information,
    [System.Windows.Forms.MessageBoxDefaultButton]::Button1,
    [System.Windows.Forms.MessageBoxOptions]::ServiceNotification)
}
