## Установка и настройка Windows Server 2016 (70-740):

### _Сначала рассмотрим версии WindowsServer2016_

**Есть 2 основных издания:**

| Datacenter Edition | Standart Edition |
|----------------|:---------:|
| Стандартный функционал | Стандартный функционал |
| Неограниченное число виртуальных машин (в Hyper-v) | Две виртуальные машины (в Hyper-v) |
| Неограниченное число контейнеров (в Hyper-v) | Два контейнера (в Hyper-v) |
| Неограниченное число Контейнеров | Неограниченное число Контейнеров |
| Host Guardian Service | Host Guardian Service |
| Nano Server | Nano Server |
| Storage Soaces Direct | -- |
| Storage Replica | -- |
| Shielded VMs | -- |
| Advanced Networking | -- |

Суть таблицы в том, что Datacenter Edition создавался с расчетом, использования его в качестве хоста для виртуальных машин или контейнеров.
Для остального целесообразнее будет использовать Standart Edition

### _Минимальные требования_

* `1.4 Ghz x64 с поддержкой NX, DEP, CMPXCHG16b, LAHF/SAHF, и PrefetchW` -- (Подходит большинство современных процессоров)    
* `SLAT support (EPT or NPT)`    
* `512 MB* or 2GB ECC-type (or similar) RAM` -- (512 не хватит на установку (надо 1024), но это минимальное кол-во озу, для уже работающей машины, поэтому microsoft указало его в минималках)    
* `32 GB* Hard disk space` -- (32гб это минимум для работы, все остальное, обновления и оснастки потребуют больше места)     
* `Gigabit Ethernet NIC that is PCI Express compliant and support PXE`

### _Способы Установки_

Существует три способа установки Windows Server 2016    
1) `Server Core` -- Он меньше занимает места, меньше потребляет ресурсов, не имеет пользовательского интерфейса (что дает ему большую защиту, так как количество уязвимостей резко падает, а это дает возможность реже обновляться)

2) `NanoServer` -- Он cоздан исключительно для работы с контейнерами. Управляется только удаленно через PowerShell, или консолью администрирования (mmc). Через консоль сервера можно сделать незначительные настройки, такие как поменять IP.

3) `Desktop Experience` - Это стандартный сервер который мы чаще всего видим.

### _Установка_

Для работы я выбрал Hyper-v так как мне просто удобно с ним работать и он встроен в windows 10 pro, а также можно легко управлять виртуальными машинами через PowerShell. Вы можете использовать любую среду виртуализации которая нравится вам (Virtual Box, Esxi, KVM, Vmware workstation и прочие).    
Я сделал 1 машину:
`2GB MEM`
`60GB HDD`
`1 CPU`    
И вторую:
`1GB MEM`
`60GB HDD`
`1CPU`

Не думаю, что надо учить вас как установить Windows по дефолту.    
~~Нажимаем далее, далее, далее, далее, без заморочек.~~    

На первой машине:    
Из списка ОС выбираем windows Server 2016 (Desktop Experience)


Устанавливаем пароль для пользователя.

После установки перед вами откроется консоль администрирования там мы и поменяем `имя` и `IP адрес`.

![Alt-текст](https://downloader.disk.yandex.ru/preview/e792f06ea0f8a3c3c3aa72916426fd14f211bb9d5d9a5b8c7de58d29c71f40b7/5c9e3ce6/RXcx1cI8Tb2-15NjGVQDbiJF8oy_oW8M7miwggcrYPd-p_u_rD8OStL44EBf71uqyzHUCp7UZuiJRAAqzyPT9w%3D%3D?uid=0&filename=2019-03-29_15-41-43.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&tknv=v2&size=1658x767)

1) нажимаем на ссылки и нам откроются нужные места где поменять пораметры:

