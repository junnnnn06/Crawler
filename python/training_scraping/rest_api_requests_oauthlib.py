import os

from requests_oauthlib import OAuth1Session

#環境変数から認証情報を取得する
CONSUMER_KEY = os.environ['CONSUMER_KEY']
CONSUMER_SECRET = os.environ['CONSUMER_SECRET']
ACCESS_TOKEN = os.environ['ACCESS_TOKEN']
ACCESS_TOKEN_SECRET = os.environ['ACCESS_TOKEN_SECRET']

#認証情報をつかってOAuth1Sessionオブジェクトを得る
twitter = OAuth1Session(CONSUMER_KEY,
                        client_secret = CONSUMER_SECRET,
                        resource_owner_key = ACCESS_TOKEN,
                        resource_owner_secret = ACCESS_TOKEN_SECRET)

#ユーザーのタイムラインを取得
response = twitter.get('https://api.twitter.com/1.1/statuses/home_timeline.json')

for status in response.json():
    print('@' + status['user']['screen_name'], status['text'])
