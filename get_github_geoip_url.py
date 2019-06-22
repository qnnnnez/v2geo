import requests

GITHUB_API_BASE = 'https://api.github.com'
GEOIP_REPO = 'v2ray/geoip'

releases = requests.get('{}/repos/{}/releases'.format(GITHUB_API_BASE, GEOIP_REPO)).json()
latest = releases[0]
print(latest['assets'][0]['browser_download_url'])
