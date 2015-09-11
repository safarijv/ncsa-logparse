module Types where


import Data.Word (Word8)
import qualified Data.ByteString.Char8 as BC (ByteString)
import Data.Time (ZonedTime)


-- |IP Address
data IP = IP Word8 Word8 Word8 Word8 deriving (Eq)


instance Show IP where
	show (IP b1 b2 b3 b4)
						= show b1 ++ "."
					   ++ show b2 ++ "."
					   ++ show b3 ++ "."
					   ++ show b4


-- |Type synonym
type URL = BC.ByteString


-- |Possible HTTP methods
data HTTPMethod = Get | Post | Put | Delete | Options | Head | Trace | Connect deriving (Show, Eq)


-- |Possible protocols
data Protocol = HTTP | HTTPS | FTP deriving (Show, Eq)


-- |Protocol version representation
data ProtocolVersion = ProtocolVersion {
	majorVersion :: Int,
	minorVersion :: Int
} deriving (Show, Eq)


-- |A single log line
data LogEntry = LogEntry {
	ip 		   :: IP,
	identity   :: Maybe BC.ByteString,
	userid     :: Maybe BC.ByteString,
	timestamp  :: ZonedTime,
	method     :: Maybe HTTPMethod,
	url        :: URL,
	proto      :: Maybe Protocol,
	protoVer   :: ProtocolVersion,
	status     :: Maybe Int,
	byteSize   :: Int
} deriving (Show)


-- |A parsed log file (i.e. a list of line records)
type Log = [LogEntry]


