{%- from "ntp-client-windows/map.jinja" import time with context %}

specialpollinterval:
  reg.present:
    - name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient\SpecialPollInterval'
    - value: {{ time.specialpollinterval }}
    - vtype: 'REG_DWORD'
    - reflection: False
    - watch_in:
      - service: timeservice

ntpserver:
  reg.present:
    - name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters\NtpServer'
    - value: {{ time.servers }}
    - vtype: 'REG_SZ'
    - reflection: False
    - watch_in:
      - service: timeservice

type:
  reg.present:
    - name: 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters\Type'
    - value: 'NTP'
    - vtype: 'REG_SZ'
    - reflection: False
    - watch_in:
      - service: timeservice

timeservice:
  service.running:
    - name: 'W32Time'
