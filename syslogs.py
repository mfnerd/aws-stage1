import gzip
import json
import boto3
from base64 import b64decode

s3 = boto3.client('s3')
bucket_name = 'nippon-syslogs-bucket'

def lambda_handler(event, context):
    for record in event['records']:
        payload = gzip.decompress(b64decode(record['data']))
        log_event = json.loads(payload)
        log_data = "\n".join([event['message'] for event in log_event['logEvents']])
        file_name = f"syslog-{log_event['logGroup']}-{context.aws_request_id}.log"
        s3.put_object(Body=log_data, Bucket=bucket_name, Key=file_name)
    return {'statusCode': 200}
