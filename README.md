Kanbanery Feedback
==================
Simple Ruby application for reporting bugs directly into kanbanery.

It is a plain rack application.

To set up your project edit configu.ru.

To modify form edit public/bug.html. Fields added to fieldset 'Bug report' will be automatically joined in the description part of Kanbanery ticket. Validation of user input is possible with jquery validation plugin.

Checkout python version on **@pybug branch** and php version on **@phpbug branch** or the java version (SpringMVC/Janbanery) on **@javabug** branch, the ruby version sitts on the **@master branch**.

Styles and graphics by http://github.com/mariusz

Java Version
------------
Kanbanery-Feedback is using **Janbanery** (https://github.com/ktoso/janbanery) to perform it's
