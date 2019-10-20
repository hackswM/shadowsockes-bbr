# shadowsockes-bbr  --bbr  
必须加特权运行差数 --privileged
··json
 docker run --privileged -d -p 9013:9013 test
# config.json
```json
{
    "server":"0.0.0.0",
    "server_port":9013,
    "password":"qq131415",
    "timeout":300,
    "method":"aes-256-gcm",
    "fast_open":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp"
}
```
#正常无bbr docker pull linux52/shadowsockes-test
