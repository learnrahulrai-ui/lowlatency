# 03 - Hudson River Trading: Inside@HRT Order Book Workshop

**Status:** Official public workshop exercise. Not a verified recruitment take-home.
Source: https://github.com/hudson-trading/inside-at-hrt

## Setup
```
git clone https://github.com/hudson-trading/inside-at-hrt.git
cd inside-at-hrt
cat Book.py
cat MatchingEngine.py
cat run_test.sh
./run_test.sh -c
```
The repository provides unfinished Python functions, order-event definitions, reference-output comparison, and an optional matching engine.

## Flags
- `-c` small correctness test
- `-t` timing
- `-r` full input
- `-m` matching-engine extension

## First work
Maintain orders, process changes, return best bids and asks in the required order.

## Thought exercise
```
Add 100
Book 100
Cancel 30
Book ?
```
1. Determine the remaining quantity.
2. Investigate: two orders have the same price and the earlier order is updated. What should happen to time priority?

## Extra
Re-implement the same book in C++ and compare against the reference output.
