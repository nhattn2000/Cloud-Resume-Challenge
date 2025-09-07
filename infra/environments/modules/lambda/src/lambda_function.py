"""Lambda: increments/reads the page view counter in DynamoDB.

Env:
- TABLE_NAME: DynamoDB table name
"""
import json
import boto3

import os

dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
table = dynamodb.Table(os.environ['TABLE_NAME'])


def lambda_handler(event, context):
    response = table.get_item(Key={'ID': '1'})
    pageViews = int(response['Item']['pageViews'])
    pageViews += 1

    table.update_item(
        Key={'ID': '1'},
        UpdateExpression='SET pageViews = :val',
        ExpressionAttributeValues={':val': pageViews}
    )

    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': 'https://tien-cloud.com'
        },
        'body': json.dumps({'pageViews': pageViews})
    }
