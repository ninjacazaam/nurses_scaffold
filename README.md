# Nurse Rostering

## Challenge

In a hospital environment, nurses work a rotating shift system. There are three work shifts per day; a morning shift, an evening shift and a night shift. Each day, all three shift needs to be filled.

You have been tasked with developing a rostering system which can calculate and output the nursing roster for any specified month.

A list of rosterable nurses has been provided in the file spec/functional/nurses.txt.

## Considerations

- 5 nurses need to be on staff for each shift.
- Nurses must not be expected to work more than one shift per day.
- To maintain a healthy work/life balance, no nurse can be asked to work for more than 5 days in a row.
- Similarly, no nurse can be expected to work more than five night shifts per month.
- Days off must occur in groups of two or more.

## Running

This app is designed to be from the command line using:

```
ruby rostering.rb
```

Doing so with no params should print out usage information.

## Tests
