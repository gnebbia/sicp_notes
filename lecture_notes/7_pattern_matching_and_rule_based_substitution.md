# Pattern Matching and Rule-Based Substitution

Rules can be described by their parts, for example:
a left hand side and a right hand side.

All rules are composed like this:


                      Rule
    Pattern ------------------------> Skeleton
      |                                  |
      |                                  |
      | match                            | instantiation
      |                                  |
      |                                  |
      V                                  V
  Expression -----------------------> Expression
   Source                              Target


- A pattern is something to be matched;
- A skeleton is something we substitute into in order to get a new expression;
- A source expression is something a pattern can be matched against;
- A target expression is what we obtain once a rule is applied and 
  we instantiate the skeleton;

A rule is something that allows to produce a skeleton when a certain
pattern matches.  The result of the application of the rule is to produce
a new expression which is the Target Expression by the instantiation of
the skeleton.



