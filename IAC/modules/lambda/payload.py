import boto3

def handler(event, context):
    dynamodb = boto3.client('dynamodb')
    dynamodb.put_item(TableName='Exchange', Item={'Id':{'N':'12345'},'Request':{'Path':{'S': 'cats'}, 'Method':{'S': 'GET'}, 'Response':{'Status':{'N':'200}}}})
