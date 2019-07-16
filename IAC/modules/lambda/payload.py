import boto3
import time
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def handler(event, context):
    path = event["path"]
    method = event["method"]
    status = event["status"]

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
    return 200