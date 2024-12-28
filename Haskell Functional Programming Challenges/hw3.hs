myremoveduplicates :: (Eq a) => [a] -> [a]
myremoveduplicates start
    | start == [] = []
    | otherwise  = if elem (head start) (tail start) 
                then myremoveduplicates(tail start)
                else head start : myremoveduplicates(tail start)

myremoveduplicates_pm :: (Eq a) => [a] -> [a]
myremoveduplicates_pm [] = []
myremoveduplicates_pm (x:xs) 
    | elem x xs = myremoveduplicates_pm xs
    | otherwise =  x : myremoveduplicates_pm xs 

myintersection :: (Eq a) => [a] -> [a] -> [a]
myintersection list1 list2 
    | list1 == [] = []
    | otherwise = if elem (head list1) (list2)
                    then (head list1) : (myintersection(tail list1) list2)
                    else (myintersection(tail list1) list2)

myintersection_pm :: (Eq a) => [a] -> [a] -> [a]
myintersection_pm [] _ = []
myintersection_pm (x:xs) list2 
    | elem x list2 = x : myintersection_pm xs list2
    | otherwise  = myintersection_pm xs list2

mynthtail :: (Eq a) => Int -> [a] -> [a]
mynthtail n list 
    | list == [] = []
    | otherwise = if n == 0 then list
                    else mynthtail (n-1) (tail list) 

mynthtail_pm :: (Eq a) => Int -> [a] -> [a]
mynthtail_pm _ [] = []
mynthtail_pm n (x:xs) 
    | n == 0 = x:xs
    | otherwise  = mynthtail_pm (n-1) (xs) 

mylast :: [a] -> [a]
mylast list
    | null list  = []
    | otherwise = if (null (tail list)) then [(head list)]
                  else mylast (tail list)

mylast_pm :: [a] -> [a]
mylast_pm [] = []
mylast_pm (x:xs)
    | null (xs) = [x]
    | otherwise = mylast_pm (xs)

reverse_helper :: [a] -> [a] -> [a]
reverse_helper list acc
    | null list = acc
    | otherwise  = reverse_helper (tail list) (head list : acc) 

myreverse :: [a] -> [a]
myreverse list 
    | null list = list 
    | otherwise = reverse_helper list []

reverse_helper_pm :: [a] -> [a] -> [a]
reverse_helper_pm [] acc = acc
reverse_helper_pm (x:xs) acc = reverse_helper_pm (xs) (x : acc) 

myreverse_pm :: [a] -> [a]
myreverse_pm list 
    | null list = list 
    | otherwise = reverse_helper_pm list []

myreplaceall :: (Eq a) => a -> a -> [a] -> [a]
myreplaceall a b list
    | null list = list
    | otherwise = if head list == b 
                    then a : myreplaceall a b (tail list)
                    else (head list) : myreplaceall a b (tail list)

myreplaceall_pm :: (Eq a) =>  a -> a -> [a] -> [a]
myreplaceall_pm _ _ [] = []
myreplaceall_pm a b (x:xs)
    | x == b =  a : myreplaceall_pm a b (xs)
    | otherwise = x : myreplaceall_pm a b (xs)

myordered :: (Ord a) => [a] -> Bool
myordered list
    | null list = True
    | null (tail list) = True
    | otherwise = if (head list) > (head (tail list))
                    then False
                    else (myordered (tail list))

myordered_pm :: (Ord a) => [a] -> Bool
myordered_pm [] = True 
myordered_pm (x:xs)
    | null (xs) = True
    | otherwise = if (x) > (head (xs))
                    then False
                    else (myordered (xs))

cert :: Int -> Int
cert credit_hour = 700 + 300*credit_hour

senior :: Int -> Int
senior credit_hour -- 100(6 or fewer) + 50*credit_hour
    | credit_hour <= 6 = 100
    | otherwise =100 + 50*(credit_hour-6)
degree :: [String] -> Int -> Int
degree list credit_hour  -- ((150 + 275*credit_hour(max 12)) - finaid) > 0 else 0
    | null list = 0
    | qfinaid == "Y" = degree_fin credit_hour (read ((head (mynthtail 3  list))) :: Int)
    | otherwise = if credit_hour < 13 then (150 + 275*(credit_hour)) else 3450
    where 
        qfinaid = head (mynthtail 2  list)
degree_fin :: Int -> Int -> Int
degree_fin credit_hour finaid -- ((150 + 275*credit_hour(max 12)) - finaid) > 0 else 0
    | cost > finaid = cost - finaid
    | otherwise = 0
    where 
        cost = if credit_hour < 13 then (150 + 275*(credit_hour)) else 3450

parser :: [Char] -> [[Char]]
parser chunk 
    | null chunk  = [""]
    | otherwise = if (head chunk) == ';'
                    then "" : parser (tail chunk)
                 else (head chunk : head (parser (tail chunk))) : tail (parser (tail chunk))

newsort :: [[Char]] -> Int
newsort input
    | null input = 0
    | qdegree == "Y" = degree (info) credit_hour
    | otherwise = if (head info) == "C"
                    then cert credit_hour
                    else senior credit_hour
    where 
        credit_hour = read (head input) :: Int
        qdegree = head (tail input) 
        info = tail (tail input)

computeFees :: [Char] -> Int
computeFees info
    | null info = 0
    | otherwise = newsort (mynthtail 4 (parser info))