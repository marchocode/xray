# xray
v2ray/xray docker 快速启动版 每天18点自动更新规则文件

## 说明
规则文件来源： https://github.com/Loyalsoldier/v2ray-rules-dat
Docker 脚本修改来源：https://github.com/teddysun/across

## 如何使用
构建或者复制你的json文件,保存到当前目录

```bash
# 运行容器
docker run -d --network host --name xray -v $(pwd)/config.json:/etc/xray/config.json marchocode/xray

# 配置代理
export http_proxy="http://127.0.0.1:你的配置文件端口"
export https_proxy="http://127.0.0.1:你的配置文件端口"

# 测试下载
wget https://github.com/XTLS/Xray-core/releases/download/v1.6.1/Xray-linux-64.zip

Connecting to 127.0.0.1:10809... connected.
Proxy request sent, awaiting response... 302 Found
```

## 定时更新
默认每天18点更新规则文件，如需修改更新时间

新建一个文件，修改后挂载到容器内 `-v your_file_path:/var/spool/cron/crontabs/root`

```text
*       18      *       *       *       /etc/xray/update-rules-dat.sh
```
