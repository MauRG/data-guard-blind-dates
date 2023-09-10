# DataGuard Blind Dates

## Summary
This application is for the coding challenge part of the interview process for DataGuard.

The application should be used to organize Blind Dates on Fridays where random people get together to have lunch as an ice breaker.

## How to run
The application is ready to run in a docker container, to run it you need to have Docker Compose installed.
To launch the application execute
> docker compose up

When running for the first time, to set up the database:
- after the docker container is running, execute from another terminal
> docker compose run web rails db:create
> docker compose run web rails db:migrate
> docker compose run web rails db:seed

This will trigger the docker to compose command which will build the container, if necessary, and launch both the database and application.

The application can be accessed from your local browser under `http://localhost:3000`
The endpoints:
> POST /blind_date/:week
AND
> GET /blind_date/:week

Will be available to be called

## Assumptions
- No validation for week, the same week can be triggered more than once and that will make a mess
- Leaders are chosen at random as a last step
- The distribution is done like children choosing a footbal team by filling them one by one to better distribute between departments
    - This means that the distribution depends on the initial set. So if the set is the same the order will be the same. My thoughs to randomize this was using the confirmation time as a second ordering parameter to randomize the list.
    - In the end i don't think i did a good job with the distribution as it became too deterministic, for what i did to work would require creating sets of users by department and shuffling this sets before distributing.
- There is a database seed but no CRUD to manage employees
- The rendering is not good because the `leader` information is in the join table and the default JSON serializer is being used. All the information is there but not in the nicest formating
- The bonus requirements were not done because of time constraints, but i do believe the modeling would easily accept the new requirements

## Implementation Notes (Though Process)
- 1 of the users is designated as Leader
- Endpoint to generate BlindDates of `N` size for a week `W`
- Endpoint to list BlindDates of a week `W`
- Users belong to a department

- Week
    - has many blind dates (MVP can be just a identifier)
- BlindDate
    - belongs to Week
    - has many users
    - has one leader
- Employee
    - belongs to a department (Or identifier)
- Department
    - Can be just a string or enum initialy

- Create blind dates {:week, :size}
    - designate of blind date of size
    - Pick users per department
    - MVP - Pick random users in departments
    - Count how many unbalanced BlindDates to have (+1 or -1 users)
    - Watch out for bigger group that number of users corner case

### Bonus requirements (Planning)
- Participation for the week requires intermediate table, employee/week. Or an invite table that belongs to user
- Add Employee endpoint is lowest priority due to time constraints and since it is just an improvement of the seeding process instead of new feature