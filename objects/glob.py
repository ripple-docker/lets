import personalBestCache
import userStatsCache
from common.ddog import datadogClient
from common.files import fileBuffer, fileLocks
from common.web import schiavo
from helpers.aqlHelper import AqlThresholds

try:
	with open("version") as f:
		VERSION = f.read().strip()
except:
	VERSION = "Unknown"
ACHIEVEMENTS_VERSION = 1

DATADOG_PREFIX = "lets"
db = None
redis = None
conf = None
application = None
pool = None
pascoa = {}


# Cache and objects
fLocks = fileLocks.fileLocks()
userStatsCache = userStatsCache.userStatsCache()
personalBestCache = personalBestCache.personalBestCache()
fileBuffers = fileBuffer.buffersList()
dog = datadogClient.datadogClient()
schiavo = schiavo.schiavo()
achievementClasses = {}
aqlThresholds = AqlThresholds()
serverPort = None
