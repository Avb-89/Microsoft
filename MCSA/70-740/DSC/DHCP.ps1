<# Notes:
Автор: Alexey Vadimovich
Проверяет установлен ли DHCP если нет - устанавливает его.
#>

Configuration DHCP
{
    Node localhost
    {
        WindowsFeature DHCPServer {
            Ensure = "Present"
            Name = "DHCP"
        }
    }
}

DHCP

Start-DscConfiguration -Wait -Force -Path .\DHCP -Verbose
