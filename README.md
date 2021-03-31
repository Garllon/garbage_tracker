# Garbage Tracker

... is a rails based web application to allow its users to track their garbage
amounts.

This project is completely experimental, work-in-progress and more of a hobby
as of now. **Use at your own risk!**

## Getting started

To get things running *locally* for the firtst time you have to set up the
stack on your development machine:

```
$> docker-compose up  
$> docker exec web rake db:setup  
$> docker exec web rake db:seed
```

Point your browser to http://localhost:8046 and you will be presented the login
form.

You can now log in with the demo credentials:

User: **blubber@example.com** - password: **Test1234**

### Containers, Piles, what?

First, go ahead and define a container. A **container** is *containing* your
garbage. A good example would be a "Kitchen Waste Container" that gets created
with a weight of 700 grams.

After you have created at least one container, you can start tracking the
garbage you deal with.

A **pile** is something you would carry from your flat to your household waste
container. This is what gets aggregated over time. Whenever you track a pile
the net weight is tracked (meaning: you enter the pile's weight in grams and
what gets tracked in the statistics is the weight minus the *container's*
weight).

Check out the [Graphs](http://localhost:8046/graphs) section of the site to
track your monthly waste.

## Images

The images i am using i got from the
[https://thenounproject.com/](https://thenounproject.com/)

Audits?
https://evilmartians.com/chronicles/logidze-1-0-active-record-postgresql-rails-and-time-travel
