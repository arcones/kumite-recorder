import boto3
import time


def handler(event, context):
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
