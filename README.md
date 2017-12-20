# LaravelProjectスターターリポジトリ

## 環境構築手順
### 0から開発する場合
- ビルド&コンテナ立ち上げ
~~~
$ cd myLaravel
$ mkdir app
$ docker-compose up -d
~~~

- 立ち上がったコンテナを確認

~~~
$ docker ps
~~~

- appコンテナ内で以下コマンド実行

~~~
$ docker exec -it app bash
~~~

~~~
# composer create-project --prefer-dist laravel/laravel /var/www/app
# cd /var/www/app
# composer require predis/predis
~~~

- .env設定
~~~
DB_HOST=mysql
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=secret

CACHE_DRIVER=redis
SESSION_DRIVER=redis
REDIS_HOST=redis
~~~

### 進行中の開発に途中参加する場合
- ビルド&コンテナ立ち上げ
  - 同上

- appコンテナ内で以下コマンド実行

~~~
# composer install
# composer update
# composer require predis/predis
# cp -p .env.example .env
# php artisan key:generate
~~~

- localhost:8081確認

- .env設定
  - 同上

- マイグレーション実行

~~~
# php artisan migrate
~~~

## intellij設定
- Dockerfile登録
  - Preferences -> Editer -> Filetypes -> Docker -> "+" -> "*.docker" -> apply

## 参考
- https://qiita.com/YU81/items/d1b2100aae53d2088a2c
- https://qiita.com/eimei4coding/items/efd3a38db08eb476d412
- https://qiita.com/meidaimae/items/1b5902e2e520ece34b9a
