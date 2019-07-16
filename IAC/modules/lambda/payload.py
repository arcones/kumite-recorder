import boto3
import time


def handler(event, context):
    dynamodb = boto3.client('dynamodb')
    dynamodb.put_item(TableName='Exchange',
                      Item={
                          "Id": {"N": "int(time.time())"},
                          "Request": {
                              "Path": {"S": "cats"},
                              "Method": {"S": "GET"}
                          },
                          "Response": {
                              "Status": {"N": "200"}
                          }
                      })