-- vehicles.hs

data Price = Price Integer deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited deriving (Eq, Show)

-- below is put together from the types above 

data Vehicle = Car Manufacturer Price | Plane Airline deriving (Eq, Show)


myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir

-- 1. What is the type of myCar?
-- Answer: Vehicle 

-- 2. Define the functions
isCar :: Vehicle -> Bool
isCar (Car _ _) = True 
isCar _         = False

isPlane :: Vehicle -> Bool
isPlane (Plane _) = True
isPlane _ = False  

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

-- 3. Function to tell the manufacturer
getManu :: Vehicle -> Manufacturer
getManu (Car m _) = m


-- or better with Maybe (jacknicholson solution)
getManu' :: Vehicle -> Maybe Manufacturer
getManu' (Car m _) = Just m
getManu' _         = Nothing


-- 4. In first case, it says non-exhaustive pattern; with Maybe
-- it returns nothing

-- 5. 
data Size = Size Integer deriving (Eq, Show)
data Vehicle2 = Car Manufacturer Price | Plane Airline Size deriving (Eq, Show)  

