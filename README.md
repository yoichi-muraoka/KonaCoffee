# 課題概要
- JSP/Servletを使い、「Kona Coffee」というサイトを作成してください。

## ページ構成
| URL | 内容 | Servlet | JSP |
| --- | --- | --- | --- |
| /home | トップページ：<br>・美味しいコーヒーの入れ方<br>・オススメのコーヒー | HomeServlet | home.jsp |
| /login | ログインページ：<br>・ログイン成功時は管理画面へ遷移 | LoginServlet | login.jsp |
| /logout | ログアウト：<br>・ログアウト後はトップページに遷移 | LogoutServlet | なし |
| /admin/list | 管理画面ホーム：<br>・コーヒーリストの表示 | CoffeeListServlet | coffeeList.jsp |
| /admin/add | 管理画面：<br>・コーヒーの登録フォーム | CoffeeAddServlet | coffeeAdd.jsp |

## データベース
- データベースをセットアップする場合は、以下のSQLを実行してください。
``` sql
CREATE DATABASE kona_coffee_db
CHARSET utf8mb4 COLLATE utf8mb4_general_ci;

USE kona_coffee_db;

CREATE TABLE coffee (
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(50) UNIQUE NOT NULL,
   maker VARCHAR(20),
   url VARCHAR(255)
);

CREATE TABLE admins (
   id INT PRIMARY KEY AUTO_INCREMENT,
   login_id VARCHAR(30) UNIQUE NOT NULL,
   login_pass CHAR(60) NOT NULL
);

INSERT INTO coffee VALUES
(1, "ブルーマウンテン", "小川珈琲", "https://oc-shop.co.jp/products/549?srsltid=AfmBOorNOBhxJ9xs5DmpXCYM1Q2Cg-aCWb3tmCXg1BPcLa8xs1YKAmmQ"),
(2, "Brazil Fazenda Bau", "タリーズコーヒージャパン", "https://www.tullys.co.jp/menu/beans/varietal/brazil_fazenda_bau.html"),
(3, "プレミアムマイルドブレンド", "成城石井", "https://seijoishii.com/products/4953762413860?srsltid=AfmBOorUsBei7vNvdnp41QRZCtxxhVvG9jJ_2bm9ifzuOrIJlLhVFrWM");

-- パスワードは「coffee」
INSERT INTO admins VALUES
(1, "arabica", "$2a$10$s.pp9TzBhIkLyLVMtkTvZeD.5WaN.QsKOPtEkAGkjTGoAOWL7gGie"),
(2, "robusta", "$2a$10$330.Ijb4G8j00S/FAXv4C.7lRdm8ENhrfFTVO1CQrrCyJP.pCRahC");
```

### Tomcat設定ファイルへの追記例
#### server.xmlへの追記
``` xml
<Resource name="jdbc/kona_coffee_db"
  type="javax.sql.DataSource" 
  driverClassName="com.mysql.cj.jdbc.Driver"   
  url="jdbc:mysql://127.0.0.1:3306/kona_coffee_db?useUnicode=true&amp;characterEncoding=utf8&amp;serverTimezone=Asia/Tokyo"
  username="root" password=""
  validationQuery="SELECT 1" 
  initialSize="1" maxTotal="5" maxIdle="3" maxWaitMillis="5000" />
```

#### context.xmlへの追記
``` xml
<ResourceLink name="jdbc/kona_coffee_db"
    global="jdbc/kona_coffee_db"
    type="javax.sql.DataSource" />
```