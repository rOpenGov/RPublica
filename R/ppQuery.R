ppQuery <-
function(op, baseurl, fmt='json', args=NULL, ...){
    url <- paste(baseurl, op, '.', fmt, args, sep='')
    response <- getURL(url, cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"), 
                    followlocation = 1L, ssl.verifypeer = 1L, ssl.verifyhost = 2L, ...)
    if(fmt=='xml')
        response <- xmlToList(response)
    else if(fmt=='json')
        response <- fromJSON(response)
    return(response)
}
