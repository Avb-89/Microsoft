<# Notes:
Автор: Alexey Vadimovich
Проверяет установлен ли DHCP если нет - устанавливает его.

Configuration installDHCP - это описание конфигурации которую мы создаем
Node localhost  - указывает где применяется конфигурация (в нашем случае на этом же хосте)
WindowsFeature DHCPServer - В ролях сервера мы создадим заголовок (он является что-то наподобии ярлыка для настроек)
Ensure = "Present" Name = "DHCP" а тут уже прописываеются настройки (тут мы указали что роль должна присутствовать)
DHCP - Файл MOF который должен появиться и использоваться системой
Start-DscConfiguration -Wait -Force -Path .\DHCP -Verbose - команда заставляет powershell запустить конфигурацию DSC и указывает где лежит моф
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
