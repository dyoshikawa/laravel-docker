# LaravelProjectスターターリポジトリ

## Start Project

### ビルド&コンテナ起動

~~~
$ git clone https://github.com/daioyoshikawa/docker-laravel.git
$ cd docker-laravel
$ docker-compose up -d
~~~

### .env設定

- laravel/var-www-laravel/.env

~~~
DB_HOST=mysql
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=secret

CACHE_DRIVER=redis
SESSION_DRIVER=redis
REDIS_HOST=redis
~~~

## Join Project

### ビルド&コンテナ起動

- 同上

### コンテナアクセス

~~~
$ docker exec -u 1000 -ti lara_laravel sh
~~~

### ComposerInstall実行

~~~
# composer install
# composer update
~~~

### .env設定

~~~
# cp -p .env.example .env
# php artisan key:generate
~~~

- .env設定は同上

### Migration

~~~
# php artisan migrate
~~~

## 参考
- https://qiita.com/YU81/items/d1b2100aae53d2088a2c
- https://qiita.com/eimei4coding/items/efd3a38db08eb476d412
- https://qiita.com/meidaimae/items/1b5902e2e520ece34b9a
- https://qiita.com/bmf_san/items/8b8018ecc19f9b867911