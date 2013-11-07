# nhs-tool-codegen

## What is this project about?

*"Exploring the potential benefits of code generation and Domain Specific Languages (DSLs) to reduce 
duplication of effort and improve quality"*

In the worlds of software development we too often find ourselves producing repetitive "boilerplate" code.
One approach to reducing this duplication, and one that is often overlooked, is code generation.

A potential use of code generation is in the creation of simple quizzes and questionnaires, such as the 
["Myth buster tools" on NHS Choices](http://www.nhs.uk/tools/Pages/Toolslibrary.aspx?Tag=Myth+busters).
These "Myth busters" follow a common pattern of true-or-false questions about a health topic, such as 
alcohol or hair loss, plus a list of links to more in-depth information about the topic.

This project explores using Ruby to create an [internal DSL](http://martinfowler.com/bliki/DomainSpecificLanguage.html)
to define the "code" to be generated.  The "code" in this case is HTML markup that is combined with static (i.e. not 
generated) JavaScript/jQuery to create the complete interactive quiz.

For the first iteration, the NHS Choices ["Alcohol"](http://www.nhs.uk/Tools/Pages/alcohol-myths.aspx?Tag=Myth+busters)
and ["Food allergy"](http://www.nhs.uk/Tools/Pages/Food-allergy-myth-buster.aspx?Tag=Myth+busters) myth busters will be 
used as the basis, with the aim of creating a JavaScript version with comparable functionality, albeit not so pretty.

***

For more details see the [project wiki](https://github.com/ullet/nhs-tool-codegen/wiki).
