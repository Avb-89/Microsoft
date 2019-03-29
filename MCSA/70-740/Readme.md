## Installation, Storage, and Compute with Windows Server 2016 (70-740):

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

Для работы я выбрал Hyper-v так как мне просто удобно с ним работать и он встроен в windows 10 pro. Вы можете использовать любую среду виртуализации которая нравится вам (Virtual Box, Esxi, KVM, Vmware workstation и прочие).    
Я сделал машину:
`2GB MEM`
`60GB HDD`
`1 CPU`


Не думаю, что надо учить вас как установить Windows по дефолту. ~~Нажимаем далее, далее, далее, далее, без заморочек.~~

Устанавливаем пароль для пользователя.

После установки перед вами откроется консоль администрирования там мы и поменяем `имя` и `IP адрес`.

![Alt-текст](https://downloader.disk.yandex.ru/preview/e792f06ea0f8a3c3c3aa72916426fd14f211bb9d5d9a5b8c7de58d29c71f40b7/5c9e3ce6/RXcx1cI8Tb2-15NjGVQDbiJF8oy_oW8M7miwggcrYPd-p_u_rD8OStL44EBf71uqyzHUCp7UZuiJRAAqzyPT9w%3D%3D?uid=0&filename=2019-03-29_15-41-43.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&tknv=v2&size=1658x767)

1) нажимаем на ссылки и нам откроются нужные места где поменять пораметры:

2) Меняем имя    
![Alt-текст](https://downloader.disk.yandex.ru/preview/e3c7f2bc27b35090743ad0e48a105ade4f30398887422f23f9610eb94e54f529/5c9e40a4/u4AibxMPWOCOGuswJePLQ7DGCID4IHz9ixpQk-NllAZsM_dcF8Fno7dG7KFXLozH1f4qoQ94iBjIkc-mJ-c8Aw%3D%3D?uid=0&filename=2019-03-29_15-57-49.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&tknv=v2&size=2048x2048)

3) Меняем IP Адрес. Я выбрал 192.168.3.1 Но вы можете использовать любой.
![Alt-текст](https://downloader.disk.yandex.ru/preview/bf1b9e71928fb21464fb267fb1637089b2cc8f47c4fb28460ba189249d2bcaf7/5c9e42c3/l8mqH_Q-U9UnADRa5iqodeDJvVVeMFxUSf-JxF05fii-iCUFZ3OVVLonVI7SYeg0PoYQcxPdnkmSojh9y9OVqA%3D%3D?uid=0&filename=2019-03-29_16-05-30.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&tknv=v2&size=2048x2048)

### _Установка Ролей и компонентов_

microsoft предлогает несколько способов для определения ролей сервера. Первый это всем знакомый мастер "Добавить роли и компоненты" и второй это установка через PowerShell

1) Нажимаем на добавить роли
![Alt-текст](https://downloader.disk.yandex.ru/preview/dab7d5a03fd3d98cedd283fb0ddf2b8743e5066dd06e15f97830f5488c40c47f/5c9e4807/JoHShgLLaQ7BeyBZRhNdC9deoxyVX3xfef9Tq0Mpa9SWeYoJSdd3Y8vyO72FW_yGDVUPDmkDlFcIFMJVOefA8w%3D%3D?uid=0&filename=2019-03-29_16-28-58.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&tknv=v2&size=2048x2048)

В windows Server 2016 мы можем устанавливать роли не только на этой машине но и на других серверах под управлением Windows 2012 и выше. (В данном слайде не видно, так как машина у нас одна)
