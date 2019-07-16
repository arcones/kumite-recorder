import boto3
import time
import logging


def handler(event, context):
    path, method, status = get_parameters(event)


    dynamodb = boto3.client('dynamodb')
    dynamodb.put_item(TableName='Exchange',
                      Item={
                          "Id": {"N": str(int(time.time()))},
                          "Request":
                              {"M": {
                                  "Path": {"S": "cats"},
                                  "Method": {"S": "GET"}
                              }
                              },
                          "Response":
                              {"M": {
                                  "Status": {"N": "200"}
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
