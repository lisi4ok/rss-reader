# RSS Reader
Ruby on Rails application that reads XML Feeds and Sync it to database.


##Installation

###Clone the project
```
git clone https://github.com/lisi4ok/rss-reader.git
cd rss-reader
```

```
bundle update
yarn update
```
or
```
bundle install
yarn install
```

```
rails server -b 0.0.0.0
```

### Migrate and Seed

Datanase Driver is mysql2!

Change DB password on:
```
__APP_FOLDER_/config/database.yaml
```


```
rails db:migrate
```

```
rails db:seed
```

##Usage

###Sync Feed Items
```
rake sync:feeds
```

### Run Tests
```
bundle exec rspec
```

See Test coverage on:
```
file:///__PATH__/rss-reader/coverage/index.html#_AllFiles
```