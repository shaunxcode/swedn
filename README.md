swedn
=====



#What is this? 
sweet expressions for EDN. Lets just jump into an example:

    ;swedn
    :cats
      :cordelia
        :name "cordelia" ;when we find one item after a key we assume it is just that item
        :age 6
      :tofu 4
      :margaret 3
    :dogs
      :schnitzel
        :favorite-toys :ball1 :ball2 :ball3 ;vector of 3 items
        :friends [:margaret] ;implicit vector of one item

    ;edn
    {:cats {
       :cordelia {
           :name "cordelia"
           :age 6}
       :tofu 4
       :margaret 3}
     :dogs {
       :schnitzel {
         :favorite-toys [:ball1 :ball2 :ball3]
         :friends [:margaret]}}}
    
    
Hopefully from the above it is apparent that we are implicitly in a Map as (for me at least) this is my most common way of using EDN. 

If we find a single item after a key we assume it represents itself. If we find more than 1 we assume it is a vector. If you explicitly want a list you need to express that, the same goes for sets. All other normal edn values and parsing apply. 

