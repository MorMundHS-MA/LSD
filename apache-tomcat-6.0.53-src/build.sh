#! /bin/sh
mvn clean compile package
mkdir -p target/webapps
cp engine/target/engine-6.*-with-dependencies.jar target
cp */target/*.war target/webapps
cp -r engine/conf target
