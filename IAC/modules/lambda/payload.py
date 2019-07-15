import boto3

def handler(event, context):
    dynamodb = boto3.client('dynamodb')
    dynamodb.put_item(TableName='KumiteRecords', Item={'Id':{'N':'12345'},'Timestamp':{'N':'34792347'}})
