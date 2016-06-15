# Maddie

A web app for uploading and displaying custom content.

Models

* User
   - Can register multiple domains with custom content
   - This allows this app to sit on one machine but serve content specific to
     a domain or subdomain

* Projects
   - Projects allow photos to be uploaded. A project can have a description,
     title, cover photo, and multiple other photos.
   - The UI for displaying projects is a work in progress. This might be removed
     for simplicity

* Pages
   - The root url shows all pages tied to a user
   - A user can edit the page content. Markdown allows pictures to be inserted
     into the body of the page.


Deployment

* This project is deployed to a digital ocean droplet running Ubuntu. Phusion
  Passenger
  and NGINX.
* For details about the woes of setup and deployment: visit <a
  href="http://www.adriancann.com">adriancann.com</a> and hope I have posted
  some content.

Wish list of features:
  * Associate content with domains rather than users so that a single login can
    manage different content
  * Pretty codeblocks
  * Large photo upload solution
  * Https (free certs available!)
