# Maddie [![Build Status](https://travis-ci.org/sophomoric/maddie.svg?branch=master)](https://travis-ci.org/sophomoric/maddie)
[![Code Climate](https://codeclimate.com/github/sophomoric/maddie/badges/gpa.svg)](https://codeclimate.com/github/sophomoric/maddie)
[![Test Coverage](https://codeclimate.com/github/sophomoric/maddie/badges/coverage.svg)](https://codeclimate.com/github/sophomoric/maddie/coverage)
[![Issue Count](https://codeclimate.com/github/sophomoric/maddie/badges/issue_count.svg)](https://codeclimate.com/github/sophomoric/maddie)

A web app for uploading and displaying custom content.

Models

* User
   - Can register multiple domains with custom content for each one.
   - This allows this app to sit on one machine but serve content specific to
     a domain or subdomain

* Pages
   - By default the root url shows all pages tied to a user
   - A user can edit the page content. Markdown allows pictures to be inserted
     into the body of the page.

* Projects
   - Projects allow photos to be uploaded. A project can have a description,
     title, cover photo, and multiple other photos.
   - The UI for displaying projects is a work in progress. This might be removed
     for simplicity

* Meta properties
    - Each domain can change the root page content. For example, if someone has
      a birthday, I could honor them with a quick custom message stored in the
      `root_content` column of the meta_property_list. That way the message is
      available at `adriancann.com` rather than a page
      `adriancann.com/happy-birthday`
    - The more serious reason is that some people may not want the rootmenu as
      is.

Current Hosting:

* This project is deployed to a digital ocean droplet running Ubuntu, Phusion
  Passenger and NGINX.
* For details about the woes of setup and deployment: visit <a
  href="http://www.adriancann.com">adriancann.com</a> and hope I have posted
  some content.

Wish list of features:
  * Pretty codeblocks
  * Large photo upload solution
  * Https (free certs available!)
  * Setup app with docker or vagrant.
