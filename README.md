# jump_park
### First step
#### Clone repo and Create the keycloak database in mysql
```
git clone git@github.com:gvillela7/jump_park.git
cd jump_park
mysql -u root -p your_password
create database keycloak;
create database jump_park;
```

### Second step
#### Create the keycloak user in MySQL
```
create user keycloak IDENTIFIED BY 'K&ycl0ak'
```
```
GRANT ALL PRIVILEGES ON keycloak.* TO 'keycloak'@'%' WITH GRANT OPTION;
```

### Third step
#### Change the docker-compose.yml file
```
keycloak:
...
environment:
DB_VENDOR: MYSQL
DB_ADDR: 192.168.0.23 --> Change here
DB_DATABASE: keycloak
DB_SCHEMA: keycloak
DB_USER: keycloak
DB_PASSWORD: K&ycl0ak
KEYCLOAK_USER: admin ## Administrative access
KEYCLOAK_PASSWORD: admin ## Administrative access
...
```
### Fourth step
#### restore database folder backup
```
cd database
mysql -u keycloak -p keycloak < keycloak.sql
```
### Fifth step
#### Change domain in nginx file
Edit the file located in the conf/nginx/api.conf directory and modify the server name domain
```
server_name api.local.com;  --> api.your_domain.com
```
### Sixth step
#### Change the .env in the api directory to connect to the database
```
DB_CONNECTION=mysql
DB_HOST=192.168.0.10 --> put mysql ip here
DB_PORT=3306
DB_DATABASE=jump_park
DB_USERNAME=root
DB_PASSWORD=password  --> change your password here
```
### Last step
#### Create Laravel log volumes
```
sudo mkdir -p /var/log/laravel/jump_park
sudo mkdir -p /var/log/laravel/jump_park/{framework,logs}
sudo chmod 775 /var/log/laravel
sudo chmod 775 /var/log/laravel/* -R
sudo chown www-data.docker /var/log/laravel/
sudo chown www-data:docker /var/log/laravel/* -R
```

### And finally ...
```
cd jump_park
docker-compose up -d
```
