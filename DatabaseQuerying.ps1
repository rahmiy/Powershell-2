## Powershell query without a variable
sqlcmd -S OurServer -d OurDatabase -Q "SELECT TOP 1 * FROM OurTable"

## Store a query in a variable
$query = "SELECT TOP 1 * FROM Sentiment"

## Refer to the variable in our connection and query
## -S put the name of our server
## -d put the name of our database
## -Q put the name of our query - in this case it's a variable
sqlcmd -S OurServer -d OurDatabase -Q $query