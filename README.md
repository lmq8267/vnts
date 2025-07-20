# 服务端vnts - mipsel
<p align="center">
  <img alt="GitHub Created At" src="https://img.shields.io/github/created-at/lmq8267/vnts?logo=github&label=%E5%88%9B%E5%BB%BA%E6%97%A5%E6%9C%9F">
<a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Flmq8267%2Fvnts&count_bg=%2395C10D&title_bg=%23555555&icon=github.svg&icon_color=%238DC409&title=%E8%AE%BF%E9%97%AE%E6%95%B0&edge_flat=false"/></a>
<a href="https://github.com/lmq8267/vnts/releases"><img src="https://img.shields.io/github/downloads/lmq8267/vnts/total?logo=github&label=%E4%B8%8B%E8%BD%BD%E9%87%8F"></a>
<a href="https://github.com/lmq8267/vnts/graphs/contributors"><img src="https://img.shields.io/github/contributors-anon/lmq8267/vnts?logo=github&label=%E8%B4%A1%E7%8C%AE%E8%80%85"></a>
<a href="https://github.com/lmq8267/vnts/releases/"><img src="https://img.shields.io/github/release/lmq8267/vnts?logo=github&label=%E6%9C%80%E6%96%B0%E7%89%88%E6%9C%AC"></a>
<a href="https://github.com/lmq8267/vnts/issues"><img src="https://img.shields.io/github/issues-raw/lmq8267/vnts?logo=github&label=%E9%97%AE%E9%A2%98"></a>
<a href="https://github.com/lmq8267/vnts/discussions"><img src="https://img.shields.io/github/discussions/lmq8267/vnts?logo=github&label=%E8%AE%A8%E8%AE%BA"></a>
<a href="GitHub repo size"><img src="https://img.shields.io/github/repo-size/lmq8267/vnts?logo=github&label=%E4%BB%93%E5%BA%93%E5%A4%A7%E5%B0%8F"></a>
<a href="https://github.com/lmq8267/vnts/actions?query=workflow%3ABuild"><img src="https://img.shields.io/github/actions/workflow/status/lmq8267/vnts/vnts.yml?branch=main&logo=github&label=%E6%9E%84%E5%BB%BA%E7%8A%B6%E6%80%81" alt="Build status"></a>
<a href="https://hub.docker.com/r/lmq8267/vnts"><img src="https://img.shields.io/docker/pulls/lmq8267/vnts?color=%2348BB78&logo=docker&label=%E6%8B%89%E5%8F%96%E9%87%8F" alt="Downloads"></a>
</p>
  
客户端https://github.com/lmq8267/vnt


下载 点右边的releases


更新说明https://github.com/lbl8603/vnts/releases

### Docker部署

- cmd

  `docker run --name vnts -p 29872:29872 -p 29870:29870/tcp -e TZ=Asia/Shanghai --restart=always -d lmq8267/vnts -p 29872 -P 29870 -U WEB用户名 -W WEB密码`

- compose.yaml

```
version: '3.9'
services:
    vnts:
        image: lmq8267/vnts
        container_name: vnts
        restart: always
        ports:
            - '29870:29870/tcp'
            - '29872:29872'
        environment:
            - TZ=Asia/Shanghai
        command: '-p 29872 -P29870 -U WEB用户名 -W WEB密码'
```
