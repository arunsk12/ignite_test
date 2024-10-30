docker-compose up --build

docker build -t apache-ignite-demo .

docker run -p 10800:10800 -p 47500:47500 apache-ignite-demo

docker run -it --rm apache-ignite-demo /bin/bash

mvn clean compile 

mvn exec:java -D"exec.mainClass=IgniteThinClient" -X


pip3 install pyignite



Added maven plugin like below but getting java.lang.reflect.InaccessibleObjectException: Unable to make field long java.nio.Buffer.address accessible: module java.base does not "opens java.nio" to unnamed module


		  <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <configuration>
                    <forkCount>1</forkCount>
                    <reuseForks>false</reuseForks>
                    <argLine>
					--add-opens=java.base/jdk.internal.misc=ALL-UNNAMED \
					  --add-opens=java.base/sun.nio.ch=ALL-UNNAMED \
					  --add-opens=java.management/com.sun.jmx.mbeanserver=ALL-UNNAMED \
					  --add-opens=jdk.internal.jvmstat/sun.jvmstat.monitor=ALL-UNNAMED \
					  --add-opens=java.base/sun.reflect.generics.reflectiveObjects=ALL-UNNAMED \
					  --add-opens=jdk.management/com.sun.management.internal=ALL-UNNAMED \
					  --add-opens=java.base/java.io=ALL-UNNAMED \
					  --add-opens=java.base/java.nio=ALL-UNNAMED \
					  --add-opens=java.base/java.util=ALL-UNNAMED \
					  --add-opens=java.base/java.util.concurrent=ALL-UNNAMED \
					  --add-opens=java.base/java.util.concurrent.locks=ALL-UNNAMED \
					  --add-opens=java.base/java.util.concurrent.atomic=ALL-UNNAMED \
					  --add-opens=java.base/java.lang=ALL-UNNAMED \
					  --add-opens=java.base/java.lang.invoke=ALL-UNNAMED \
					  --add-opens=java.base/java.math=ALL-UNNAMED \
					  --add-opens=java.sql/java.sql=ALL-UNNAMED
					</argLine>
                </configuration>
            </plugin>
			
		  
