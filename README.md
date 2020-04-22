# step-functions and lambda example

# prerequisite

```
% cd lambda/helloworld
% make
% cd ../../
% docker-compose up -d
% aws stepfunctions --endpoint http://localhost:8083 create-state-machine --definition "{\
    \"Comment\": \"Hello World\",\
    \"StartAt\": \"HelloWorld\",\
    \"States\": {\
      \"HelloWorld\": {\
        \"Type\": \"Task\",\
        \"Resource\": \"arn:aws:lambda:ap-northeast-1:123456789012:function:HelloWorld\",\
        \"Parameters\": {\
          \"name.$\": \"$.name\"
        },\
        \"End\": true\
      }\
    }\
  }\
  }}" --name "HelloWorld" --role-arn "arn:aws:iam::012345678901:role/DummyRole"
```

# run

```
% aws stepfunctions --endpoint http://localhost:8083 start-execution --state-machine 'arn:aws:states:ap-northeast-1:123456789012:stateMachine:HelloWorld' --input "{\"name\": \"hatajoe\"}"
```
