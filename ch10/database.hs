-- database.hs
{-# OPTIONS -Wno-unused-top-binds #-}
module Database (filterDbDate, filterDbNumber, mostRecent,
    sumDb, avgDb) where

import Data.Time


data DatabaseItem = DbString   String
                    | DbNumber Integer
                    | DbDate   UTCTime
                    deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = 
    [ DbDate (UTCTime
        (fromGregorian 1911 5 1)
    (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime
        (fromGregorian 1921 5 1)
        (secondsToDiffTime 34123))
    , DbNumber 3000
    , DbNumber 2001
    ]

-- 1. Write a function that filters for DbDate values and returns a list
-- of the UTCTime values inside them.

filterDbDate :: [DatabaseItem] -> [UTCTime]
-- solution for this function nicked from nackjicholson, 
-- others written myself
filterDbDate = foldr getTimes []
  where
    getTimes :: DatabaseItem -> [UTCTime] -> [UTCTime]
    getTimes (DbDate time) dates = time:dates
    getTimes _ dates = dates


-- 2. Write a function that filters for DbNumber values and returns a list
-- of the Integer values inside them.

filterDbNumber :: [DatabaseItem]
                -> [Integer]
filterDbNumber = foldr getNumber []
    where 
      getNumber :: DatabaseItem -> [Integer] -> [Integer]
      getNumber (DbNumber intval) nums = intval:nums
      getNumber _ nums = nums

-- 3. Write a function that gets the most recent date.
mostRecent :: [DatabaseItem]
            -> UTCTime 
mostRecent = maximum . filterDbDate

-- 4. Write a function that sums all of the DbNumber values.
sumDb :: [DatabaseItem] -> Integer
sumDb = foldr (+) 0 . filterDbNumber

-- 5. Write a function that gets the average of the DbNumber values.
avgDb :: [DatabaseItem] -> Double
avgDb xs = (fromIntegral . sumDb) xs / (fromIntegral . length . filterDbNumber) xs 
