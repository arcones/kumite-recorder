import boto3
import time
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def handler(event, context):
    logger.info("{}".format(event))
    path, method, status = get_parameters(event)


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


def get_parameters(event):
    logger.info("body: : {}".format(event.body))
    body = event.body
    path = body.path
    method = body.method
    status = body.status
    return (path, method, status)
