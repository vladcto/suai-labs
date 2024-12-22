#!/usr/bin/env bash
mysql.server start
mysql -u rootINSERT INTO Users (username, password_hash)