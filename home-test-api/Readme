#Pull the docker image containing the api
docker pull automaticbytes/demo-app

#Run the image
Open Docker app
docker run -p 3100:3100 automaticbytes/demo-app

#Run tests script
mvn test -Dtest=InventoryRunner

#Run only one test
mvn test -Dkarate.options="--tags @getAllItems"

#Run smoke test
mvn test -Dkarate.options="--tags @getAllItems&@smoke"

#Open report
file:///C:/Users/Usuario2024/Documents/Celara/home-test-api/target/karate-reports/karate-summary.html

#clean data in docker
docker rm -f demo-api
docker run -d -p 3100:3100 --name demo-api automaticbytes/demo-app

