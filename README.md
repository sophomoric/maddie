# Maddie

A web app for uploading and displaying custom content.

Models

* Users
   - Users have a host property (e.g. www.adriancann.com)
   - This allows this app to sit on one machine but serve content specific to
     a domain or subdomain

* Projects
   - Projects allow photos to be uploaded. A project can have a description,
     title, cover photo, and multiple other photos.

* Pages
   - The root url shows all pages tied to a user (associated with the visited
     domain)
   - A user can edit the page content. Markdown allows pictures to be inserted
     into the body of the page.


Deployment

* This project is deployed to a digital ocean droplet running Ubuntu. Passenger
  and NGINX.
* For details about the woes of setup and deployment: visit <a
  href="http://www.adriancann.com">adriancann.com</a> and hope I have posted
  some content.


