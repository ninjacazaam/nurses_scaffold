# General Takeaways

  **Naming conventions** are not super readable in it's current state
    - For example there are two files called rostering.rb

  **File Structure** is not very clear from the offset
  Massive clue in Ento (our rostering system)
  - The roster object is the whole roster for the date range (1 week).
  - Each roster has days and shifts included
  - https://au.ento.com/roster-builder/#/view/xxxxxx/rostering/normal/role?modeRef=base
  -Roster-builder is the parent, roster is the object

  **Slop?**
  - This was not only a gem I was unfamiliar with but also a concept
  - Had I built from scratch I would probably have had a router/controller pattern
  - This would have asked the input from the user within the app (start date etc)
  - This could give us the ability to CRUD the nurses file, and CRUD the Roster objects

  **Modules** seem to be very spread out. If I had built from scratch I would
  make it more like MVC from Le Wagon examples. This is also because the use
  of modules isn't super clear to me

# General cleanup -
 - Put arguements in to parentheses for methods that are missing it
 - added pry-byebug to gemfile (to see what is occuring)
 - Added initialise to the Roster model

# Notes that helped me

  https://www.kcoleman.me/rails,/ruby/2015/06/03/rails-patterns-builders-and-models.html


  Proposed Structure:


  Roster:
          {
            date: {
              morning: [nurses],
              evening: [nurses],
              night: [nurses]
              },
            date: {
              morning: [nurses],
              evening: [nurses],
              night: [nurses]
              },
            date: {
              morning: [nurses],
              evening: [nurses],
              night: [nurses]
              }
          }
