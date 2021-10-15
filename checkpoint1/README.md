Data Science Seminar - The Brave Ducks

Patrick Pei, Danhua Lu, Numair Ahmed

# Checkpoint 1: Relational Analysis
## Questions

Question 0: How many people are living in low, middle, high income neighborhoods?

Question 1: Using our definition of types of “income neighborhood", what is the total number of officer allegations for all low, middle, high income neighborhoods?

Question 2: What is the rate of increase for officer complaints for low, middle, high neighborhoods between 2002-2007 and 2007-2012 timeframes, 2007-2012 and 2012-2017 timeframes? 

Question 3: What is the percentage of misconduct allegations (illegal search, use of force, etc) out of all allegations for these low, middle, high neighborhoods?

Question 4: Among the officer allegations with complaints filed in the low, middle, high neighborhood, what percentage of the cases are dismissed?

## How to run the code
We use PostgreSQL and DataGrip as our setup to run and test the code.

You can run our code using the following steps:
1. In terminal, setup PostgreSQL database and load the CPDP data.
2. Use DataGrip to connect to localhost:5432 and used PostgreSQL driver.
3. Make sure the schema is set to cpdp.
4. Paste the code into the console and run the queries. (Make sure you select the whole block between the commented line indicating different timespans.)
5. The result will show in tabs in Datagrip.


## Code Results Format
For all the questions, the code has several queries that attempt to answer the question

with respect to low, middle and high income neighborhoods.
