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

From roster.rb
------------------------------------

<!--
Roster has many shifts
each shift can belong to one roster?
Each shift has many nurses
nurses can belong to many shifts

According to the text formatter each roster is x shifts for one date
each_shift is going to be a block: yield etc

A Roster is made up of shifts
Each shift has a date
each Shift has nurses
-->

From roster_builder.rb
------------------------------------

<!--
for each day in the date range, generate the three shifts

for each shift in a day, populate with @config[:nurses_per_shift] nurses

Check that the shift is not violating a rule

Return the Roster object to the roster builder

^ this should be done in the roster Model file

^ no it should not

the roster BUILDER should find all the shifts in config and assign nurses to it

below was the old and conveluted way to do this before i realised it was simpler
The reason I used the method below was because i could not figure out how to iterate
over an array and create keys to a hash with dynamically created objects. Clearly
as it turns out it was straightforward

roster_attributes = {}
date_range.each do |date|
  instance_variable_set("@#{date.strftime("%a%m%d%A")}", {})
  @config[:shift_names].each do |shift|
    instance_variable_set("@#{shift}", all_nurses.sample(@config[:nurses_per_shift]))
    instance_variable_get("@#{date.strftime("%a%m%d%A")}".to_sym)["#{shift}".to_sym] = instance_variable_get("@#{shift}")
  end
  roster_attributes["#{date}"] = instance_variable_get("@#{date.strftime("%a%m%d%A")}")
end

roster = {}
date_range.each do |date|
  instance_variable_set("@#{date.strftime("%a%m%d")}", {})
    @config[:shift_names].each do |shift|
      instance_variable_set("@#{shift}", all_nurses.sample(@config[:nurses_per_shift]))
      instance_variable_get("@#{date.strftime("%a%m%d")}")["#{shift}"] = instance_variable_get("@#{shift}")
    end
    roster["#{date}"] = instance_variable_get("@#{date.strftime("%a%m%d")}")
end

^ These need to be key value pairs

Roster: [
          date1: [
                    shift1: [nurses..],
                    shift2: [nurses..]
                    shift..: [nurses..]
                 ]

]
]
-->
