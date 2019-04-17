## Установка и настройка Windows Server 2016 (70-740):


### _Установка Ролей и компонентов (Desktop Вариант)_

Microsoft предлогает несколько способов для определения ролей сервера. Первый это всем знакомый мастер "Добавить роли и компоненты" и второй (самая удобная на мой взгляд) это установка через PowerShell

Нажимаем на добавить роли
TODO:Добавить картинку
В windows Server 2016 мы можем устанавливать роли не только на этой машине но и на других серверах под управлением Windows 2012 и выше. (В данном слайде не видно, так как машина у нас одна)
TODO:Добавить картинку
Для Примера давайте установим роль IIS сервер. Если нажать на "Inclide management tools" нам автоматически доставится и консоль управления IIS сервером.
TODO:Добавить картинку

Ставить будем по дефолту, дальше далее далее

На экране Confirm Installation selections есть ссылочка на нашу конфигурацию. Это действительно круто, т.к. вы можете развернуть точно такую же конфигурацию на других серверах. Он сохранит по сути уже настроеный скрипт с вашими требованиями.
TODO:Добавить картинку


Для работы нашей маленькой лабаратории нам потребуется чтобы кто-то раздавал IP адреса. Эту роль на себя берет DHCP

Чтобы увидеть какие есть роли и компоненты, а также проверить установлены ли они:

```
PS C:\> Get-WindowsFeature

```

Чтобы проверить установлен ли у нас непосредственно DHCP введем:

```
[DC1]: PS C:\> Get-WindowsFeature -Name *dhcp*

Display Name                                            Name                       Install State
------------                                            ----                       -------------
[ ] DHCP Server                                         DHCP                           Available
        [ ] DHCP Server Tools                           RSAT-DHCP                      Available
```
Видно что эта роль у нас не установлена.
Чтобы установить ее воспользуемся командой
```
[DC1]: PS C:\> Install-WindowsFeature -Name DHCP, RSAT-DHCP  -IncludeAllSubFeature

Success Restart Needed Exit Code      Feature Result
------- -------------- ---------      --------------
True    No             Success        {Remote Server Administration Tools, DHCP ...
```
Теперь снова глянем установлена ли роль

```
[DC1]: PS C:\> Get-WindowsFeature -Name *dhcp*

Display Name                                            Name                       Install State
------------                                            ----                       -------------
[X] DHCP Server                                         DHCP                           Installed
        [X] DHCP Server Tools                           RSAT-DHCP                      Installed
```
Роль установлена. Настроим ее
TODO: процесс настройки dhcp

Теперь у нас есть dhcp сервер который раздает адреса.