<img src="public/images/moon_logo.svg" alt="Logotype" height="80px" width="80px">

# MOONLIGHT SYSTEM

### Info
coming soon...
### Install
<b>Clone repository</b>
```
git clone https://github.com/san4o101/moonlight
cd moonlight
```
<b>Install gem</b>
```
bundle install
```
<b>Setup env variables.</b> <br>
Open ```.bashrc``` file
```
nano ~/.bashrc
```
Insert to end file:
```
export DATABASE_USERNAME=""
export DATABASE_PASSWORD=""
export MOONLIGHT_DATABASE_DEV=""
export MOONLIGHT_DATABASE_TEST=""
export MOONLIGHT_DATABASE_PROD=""
export MOONLIGHT_DATABASE_URL=""
export MAILER_HOST=""
export MAILER_PORT=""
export MAILER_USER=""
export MAILER_PASSWORD=""
```
Or create ```.sh``` script and run this <br>
<b>Heroku env variables</b><br>
```
heroku config:set GITHUB_USERNAME=""
```
<b>Database and migration</b> <br>
Create database
```
rails db:create
```
Create migrations
```
rails db:migrate
```
<b>Start server</b>
```
rails s
```
### Tests
coming soon...
### Start app
coming soon...