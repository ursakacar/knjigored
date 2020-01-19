# KNJIGORED
Knjigored (portmanteau of Slovenian words knjiga (book) and red (order)) is a simple RoR application, built to assist my wonderful mom with organizing her small local library.

It was build with simplicity and clarity in mind and UI was fully translated to Slovenian. After all, it is used by an 70+ years old lady, bless her golden heart. 

Knjigored is hosted on Heroku and all new changes get automatically deployed when they are pushed to `production` branch. Because I am on free-tier with limited dyno hours, I am not pasting the link here, but it should not require one to have a PhD degree to figure it out.

Slovenian instructions, written with its end user in mind, can be found here [Knjigored: Navodila za uporabo](./instructions/instructions.md).


## Known issues
BUG: Field with errors not shown for author input field if author is missing
BUG: Can't edit author in books controller
FEATURE: Easily filter out borrowed books