2) Меняем имя    
![Alt-текст](https://downloader.disk.yandex.ru/preview/e3c7f2bc27b35090743ad0e48a105ade4f30398887422f23f9610eb94e54f529/5c9e40a4/u4AibxMPWOCOGuswJePLQ7DGCID4IHz9ixpQk-NllAZsM_dcF8Fno7dG7KFXLozH1f4qoQ94iBjIkc-mJ-c8Aw%3D%3D?uid=0&filename=2019-03-29_15-57-49.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&tknv=v2&size=2048x2048)

3) Меняем IP Адрес. Я выбрал 192.168.3.1 Но вы можете использовать любой.
![Alt-текст](https://downloader.disk.yandex.ru/preview/bf1b9e71928fb21464fb267fb1637089b2cc8f47c4fb28460ba189249d2bcaf7/5c9e42c3/l8mqH_Q-U9UnADRa5iqodeDJvVVeMFxUSf-JxF05fii-iCUFZ3OVVLonVI7SYeg0PoYQcxPdnkmSojh9y9OVqA%3D%3D?uid=0&filename=2019-03-29_16-05-30.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&tknv=v2&size=2048x2048)

На втором:    
но в этот раз уже выберем из списка Windows server 2016

После установки вас встретит "Приветливое" черное окошко cmd.exe :laughing:

Настройка имени и IP адреса делается не чем не сложнее чем с интерфейсом:

````
C:\Users\Administrator>sconfig
````


### _Установка Ролей и компонентов (Desktop Вариант)_

Microsoft предлогает несколько способов для определения ролей сервера. Первый это всем знакомый мастер "Добавить роли и компоненты" и второй (самая удобная на мой взгляд) это установка через PowerShell

Нажимаем на добавить роли
![Alt-текст](https://downloader.disk.yandex.ru/preview/dab7d5a03fd3d98cedd283fb0ddf2b8743e5066dd06e15f97830f5488c40c47f/5c9e4807/JoHShgLLaQ7BeyBZRhNdC9deoxyVX3xfef9Tq0Mpa9SWeYoJSdd3Y8vyO72FW_yGDVUPDmkDlFcIFMJVOefA8w%3D%3D?uid=0&filename=2019-03-29_16-28-58.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&tknv=v2&size=2048x2048)

В windows Server 2016 мы можем устанавливать роли не только на этой машине но и на других серверах под управлением Windows 2012 и выше. (В данном слайде не видно, так как машина у нас одна)

![Alt-текст](https://downloader.disk.yandex.ru/preview/7ea0b4bb98122b7c9db1e445f745ff07c4938a2b2eb3e36308ca2b69fd2c1c72/5c9e4dea/bl5jPrkNDGOox8zolAUrAt1OYn-IvOJAqTO3JoCs7YE7pmfYuYnZlAJ-guPn_EHhoR_RmauTTuIU_mqHoq5uiw%3D%3D?uid=0&filename=2019-03-29_16-53-14.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&tknv=v2&size=2048x2048)

Для Примера давайте установим роль IIS сервер. Если нажать на "Inclide management tools" нам автоматически доставится и консоль управления IIS сервером.

![Alt-текст](https://downloader.disk.yandex.ru/preview/4aed8d34cce83b11f46f4e96cc2b6ed16b24f95517ad9ecd666e83f51dbc047b/5c9e4efd/xU1PeH5nzDW8XP7RDmpt3OpfCMlCAl_Eb76um8uMVPpIP12J6ON_7VO0UTHsnnAL1urzRK5PITmovdpa31ELGQ%3D%3D?uid=0&filename=2019-03-29_16-59-15.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&tknv=v2&size=2048x2048)

Ставить будем по дефолту, дальше далее далее

На экране Confirm Installation selections есть ссылочка на нашу конфигурацию. Это действительно круто, т.к. вы можете развернуть точно такую же конфигурацию на других серверах. Он сохранит по сути уже настроеный скрипт с вашими требованиями.

![Alt-текст](https://downloader.disk.yandex.ru/preview/d8c3336648d4d0bb8df7e4c3e07c8ce10cc8327f9a2b55a2150eeec4129aefd2/5c9e513b/rLqfhFLHyCT96T6w23el4Zsu9zDVTxKHi8igGB6GOdBvvZTA76J3znkOj3LYcnEVzxIA2ygMl3-HBOsVqWfAWQ%3D%3D?uid=0&filename=2019-03-29_17-06-11.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&tknv=v2&size=2048x2048)


То что я показал присутсвует в экзамене, но по сути там всего пара вопросов про это.


В основном экзамен строится на вопросах связанных с администрированием через PowerShell.  Поэтому отстраивать нашу маленькую лабараторию мы будем непосредственно через него.
