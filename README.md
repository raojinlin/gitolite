#### gitolite docker

## 管理员公钥
```data/developer.pub```，将此文件内容替换成自己的公钥。

## 克隆 gitolite-admin.git 仓库

```
   $ git clone ssh://git@{container_ip}:{container_port}/gitolite-admin.git
```

mac下无法直接访问容器ip，需要通过端口转发。
例如：
```
   # start
   $ docker run -p 33:22 {container}
   $ git clone ssh://git@localhost:33/gitolite-admin.git
```

