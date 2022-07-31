#!/bin/bash
# 生成私钥和CSR
openssl req -newkey rsa:2048 -nodes -keyout domain.key -out domain.csr
# 用CSR生成证书
openssl x509 -signkey domain.key -in domain.csr -req -days 365 -out domain.crt
# 创建CAkey和CA
openssl req -x509 -sha256 -days 1825 -newkey rsa:2048 -keyout rootCA.key -out rootCA.crt
# 创建一个ext文件
# authorityKeyIdentifier=keyid,issuer
# basicConstraints=CA:FALSE
# subjectAltName = @alt_names
# [alt_names]
# IP.1 = 120.48.141.183
# 用CA给CSR签名
openssl x509 -req -CA rootCA.crt -CAkey rootCA.key -in domain.csr -out domain.crt -days 365 -CAcreateserial -extfile domain.ext


