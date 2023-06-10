main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    ns_temp <- getContents
    -- sum a list of big numbers, show first 10 digits
    -- Integer type handles big ints
    let ns = map (read::String->Integer) $ words ns_temp
    -- sum, show converts to string/list of char, take first 10
    putStrLn $ take 10 $ show $ sum ns
