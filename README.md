# Rocky Mountain Floppers Website

The site user/content creator had an unmaintained website and was tasked with maintaining content.
After attempting to use FTP to access and change a large index html file, he was faced with 
many problems.

I made him a small **ruby on rails website** that would allow him to upload pictures to a picture galler, 
show sponsor logos, and make announcments. 
[rockymountainfloppers](rockymountainfloppers.com)

## Stack
This app is built with
Ruby 2.4
Rails 5.1.1
Postgreql Database
Running on Unbutu 16.04 on a DigitalOcean droplet

I started from scratch following tutorials in the Digital Ocean community page.
I noted some stumbling blocks in a note.txt doc.
As in previous projects, I found myself trouble shooting NGINX issues. The passenger documentation is awesome. It includes trouble shooting and step by step guides.

## Start to Finish from 0 to deploy
It took about a week. The first time I did this type of project, it took for ever.(more than a month)
As part of my goal to improve my developer skills, I plan to complete 50 small apps on my github page.
They are great for me to learn and refer to along the way.

### Some good code tidbuts I learned in this project
* Titleize is great but removes dashes from names. In the teams views, there is a fix.
* Putting for loops into columns using bootstrap. See the solution in the teams views
* I had a great time coming up with a calculation for team scores. I refered to the NHRA site for layout.
* See the two methods ... add_team_points ... and ... remove_team_points ... in the event teams controller.
### Models
I had a lot of models with pictures. I decided to have one model for each use case in case I needed to take it out. I started out with the article model intending to have selector fields to determine where to display the content but opted for many models instead.
Models I used 
* article: my first model, ended up as the feeder for a slider. I kept the colums limited to a picture and a description
* race_schedule: for race events
* rule: for race rules, I just create a form for one rule and did an index
* team: for cars in the races (members)
* annuncement: A text only bulletin, to fill in between the slider an the posts. It also helped with creating a welcome message. I added youtube video as an after thought.
* sponsor: for sponsor logos, simple, with info about the sponsor in the back end. (future use to keep up with sponsors)
* news_feed: I used it for a facebook like post. The last side had a ton of posts, over 700 so I created a thumbnail view in the gallery. It showcased the volume and time dated the content. I gave up on trying to capture created at dates and used a year as a string search.
 Compare a very long list of image posts to this. [gallery](http://rockymountainfloppers.com/news_feeds)
 
## Real Users - yeah!
The before and after are amazing. It was the first time they could easily add content. Points for usability.
Not being able to add content to a site where content changed weekly was impossible. They were paying someone to change html each week. 

## Design and Bootrap
I am loving bootstrap. I spent time playing with the site on my iphone and playing with Sass. I improved my Sass skills in this project.
The site has a black background, and my first impression was yeck but use of white space or black space made a
difference.

## Overall Lessons 
People hate signing into sites. I used devise with no sign up link
so create more or less an admin for the current user to add content. 

## Contribution
None really needed but if you are a hobbyist learning Ruby on Rails, nice to meet you.