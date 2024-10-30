This demo is purely from the technical aspect on how to spin ignite clusters, create and use the cache along with the sql features. 


docker-compose up --build

docker-compose images 

docker-compose ps 

mvn clean compile 

mvn exec:java -D"exec.mainClass=IgniteThinClient" -X

pip3 install pyignite

python .\PyClient.py

python .\IgniteSqlClient.py
