import boto3
import time


def handler(event, context):
    dynamodb = boto3.client('dynamodb')
    dynamodb.put_item(TableName='Exchange',
                      Item={
                          'Id': int(time.time()),
                          'Request': {
                              'Path': 'cats',
                              'Method': 'GET'
                          },
                          'Response': {
                              'Status': 200
                          }
                      })
