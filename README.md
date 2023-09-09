# DataGuard Blind Dates

## Summary
This application is for the coding challenge part of the interview process for DataGuard.

The application should be used to organize Blind Dates on Fridays where random people get together to have lunch as an ice breaker.

## How to run
The application is ready to run in a docker container, to run it you need to have Docker Compose installed.
To launch the application execute
> docker compose up

This will trigger the docker to compose command which will build the container, if necessary, and launch both the database and application.

The application can be accessed from your local browser under `http://localhost:3000`

## Assumptions


## Notes
During development `Rubocop` was run on the application to keep a standard.

## Implementation Notes
- Organize  BlindDates
- BlindDates contain at most 4 Users
- 1 of the users is designated as Leader
- Endpoint to generate BlindDates of `N` size for a week `W`
- Endpoint to list BlindDates of a week `W`
- Users belong to a department
- Prefer assigning users in differente departments

- Week
    - has many blind dates (MVP can be just a identifier)
- BlindDate
    - belongs to Week
    - has many users
    - has one leader
- Employee
    - belongs to a department

- Create blind dates {:week, :size}
    - designate of blind date of size
    - Pick users per department
    - MVP - Pick random users in departments
    - Count how many unbalanced BlindDates to have (+1 or -1 users)

### Bonus requirements
- Participation for the week requires intermediate table, employee/week
- Add Employee endpoint is lowest priority due to time constraints and since it is just an improvement of the seeding process instead of new feature