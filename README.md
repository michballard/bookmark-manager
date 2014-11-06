| [Makers Academy](http://www.makersacademy.com) | Week 5 |
| ------ | ------ |

Bookmark Manager
================

Bookmark manager was created to learn about relational databases and object relational mapping.  It allows a user to create a bookmark link and add a comment.  Users can sign up and sign into the bookmark manager website.  

<strong>Screenshot view:</strong>
![Screenshot](/images/screenshot.png)

## How to view this app
[View Bookmark Manager on Heroku]

## How to run this app

Clone this repository:
```shell
$ git clone git@github.com:michballard/bookmark-manager.git
```

Install the required gems:
```shell
$ bundle install
```

Create databases in postgresql:
```shell
$ psql

# CREATE DATABASE "bookmark_manager_test";
# CREATE DATABASE "bookmark_manager_development";
# \q

```

Start server from command line:
```shell
$ rackup
```

View app in browser by typing:
```
localhost:9292
```

[View Bookmark Manager on Heroku]:http://morning-badlands-8105.herokuapp.com/