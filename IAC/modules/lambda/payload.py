import boto3
import time
import logging
import json

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def handler(event, context):##Si no estoy usando el contexto, igual se puede borrar
    logger.info("The event is {}".format(event))
    logger.info("The event's body is {}".format(event["body"]))


    jsonBody = json.loads(event["body"])

    logger.info("The event's body's path is {}".format(jsonBody["path"]))
    logger.info("The event's body's method is {}".format(jsonBody["method"]))
    logger.info("The event's body's status is {}".format(jsonBody["status"]))


    path = jsonBody["path"]
    method = jsonBody["method"]
    status = jsonBody["status"]

    dynamodb = boto3.client('dynamodb')
    dynamodb.put_item(TableName='Exchange',
                      Item={
                          "Id": {"N": str(int(time.time()))},
                          "Request":
                              {"M": {
                                  "Path": {"S": path},
                                  "Method": {"S": method}
                              }
                              },
                          "Response":
                              {"M": {
                                  "Status": {"N": str(status)}
                              }
                              }
                      })

    response = {
        "statusCode": 200
    }

    return response
