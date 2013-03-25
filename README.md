swedn
=====



#What is this? 
sweet expressions for EDN. Lets just jump into an example:

    ;swedn
    :cats
      :cordelia
        :name "cordelia" 
        :age 6
      :tofu 4
      :margaret 3
    :dogs
      :schnitzel
        :favorite-toys :ball1 :ball2 :ball3 
        :friends [:margaret] 

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
    
    
Hopefully from the above it is apparent that we are implicitly in a Map as (for me at least) this is my most common use-case with for EDN.  

If we find a single item after a key we assume it represents itself. If we find more than 1 we assume it is a vector (this means if you want a vector of one item as the value in a map you need to explicitly do [item]). If you explicitly want a list you need to express that, the same goes for sets. All other normal edn values and parsing apply. 

