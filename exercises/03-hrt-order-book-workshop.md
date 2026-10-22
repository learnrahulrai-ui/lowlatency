# 03 - Hudson River Trading: Inside@HRT Order Book Workshop

**Status:** Official public workshop exercise. Not a verified recruitment take-home.
FOLLOW-UP: VERIFY: Identify one primary record that would establish or contradict this assertion.
Source: https://github.com/hudson-trading/inside-at-hrt
FOLLOW-UP: VERIFY: Locate the exact supporting sentence in the original source.

## Setup
```
git clone https://github.com/hudson-trading/inside-at-hrt.git
cd inside-at-hrt
cat Book.py
cat MatchingEngine.py
cat run_test.sh
./run_test.sh -c
```
FOLLOW-UP: DRAW the initial state represented by this code example.
The repository provides unfinished Python functions, order-event definitions, reference-output comparison, and an optional matching engine.
FOLLOW-UP: CALCULATE: Recompute one stated time conversion using only the stated quantities.

## Flags
- `-c` small correctness test
FOLLOW-UP: VERIFY: Identify one primary record that would establish or contradict this assertion.
- `-t` timing
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
- `-r` full input
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.
- `-m` matching-engine extension
FOLLOW-UP: DERIVE: Write the first independently checkable premise of the assertion.

## First work
Maintain orders, process changes, return best bids and asks in the required order.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.

## Thought exercise
```
Add 100
Book 100
Cancel 30
Book ?
```
FOLLOW-UP: DRAW the initial state represented by this code example.
1. Determine the remaining quantity.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
2. Investigate: two orders have the same price and the earlier order is updated. What should happen to time priority?
FACT CHECK: The HRT optional MatchingEngine specification rejects an update that increases size; do not assume a size increase merely loses priority. https://github.com/hudson-trading/inside-at-hrt
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.

## Extra
Re-implement the same book in C++ and compare against the reference output.
FOLLOW-UP: CALCULATE: Apply the first described event and write only the resulting quantity.
