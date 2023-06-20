TESTING API END POINT WITH CURL

GET
curl -v http://localhost:8082/spring-rest/foos/9

POST

curl -d @iconos.json -H "Content-Type: application/json" http://localhost:3000/api/icons/add
