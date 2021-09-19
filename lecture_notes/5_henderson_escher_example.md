# Henderson Escher Example

Now we are going to check out how to build a language embedded
into lisp which allows us to manipulate images.

First off, we want to create means of combination that are characterized
by "closure". This means that the means of combinations produce results
that can be again combined with the same means of combination.

Having means of combinations which are characterized by "closure"
is a good test to check if our means of combinations are robust.

Also because means of combinations with "closure" allow us to build
up complexity easily.

NOTE: Try to implement in source code the language as the Prof does
then try to do the same thing without pictures represented as
procedures returning procedures.


About Software Engineering: People tend to think that software
should be designed as a sort of strict tree where each component
has its own purpose and scope.
This is not the best approach when it comes to designing systems,
especially software. In software design we want to create layers
of languages which allow a more robust and flexible structure.

In the case of the Henderson Escher drawing program for example
we would have a lower layer language dealing with primitive
pictures, an intermediate language dealing with geometric positions
and an higher language which encodes the schemes of combinations for
our pictures.
Each layer depends on the lower layer and does not encode information
for the above layer.

Having languages to describe our problem is more flexible to the change
of the problem and allows small edits to be performed to small change
of the problem. 
Having layers of languages also allows us to have different vocabularies
to talk about the design at different levels. 

On the contrary, a fixed tree structure for our software may collapse
also for small changes in the nature of the problem.

To recap, building layers of languages allows us to have a full range
of linguistic power at each level, so each level is set up to talk
about a whole range of things and not a specific task.

In our discussion by "robust" we mean that, by changing the description
of the problem the methodology will allow to capture that change.

To conclude:
Layers of Languages is more powerful with respect to strict hierarchy.
The design process should be to implement languages instead of implementing
programs.
