BizLicOnChain
===
## 概述
&ensp;&ensp;&ensp;&ensp;
本应用的主要功能是把营业执照放在区块链（以太坊）上。在区块链上发放营业执照的作用是，不依赖于发证机关（工商局或市场监督局）就可以证明营业执照的合法性。我们做了如下设计：1.只有指定账户（address）才可以提交营业执照；2.营业执照上有发证机关的数字签名。

## 存储设计
 |属性名|备注|
 |-----|----|
 |organCode|发证机关|
 |licContent|证照内容(把企业名称，法定代表人等字段拼成json串。)|
 |sign|电子签章|
