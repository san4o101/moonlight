<img src="public/images/moon_logo.svg" alt="Logotype" height="80px" width="80px">
<br>

[![Build Status](https://travis-ci.org/san4o101/moonlight.svg?branch=master)](https://travis-ci.org/san4o101/moonlight)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://badges.mit-license.org)
# MOONLIGHT SYSTEM

### Info
Hello. This is the bank of the future (no). 
Its main functionality is described in my terms of reference, 
which I adhere to.
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
<b>Before use need install gem's:</b> <br>
```
bundle install
```
<b>Run all tests:</b>
```
rspec spec
bundle exex rspec spec
```
<b>Run model tests:</b>
```
rspec spec/models
bundle exex rspec spec/models
```
<b>Run helpers tests:</b>
```
rspec spec/helpers
bundle exex rspec spec/helpers
```
<b>Run jobs tests:</b>
```
rspec spec/jobs
bundle exex rspec spec/jobs
```
### Start app
You are crazy if you want to use IT, buuut I will tell you how to do it. <br>
Take <img src="https://image.flaticon.com/icons/svg/689/689876.svg" height="20px" width="20px"> (tambourine) and proceed.
1. First go [Install] the repository
2. Run [Tests] now

All is well? Amazing! <br>
Now can customize your [Apache2] or [Nginx]. Before need install necessary rails and ruby versions.

Thank you. <br>
P.S. If you want to donate me, contact me on [Instagram]. 

[install]: https://github.com/san4o101/moonlight#install
[tests]: https://github.com/san4o101/moonlight#tests
[apache2]: https://www.digitalocean.com/community/tutorials/how-to-deploy-a-rails-app-with-passenger-and-apache-on-ubuntu-14-04#step-4-%E2%80%94-install-apache
[nginx]: https://www.digitalocean.com/community/tutorials/how-to-deploy-a-rails-app-with-passenger-and-nginx-on-ubuntu-14-04#step-five-%E2%80%94-install-passenger-and-nginx
[instagram]: https://www.instagram.com/sanya._.s